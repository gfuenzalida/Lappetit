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
        public List<string> ListaEntrada { get; set; }
        public List<string> ListaFondo { get; set; }
        public List<string> ListaBebestible { get; set; }
        public List<string> ListaPostre { get; set; }

        public void GetItems(string date)
        {
            ListaEntrada = new List<string>();
            ListaFondo = new List<string>();
            ListaPostre = new List<string>();
            ListaBebestible = new List<string>();

            fecha = Convert.ToDateTime(date);
            bool horario = false;
            LinqDBDataContext db = new LinqDBDataContext();
            var menu = from item in db.ITEM
                       from menu_fecha in db.MENU_FECHA
                       from tipo_item in db.TIPO_ITEM
                       where
                         menu_fecha.FECHA == fecha &&
                         menu_fecha.HORARIO == false &&
                         item.CODIGO_ITEM == menu_fecha.CODIGO_ITEM &&
                         tipo_item.CODIGO_TIPO_ITEM == item.CODIGO_TIPO_ITEM
                       select new
                       {
                           tipo_item.NOMBRE_TIPO_ITEM,
                           item.NOMBRE_ITEM
                       };
            foreach (var item in menu)
            {
                if (item.NOMBRE_TIPO_ITEM.Equals("Entrada"))
                {
                    ListaEntrada.Add(item.NOMBRE_ITEM);
                }
                else if (item.NOMBRE_TIPO_ITEM.Equals("Plato de fondo"))
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
        }
    }
}