using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using L_Appetit.Models;

namespace L_Appetit.Controllers
{
    [Authorize(Roles = "Garzón")]
    public class GarzonController : Controller
    {
        //
        // GET: /Garzon/

        public ActionResult TomarPedido()
        {
            return View();
        }

        public ActionResult ConsultarReserva()
        {
            DateTime fecha = DateTime.Now.Date;

            if (fecha.DayOfWeek == DayOfWeek.Saturday)
                fecha = DateTime.Now.AddDays(2).Date;
            else if (fecha.DayOfWeek == DayOfWeek.Sunday)
                fecha = DateTime.Now.AddDays(1).Date;

            MesasModel modelo = new MesasModel();
            modelo.getMesasReserva(fecha, false);

            ViewBag.Fecha = fecha.ToString("dd-MM-yyy");


            return View(modelo);
        }

        [HttpPost]
        public ActionResult ConsultarReserva(MesasModel modelo)
        {
            string date = Request.Form["__DATE"];
            string operacion = Request.Form["op"];
            MesasModel _modelo = new MesasModel();

            DateTime fecha = DateTime.Now.Date;

            if (fecha.DayOfWeek == DayOfWeek.Saturday)
                fecha = DateTime.Now.AddDays(2).Date;
            else if (fecha.DayOfWeek == DayOfWeek.Sunday)
                fecha = DateTime.Now.AddDays(1).Date;

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

        public ActionResult EnviarInvitacionesGarzon()
        {
            return View();
        }

    }
}
