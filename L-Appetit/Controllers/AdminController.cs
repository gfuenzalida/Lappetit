using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace L_Appetit.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        public ActionResult ConsultarReservas()
        {
            return View();
        }

        public ActionResult ConsultarHistorial()
        {
            return View();
        }

        public ActionResult GestionarUsuarios()
        {
            return View();
        }

        public ActionResult GestionarMesas()
        {
            return View();
        }

        public ActionResult EditarPerfilAdmin()
        {
            return View();
        }

        public ActionResult Auditoria()
        {
            return View();
        }

    }
}
