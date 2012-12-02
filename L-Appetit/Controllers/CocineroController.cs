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
    [Authorize(Roles = "Cliente")]
    public class CocineroController : Controller
    {
        //
        // GET: /Cocinero/

        public ActionResult VerMenu()
        {
            MenuModel modelo = new MenuModel();
            
            DateTime fecha = DateTime.Now.Date;

            if (fecha.DayOfWeek == DayOfWeek.Saturday)
                fecha = DateTime.Now.AddDays(2).Date;
            else if (fecha.DayOfWeek == DayOfWeek.Sunday)
                fecha = DateTime.Now.AddDays(1).Date;

            modelo.GetItems(fecha, false);

            //ViewData.Model = modelo;

            ViewBag.Fecha = fecha.ToString("dd-MM-yyy");

            return View(modelo);
        }

        [HttpPost]
        public ActionResult VerMenu(MenuModel modelo)
        {
            string date = Request.Form["__DATE"];
            MenuModel new_model = new MenuModel();

            DateTime fecha = DateTime.Now.Date;
            if (fecha.DayOfWeek == DayOfWeek.Saturday)
                fecha = DateTime.Now.AddDays(2).Date;
            else if (fecha.DayOfWeek == DayOfWeek.Sunday)
                fecha = DateTime.Now.AddDays(1).Date;

            ViewBag.Fecha = fecha.ToString("dd-MM-yyy");

            if (date != null)
            {
                new_model.GetItems(DateTime.Parse(date), modelo.horario);//DateTime.Parse(date)
                ViewBag.Fecha = new_model.fecha.ToString("dd-MM-yyy");
            }

            return View(new_model);
        }

        public ActionResult VerPedidos()
        {
            return View();
        }

        public ActionResult AgregarItem()
        {
            AgregarItemModel modelo = new AgregarItemModel();
            return View(modelo);
        }

        [HttpPost]
        public ActionResult AgregarItem(AgregarItemModel modelo)
        {
            if (ModelState.IsValid)
            {
                modelo.setItem(Int16.Parse(modelo.tipo_item), modelo.nombre_item, modelo.descripcion_item);
            }
            else
            {
                ViewBag.Error = true;
            }

            ModelState.Clear();
            
            return View(modelo);
        }

        public ActionResult EnviarInvitaciones()
        {
            return View();
        }

        public ActionResult AgregarMenu()
        {
            AgregarMenuModel modelo = new AgregarMenuModel();

            DateTime fecha = DateTime.Now.Date;

            if (fecha.DayOfWeek == DayOfWeek.Saturday)
                fecha = DateTime.Now.AddDays(2).Date;
            else if (fecha.DayOfWeek == DayOfWeek.Sunday)
                fecha = DateTime.Now.AddDays(1).Date;

            ViewBag.Fecha = fecha.ToString("dd-MM-yy");

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

            DateTime fecha = DateTime.Now.Date;
            
            if (fecha.DayOfWeek == DayOfWeek.Saturday)
                fecha = DateTime.Now.AddDays(2).Date;
            else if (fecha.DayOfWeek == DayOfWeek.Sunday)
                fecha = DateTime.Now.AddDays(1).Date;

            ViewBag.Fecha = fecha.ToString("dd-MM-yy");

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
