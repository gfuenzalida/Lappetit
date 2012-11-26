using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using L_Appetit.Validations;

namespace L_Appetit.Models
{
    public class AgregarMenuModel
    {
        public DateTime fecha;
        public Int32 item;
        public Int16 cantidad;
        
        [Display(Name = "horario")]
        public bool horario { get; set; }

        public IEnumerable<SelectListItem> Horarios
        {
            get
            {
                IList<SelectListItem> horario_select = new List<SelectListItem>();// = new IEnumerable<SelectListItem>();
                SelectListItem sli = new SelectListItem();
                sli.Text = "Almuerzo";
                sli.Value = "False";
                horario_select.Add(sli);
                sli = new SelectListItem();
                sli.Text = "Cena";
                sli.Value = "True";
                horario_select.Add(sli);
                return horario_select;
            }
        }

        public List<SelectListItem> ListaEntrada { get; set; }
        public List<SelectListItem> ListaFondo { get; set; }
        public List<SelectListItem> ListaPostre { get; set; }

        public List<SelectListItem> ListaMenu { get; set; }
        public List<int> cantidades { get; set; }

        [Display(Name = "selected_item")]
        public string selected_item { get; set; }

        [Display(Name = "selected_cant")]
        public string selected_cant { get; set; }

        public AgregarMenuModel()
        {
            ListaEntrada = new List<SelectListItem>();
            ListaFondo = new List<SelectListItem>();
            ListaPostre = new List<SelectListItem>();
            ListaMenu = new List<SelectListItem>();
            cantidades = new List<int>();

            selected_item = "";
            selected_cant = "";
        }

        public void getListas(){

            ListaEntrada = new List<SelectListItem>();
            ListaFondo = new List<SelectListItem>();
            ListaPostre = new List<SelectListItem>();
            
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
            }
        }

        public void getMenu(DateTime fecha, bool horario)
        {
            this.fecha = fecha;
            this.horario = horario;
            ListaMenu = new List<SelectListItem>();

            LinqDBDataContext db = new LinqDBDataContext();

            var menu = (from item in db.ITEM
                        from menu_fecha in db.MENU_FECHA
                        from tipo_item in db.TIPO_ITEM
                        where
                            menu_fecha.FECHA == fecha &&
                            menu_fecha.HORARIO == horario &&
                            item.CODIGO_ITEM == menu_fecha.CODIGO_ITEM &&
                            tipo_item.CODIGO_TIPO_ITEM == item.CODIGO_TIPO_ITEM
                        select new
                        {
                            tipo_item.NOMBRE_TIPO_ITEM,
                            item.NOMBRE_ITEM,
                            item.CODIGO_ITEM,
                            menu_fecha.MENU_ITEM_CANTIDAD
                        }
                        );

            foreach (var item in menu)
            {
                SelectListItem sli = new SelectListItem();
                sli.Text = item.NOMBRE_ITEM;
                sli.Value = item.CODIGO_ITEM.ToString();
                ListaMenu.Add(sli);
                cantidades.Add(item.MENU_ITEM_CANTIDAD.Value);

            }
        }

        public void setMenu(Int32 item, Int16 cantidad, DateTime fecha, Boolean horario) 
        {

            LinqDBDataContext db = new LinqDBDataContext();
            MENU_FECHA iMENU_FECHA = new MENU_FECHA
            {
                FECHA = fecha,
                HORARIO = horario,
                CODIGO_ITEM = item,
                MENU_ITEM_CANTIDAD = cantidad
            };
            db.MENU_FECHA.InsertOnSubmit(iMENU_FECHA);
            db.SubmitChanges();
        }
    }

    public class AgregarItemModel
    {
        [Required]
        [Display(Name = "tipo_item")]
        public string tipo_item;

        public IEnumerable<SelectListItem> Tipos
        {
            get
            {
                IList<SelectListItem> tipos_select = new List<SelectListItem>();
                LinqDBDataContext db = new LinqDBDataContext();

                var tipos = (from tipo_item in db.TIPO_ITEM
                            select new
                            {
                                tipo_item.NOMBRE_TIPO_ITEM,
                                tipo_item.CODIGO_TIPO_ITEM
                            }
                            );
                foreach (var tipo in tipos)
                {
                    SelectListItem sli = new SelectListItem();
                    sli.Text = tipo.NOMBRE_TIPO_ITEM;
                    sli.Value = tipo.CODIGO_TIPO_ITEM.ToString();
                    tipos_select.Add(sli);
                }
                return tipos_select;
            }
        }

        [Required (ErrorMessage= "No ha ingresado ningún nombre")]
        [Display(Name = "nombre_item")]
        public string nombre_item;

        [Display(Name = "descripcion_item")]
        public string descripcion_item;

        public AgregarItemModel()
        {
            nombre_item = "";
            descripcion_item = "";
            tipo_item = "";
        }
    }

}