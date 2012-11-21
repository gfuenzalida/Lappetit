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
        public ActionResult ConsultarMenu(DateTime fecha)
        {
            ArrayList ListaEntrada = new ArrayList();
            ArrayList ListaFondo = new ArrayList();
            ArrayList ListaPostre = new ArrayList();
            ArrayList ListaBebestible = new ArrayList();

            //var fecha = Convert.ToDateTime("2010-01-01 00:00:00.000");
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

        public ActionResult ConsultarReserva()
        {

            return View();
        }
        
        [HttpPost]
        public ActionResult ConsultarReserva(string rut)
        {
            //var fecha = Convert.ToDateTime("2010-01-02 00:00:00.000");
            //bool horario = true;
            LinqDBDataContext db = new LinqDBDataContext();
            var r = from reserva in db.RESERVA
                    where
                      //reserva.FECHA == Convert.ToDateTime("2010-01-02 00:00:00.000") &&
                      //reserva.HORARIO == Convert.ToBoolean("True") &&
                      reserva.RUT_CLI == rut
                    select new
                    {
                        reserva.FECHA,
                        reserva.HORARIO,
                        reserva.NUMERO_COMENSALES,
                        reserva.OBSERVACIONES
                    };
            return View();
        }

        public ActionResult EditarPerfilCliente()
        {
            return View();
        }

        public ActionResult HacerReserva()
        {
            /*LinqDBDataContext db = new LinqDBDataContext();
            CLIENTE c1 = new CLIENTE { RUT_CLI = model.UserName, NOMBRE_CLI = nombre, SEXO_CLIENTE = model.Sexo, CORREO_CLI = model.Email, TELEFONO_CLI = Convert.ToInt32(model.Telefono), TICKETS_RECIBIDOS = 0 };*/
            return View();
        }
        
        [HttpPost]
        public ActionResult HacerReserva(string nada)
        {/*
            LinqDBDataContext db = new LinqDBDataContext();

            RESERVA iRESERVA = new RESERVA
            {
                CODIGO_MESA = 2,
                RUT_CLI = "17490314-K",
                FECHA = Convert.ToDateTime("2010-01-04 00:00:00.000"),
                HORARIO = true,
                NUMERO_COMENSALES = Convert.ToInt16(4)
            };
            db.RESERVA.InsertOnSubmit(iRESERVA);
            db.SubmitChanges();*/
            return View();
        }



        public ActionResult EditarPerfil()
        {
            return View();
        }


    }
}
