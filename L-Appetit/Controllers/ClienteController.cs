using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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

        public ActionResult ConsultarReservasCliente()
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

    }
}
