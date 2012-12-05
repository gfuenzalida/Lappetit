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

        
        public ActionResult EditarPerfilCocinero()
        {
            return View();
        }

        

    }
}
