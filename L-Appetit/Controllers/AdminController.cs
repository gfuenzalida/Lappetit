using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using L_Appetit.Models;

namespace L_Appetit.Controllers
{
    [Authorize(Roles = "Administrador")]
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
            MesasModel mesas = new MesasModel();
            try
            {
                mesas.getMesas();
            }
            catch (Exception e)
            {

            }
            
            return View(mesas);
        }

        public ActionResult EditarPerfilAdmin()
        {
            return View();
        }

        public ActionResult Auditoria()
        {
            return View();
        }

        public ActionResult ResultAuditoria()
        {
            return View();
        }

    }
}
