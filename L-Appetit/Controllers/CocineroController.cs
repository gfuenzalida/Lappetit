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

            ViewBag.Fecha = fecha.ToString("dd-MM-yy");
            ViewBag.Horario = modelo.horario.ToString();

            return View(modelo);
        }

        [HttpPost]
        public ActionResult AgregarMenu(AgregarMenuModel modelo, string btn_submit)
        {

            string date = Request.Form["__DATE"];
            bool _horario = false;
            if (modelo != null)
            {
                if (Request.Form["__HORARIO"] != null)
                {
                    if (Request.Form["__HORARIO"] == "True")
                        _horario = true;
                    else if (Request.Form["__HORARIO"] == "False")
                        _horario = false;
                }
                else
                {
                    _horario = modelo.horario;
                }
            }


            AgregarMenuModel new_model = new AgregarMenuModel();

            ViewBag.Fecha = DateTime.Now.ToString("dd-MM-yy");
            ViewBag.Horario = false.ToString();

            if (date != null)
            {
                ViewBag.Fecha = DateTime.Parse(date);
                ViewBag.Horario = _horario;

                if (btn_submit != null)
                {
                    LinqDBDataContext db = new LinqDBDataContext();
                    db.CrearFecha(DateTime.Parse(date), _horario);
                    new_model.setMenu(Int16.Parse(modelo.selected_item), short.Parse(modelo.selected_cant), DateTime.Parse(date), _horario);
                }

                new_model.getListas();//DateTime.Parse(date)
                new_model.getMenu(DateTime.Parse(date), _horario);
            }

            return View(new_model);
        }

        public ActionResult EditarPerfilCocinero()
        {
            return View();
        }

        

    }
}
