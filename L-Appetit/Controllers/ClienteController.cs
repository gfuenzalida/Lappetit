using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Mvc;
using L_Appetit.Models;
using System.Collections;
using System.Collections.Specialized;

namespace L_Appetit.Controllers
{
    //[Authorize(Roles = "Cliente")]
    public class ClienteController : Controller
    {
        //
        // GET: /Cliente/
        [HttpGet]
        public ActionResult ConsultarMenu()
        {
            MenuModel modelo = new MenuModel();
            DateTime fecha = DateTime.Now.Date;
            modelo.GetItems(fecha,false);

            //ViewData.Model = modelo;

            ViewBag.Fecha = fecha.ToString("dd-MM-yyy");
                        
            return View(modelo);
        }

        [HttpPost]
        public ActionResult ConsultarMenu(MenuModel modelo)
        {
            string date = Request.Form["__DATE"];
            MenuModel new_model = new MenuModel();
            ViewBag.Fecha = DateTime.Now.ToString("dd-MM-yyy");
            if (date != null)
            {
                new_model.GetItems(DateTime.Parse(date), modelo.horario);//DateTime.Parse(date)
                ViewBag.Fecha = new_model.fecha.ToString("dd-MM-yyy");
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

        [HttpGet]
        public ActionResult HacerReserva()
        {
            DateTime fecha = DateTime.Now.Date;
            MesasModel modelo = new MesasModel();
            modelo.getMesasReserva(fecha, false);

            ViewBag.Fecha = fecha.ToString("dd-MM-yyy");
                        
            
            return View(modelo);
        }
        
        [HttpPost]
        public ActionResult HacerReserva(MesasModel modelo)
        {
            string date = Request.Form["__DATE"];

            MesasModel _modelo = new MesasModel();

            ViewBag.Fecha = DateTime.Now.ToString("dd-MM-yyy");
            if (date != null)
            {
                _modelo.getMesasReserva(DateTime.Parse(date), modelo.horario);//DateTime.Parse(date)
                ViewBag.Fecha = _modelo.fecha.ToString("dd-MM-yyy");
            }

            return View(_modelo);
        }



        public ActionResult EditarPerfil()
        {
            return View();
        }


    }
}
