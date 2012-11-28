using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace L_Appetit.Controllers
{
    [Authorize(Roles = "Funcionario")]
    public class FuncionarioController : Controller
    {
        //
        // GET: /Funcionario/

        public ActionResult EnviarInvitacionFuncionario()
        {
            return View();
        }

        public ActionResult EditarPerfilFuncionario()
        {
            return View();
        }

    }
}
