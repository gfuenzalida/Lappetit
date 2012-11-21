using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using L_Appetit.Models;
using L_Appetit.Models.Cliente;
using System.Collections;
using System.Collections.Specialized;

namespace L_Appetit.Controllers
{
    public class ClienteController : Controller
    {
        //
        // GET: /Cliente/
        [HttpGet]
        public ActionResult ConsultarMenu()
        {
            NameValueCollection coll = HttpContext.Request.Form;

            MenuModel modelo = new MenuModel();
            var fecha = "10/8/2012 12:00:00 AM";
            modelo.GetItems(fecha);

            ViewData.Model = modelo;
                        
            return View(modelo);
        }

        [HttpPost]
        public ActionResult ConsultarMenu(MenuModel modelo)
        {
            
            
            return View(modelo);
        }

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
        
        [HttpPost]
        public ActionResult ConsultarReserva()
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
