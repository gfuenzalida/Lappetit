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

        [HttpPost]
        public ActionResult GestionarMesas(MesasModel mesas)
        {
            string operacion = Request.Form["op"];
            
            if (operacion == "add")
            {
                string pos_x = Request.Form["x_mesa"];
                string pos_y = Request.Form["y_mesa"];
                string cant_max = Request.Form["max_mesa"];

                Mesa new_mesa = new Mesa();

                new_mesa.pos_x = Int16.Parse(pos_x);
                new_mesa.pos_y = Int16.Parse(pos_y);
                new_mesa.cant_maxima = Int16.Parse(cant_max);

                try
                {
                    new_mesa.RegistrarMesa();
                }
                catch
                {
                    ViewBag.ERROR = "La operación no ha podido realizarse";
                }

            }
            else if (operacion == "rm")
            {
                string id_mesa = Request.Form["id_mesa"];
                string pos_x = Request.Form["x_mesa"];
                string pos_y = Request.Form["y_mesa"];

                Mesa _mesa = new Mesa();

                _mesa.id_mesa = Int16.Parse(id_mesa);

                try
                {
                    _mesa.UpdateMesa(Int16.Parse(pos_x),Int16.Parse(pos_x));
                }
                catch
                {
                    ViewBag.ERROR = "La operación no ha podido realizarse";
                }

            }
            else if (operacion == "mv")
            {

            }


            MesasModel _mesas = new MesasModel();
            try
            {
                _mesas.getMesas();
            }
            catch (Exception e)
            {

            }
            return View(_mesas);
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
