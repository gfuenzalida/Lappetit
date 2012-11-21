using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using L_Appetit.Models;
using System.Collections;

namespace L_Appetit.Controllers
{
    public class ClienteController : Controller
    {
        //
        // GET: /Cliente/

        public ActionResult ConsultarMenu()
        {
                        
            return View();
        }

        [HttpPost]
        public ActionResult ConsultarMenu()
        {
            ArrayList ListaEntrada = new ArrayList();
            ArrayList ListaFondo = new ArrayList();
            ArrayList ListaPostre = new ArrayList();
            ArrayList ListaBebestible = new ArrayList();

            var fecha = Convert.ToDateTime("2010-01-01 00:00:00.000");
            bool horario = true;
            LinqDBDataContext db = new LinqDBDataContext();
            var menu = from item in db.ITEM
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
            
            return View();
        }

        public ActionResult ConsultarReservasCliente()
        {
            return View();
        }

        public ActionResult EditarPerfilCliente()
        {
            return View();
        }
        public ActionResult HacerReserva()
        {
           
            return View();
        }

        public ActionResult EditarPerfil()
        {
            return View();
        }


    }
}
