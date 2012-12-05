using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using L_Appetit.Models;

namespace L_Appetit.Controllers
{
    [Authorize(Roles = "Funcionario")]
    public class FuncionarioController : Controller
    {
        //
        // GET: /Funcionario/

        public ActionResult EnviarInvitacionFuncionario()
        {
            EnviarInvitacionModel model = new EnviarInvitacionModel();

            return View(model);
        }
        [HttpPost]
        public ActionResult EnviarInvitacionFuncionario(EnviarInvitacionModel modelo)
        {
            if (ModelState.IsValid)
            {
                modelo.rutContacto = User.Identity.Name;
                int resp = modelo.SetInvitacion();
                if (resp == 1)
                {
                    TempData.Add("Resp", "Invitación enviada correctamente");
                    ModelState.Clear();
                    modelo = new EnviarInvitacionModel();
                }
                else if (resp == 0)
                {
                    TempData.Add("Resp", "No posee invitaciones para enviar");
                }
                else if (resp == -1)
                {
                    TempData.Add("Resp", "El RUT ingresado no pertenece al sistema");
                }
            }

            return View(modelo);
        }

        public ActionResult EditarPerfilFuncionario()
        {
            return View();
        }

    }
}
