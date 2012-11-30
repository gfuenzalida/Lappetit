using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace L_Appetit.Controllers
{
    //[Authorize(Roles = "Garzón")]
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
            return View();
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
