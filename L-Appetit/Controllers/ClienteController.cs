using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
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
            MenuModel modelo = new MenuModel();
            DateTime fecha = DateTime.Now.Date;
            modelo.GetItems(fecha);

            //ViewData.Model = modelo;

            ViewBag.Fecha = fecha.ToString("dd/MM/yy");
                        
            return View(modelo);
        }

        [HttpPost]
        public ActionResult ConsultarMenu(MenuModel modelo)
        {
            string date = Request.Form["__DATE"];
            MenuModel new_model = new MenuModel();
            ViewBag.Fecha = DateTime.Now.ToString("dd/MM/yy");
            if (date != null)
            {
                new_model.GetItems(DateTime.Parse(date));//DateTime.Parse(date)
                ViewBag.Fecha = new_model.fecha.ToString("dd/MM/yy");
            }
                        
            return View(new_model);
        }

        public ActionResult ConsultarReserva()
        {
            ReservaModel modelo = new ReservaModel();
            String rut = HttpContext.User.Identity.Name;
            modelo.GetReservas(rut);

            return View(modelo);
        }
        
        [HttpPost]
        public ActionResult ConsultarReserva(ReservaModel modelo)
        {

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
