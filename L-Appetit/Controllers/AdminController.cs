using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
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
            GestionUsuariosModel model = new GestionUsuariosModel();
            return View(model);
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


        [HttpPost]
        public ActionResult GestionarUsuarios(GestionUsuariosModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus;
                Membership.CreateUser(model.UserName, model.Password, model.Email, null, null, true, null, out createStatus);
               
                if (createStatus == MembershipCreateStatus.Success)
                {
                    MembershipUser tempUser = Membership.GetUser(model.UserName);
                    tempUser.Comment = model.Nombre;
                    Membership.UpdateUser(tempUser);

                    int tipo = Int16.Parse(Request.Form["tipo"]);
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

                    model = new GestionUsuariosModel();
                    ModelState.Clear();
                }
                else
                {
                    ModelState.AddModelError("", L_Appetit.Controllers.AccountController.ErrorCodeToString(createStatus));
                }
            }
            return View(model);
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
