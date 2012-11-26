using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using L_Appetit.Models;
using System.Collections;
using System.Collections.Specialized;

namespace L_Appetit.Controllers
{
    public class CocineroController : Controller
    {
        //
        // GET: /Cocinero/

        public ActionResult VerMenu()
        {
            return View();
        }
        public ActionResult VerPedidos()
        {
            return View();
        }

        public ActionResult AgregarItem()
        {
            return View();
        }

        public ActionResult EnviarInvitaciones()
        {
            return View();
        }

        public ActionResult AgregarMenu()
        {
            AgregarMenuModel modelo = new AgregarMenuModel();
            DateTime fecha = DateTime.Now.Date;

            modelo.getListas();
            modelo.getMenu(fecha, false);

            ViewBag.Fecha = fecha.ToString("dd/MM/yy");

            return View(modelo);
        }

        [HttpPost]
        public ActionResult AgregarMenu(AgregarMenuModel modelo)
        {
            string date = Request.Form["__DATE"];
            AgregarMenuModel new_model = new AgregarMenuModel();
            ViewBag.Fecha = DateTime.Now.ToString("dd/MM/yy");
            if (date != null)
            {
                new_model.getListas();//DateTime.Parse(date)
                new_model.getMenu(DateTime.Parse(date), modelo.horario);
                ViewBag.Fecha = new_model.fecha.ToString("dd/MM/yy");
            }

            return View(new_model);
        }

        public ActionResult EditarPerfilCocinero()
        {
            return View();
        }

        

    }
}
