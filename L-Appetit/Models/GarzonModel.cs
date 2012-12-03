using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace L_Appetit.Models
{
    public class PedidoModel
    {
        public Int16 id_pedido;
        public List<SelectListItem> ListaEntrada { get; set; }
        public List<SelectListItem> ListaFondo { get; set; }
        public List<SelectListItem> ListaPostre { get; set; }
        public List<SelectListItem> ListaBebestible {get; set;}

        public List<ItemPedido> ListaPedido { get; set; }
        public List<int> cantidades { get; set; }

        [Display(Name = "selected_item")]
        public string selected_item { get; set; }

        [Display(Name = "selected_cant")]
        [Required(ErrorMessage = "No ingresada")]
        [RegularExpression(@"[1-9]+[0-9]*", ErrorMessage = "Sólo números")]
        public string selected_cant { get; set; }

        [Display(Name = "observacion")]
        public string observacion {get;set;}


        public PedidoModel()
        {
            ListaEntrada = new List<SelectListItem>();
            ListaFondo = new List<SelectListItem>();
            ListaPostre = new List<SelectListItem>();
            ListaBebestible = new List<SelectListItem>();
            ListaPedido = new List<ItemPedido>();
            cantidades = new List<int>();

            selected_item = "";
            selected_cant = "";
            observacion = "";
        }

        public void getListas(){

            ListaEntrada = new List<SelectListItem>();
            ListaFondo = new List<SelectListItem>();
            ListaPostre = new List<SelectListItem>();
            ListaBebestible = new List<SelectListItem>();

            LinqDBDataContext db = new LinqDBDataContext();

            var menu = (from item in db.ITEM
                        from tipo_item in db.TIPO_ITEM
                        where
                            tipo_item.CODIGO_TIPO_ITEM == item.CODIGO_TIPO_ITEM
                        select new
                        {
                            tipo_item.NOMBRE_TIPO_ITEM,
                            item.NOMBRE_ITEM,
                            item.CODIGO_ITEM
                        }
                        );

            foreach (var item in menu)
            {
                SelectListItem sli = new SelectListItem();
                sli.Text = item.NOMBRE_ITEM;
                sli.Value = item.CODIGO_ITEM.ToString();
                if (item.NOMBRE_TIPO_ITEM.Equals("Entrada"))
                {
                    ListaEntrada.Add(sli);
                }
                else if (item.NOMBRE_TIPO_ITEM.Equals("Plato de Fondo"))
                {
                    ListaFondo.Add(sli);
                }
                else if (item.NOMBRE_TIPO_ITEM.Equals("Postre"))
                {
                    ListaPostre.Add(sli);
                }
                else if (item.NOMBRE_TIPO_ITEM.Equals("Bebestible"))
                {
                    ListaBebestible.Add(sli);
                }
            }
        }

        public void getPedido()
        {
            ListaPedido = new List<ItemPedido>();

            LinqDBDataContext db = new LinqDBDataContext();

            var det_pedido = (from item in db.ITEM
                        from pedido in db.DETALLE_PEDIDO
                        from tipo_item in db.TIPO_ITEM
                        where
                            pedido.CODIGO_PEDIDO == this.id_pedido &&
                            item.CODIGO_ITEM == pedido.CODIGO_ITEM &&
                            tipo_item.CODIGO_TIPO_ITEM == item.CODIGO_TIPO_ITEM
                        select new
                        {
                            tipo_item.NOMBRE_TIPO_ITEM,
                            item.NOMBRE_ITEM,
                            item.CODIGO_ITEM,
                            pedido.DETALLE_ITEM_CANTIDAD,
                            pedido.DETALLE_ITEM_OBSERVACION
                        }
                        );

            foreach (var item in det_pedido)
            {
                ItemPedido itp = new ItemPedido();
                itp.nom_item = item.NOMBRE_ITEM;
                itp.cod_item = (Int16)item.CODIGO_ITEM;
                itp.cantidad = (Int16)item.DETALLE_ITEM_CANTIDAD;
                itp.observacion = item.DETALLE_ITEM_OBSERVACION;
                ListaPedido.Add(itp);
            }
        }

        public int setPedido(Int32 item, Int16 cantidad, string observacion) 
        {

            LinqDBDataContext db = new LinqDBDataContext();
            int resp;
            try
            {
                resp = (Int32)db.AddItemPedido(item, cantidad, this.id_pedido, observacion);
            }
            catch
            {
                resp = -1;
            }
            return resp;  
        }
    }

    public class ItemPedido
    {
        public Int16 cod_item { get; set;}
        public string nom_item { get; set; }
        public Int16 cantidad { get; set; }
        public string observacion { get; set; }
    }
}