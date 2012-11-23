using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace L_Appetit.Models.Cliente
{
    public class MenuModel
    {
        public DateTime fecha;
        public string _tag;
        public List<string> ListaEntrada { get; set; }
        public List<string> ListaFondo { get; set; }
        public List<string> ListaBebestible { get; set; }
        public List<string> ListaPostre { get; set; }

        public MenuModel()
        {
            ListaBebestible = new List<string>();
            ListaEntrada = new List<string>();
            ListaFondo = new List<string>();
            ListaPostre = new List<string>();
            _tag = "hola";
        }
        public void GetItems(DateTime fecha)
        {
            this.fecha = fecha;
            ListaEntrada = new List<string>();
            ListaFondo = new List<string>();
            ListaPostre = new List<string>();
            ListaBebestible = new List<string>();

            //DateTime fecha = Convert.ToDateTime(date);
            bool horario = true;
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
                            item.NOMBRE_ITEM
                        }
                        ).Union((
                        from item in db.ITEM
                        from tipo_item in db.TIPO_ITEM
                        where
                            tipo_item.CODIGO_TIPO_ITEM == 4 &&
                            item.CODIGO_TIPO_ITEM == 4

                        select new
                        {
                            tipo_item.NOMBRE_TIPO_ITEM,
                            item.NOMBRE_ITEM
                        }
                        )
                        );

            foreach (var item in menu)
            {
                if (item.NOMBRE_TIPO_ITEM.Equals("Entrada"))
                {
                    ListaEntrada.Add(item.NOMBRE_ITEM);
                }
                else if (item.NOMBRE_TIPO_ITEM.Equals("Plato de Fondo"))
                {
                    ListaFondo.Add(item.NOMBRE_ITEM);
                }
                else if (item.NOMBRE_TIPO_ITEM.Equals("Postre"))
                {
                    ListaPostre.Add(item.NOMBRE_ITEM);
                }
                else if (item.NOMBRE_TIPO_ITEM.Equals("Bebestible"))
                {
                    ListaBebestible.Add(item.NOMBRE_ITEM);
                }
            }

            //ListaEntrada.Sort();
            //ListaFondo.Sort();
            //ListaPostre.Sort();
            //ListaBebestible.Sort();
        }
    }
}