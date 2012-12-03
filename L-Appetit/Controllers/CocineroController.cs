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
    [Authorize(Roles = "Cocinero")]
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
            DateTime fecha = DateTime.Now.Date;
            bool horario = true;
            if(fecha.Hour < 17)
                horario = false;
            
            MesasModel modelo = new MesasModel();
            modelo.getMesasCocinero(fecha, horario);

            return View(modelo);
        }

        [HttpPost] // Esencialmente es sólo para efectuar Pedido como Preparado
        public ActionResult VerPedidos(MesasModel modelo)
        {
            short cod_reserva = Int16.Parse(Request.Form["id_reserva"]);

            DateTime fecha = DateTime.Now.Date;
            bool horario = true;
            if (fecha.Hour < 17)
                horario = false;

            int resp = modelo.PrepararPedido(cod_reserva);

            if (resp == 1)
                TempData.Add("Resp", "El pedido se ha actualizado con éxito");
            else if (resp == -1)
                TempData.Add("Resp", "No ha sido posible actualizar el pedido");

            modelo.getMesasCocinero(fecha, horario);

            return View(modelo);
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
                ViewBag.Fecha = DateTime.Parse(date).ToString("dd-MM-yy");
                ViewBag.Horario = _horario;

                if (btn_submit != null)
                {
                    if (ModelState.IsValid)
                    {
                        LinqDBDataContext db = new LinqDBDataContext();
                        db.CrearFecha(DateTime.Parse(date), _horario);
                        int resp = new_model.setMenu(Int16.Parse(modelo.selected_item), short.Parse(modelo.selected_cant), DateTime.Parse(date), _horario);

                        if (resp == 2)
                        {
                            TempData.Add("Resp", "El Menu se ha actualizado");
                        }
                        else if (resp == 1)
                        {
                            TempData.Add("Resp", "Se ha agregado el ítem");
                        }
                        else if (resp == -1)
                        {
                            TempData.Add("Resp", "Ha ocurrido un error inesperado");
                        }

                        ModelState.Clear();
                    }
                }
                else
                {
                    ModelState.Clear();
                    
                }
            }
            new_model.getListas();//DateTime.Parse(date)
            new_model.getMenu(DateTime.Parse(date), _horario);            

            return View(new_model);
        }

        public ActionResult EditarPerfilCocinero()
        {
            return View();
        }

        

    }
}
