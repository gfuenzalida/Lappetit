using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using L_Appetit.Models;

namespace L_Appetit.Controllers
{
    //[Authorize(Roles = "Administrador")]
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
            var model = new L_Appetit.Models.GestionUsuariosModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult GestionarUsuarios(GestionUsuariosModel model, int tipo)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus;
                Membership.CreateUser(model.UserName, model.Password, model.Email, null, null, true, null, out createStatus);
               
                if (createStatus == MembershipCreateStatus.Success)
                {
                    model.Registro(tipo);
                    if (tipo == 0)
                    {
                        Roles.AddUserToRole(model.UserName, "Garzón");
                    }
                    else if (tipo == 1)
                    {
                        Roles.AddUserToRole(model.UserName, "Cocinero");
                    }
                    else if (tipo == 2)
                    {
                        Roles.AddUserToRole(model.UserName, "Funcionario");
                    }
                    else if (tipo == 3)
                    {
                        Roles.AddUserToRole(model.UserName, "Administrador");
                    }
                    else { }
                    
                }
                else
                {
                    ModelState.AddModelError("", L_Appetit.Controllers.AccountController.ErrorCodeToString(createStatus));
                }
            }
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

        public ActionResult ConsultarUsuario()
        {
            return View();
        }

    }
}
