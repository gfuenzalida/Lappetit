using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using L_Appetit.Models;

namespace L_Appetit.Controllers
{
    public class AccountController : Controller
    {

        //
        // GET: /Account/LogOn
        public ActionResult LogOn()
        {
            if (/*!Request.IsAuthenticated &&*/ !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                // This is an unauthorized, authenticated request...
                Response.Redirect("~/Home/UnauthorizedAccess");
            }

            if (Request.IsAuthenticated)
            {
                if (Roles.IsUserInRole(User.Identity.Name, "Administrador"))
                {
                    return RedirectToAction("ConsultarReservas", "Admin");
                }
                else if (Roles.IsUserInRole(User.Identity.Name, "Cliente"))
                {
                    return RedirectToAction("ConsultarReserva", "Cliente");
                }
                else if (Roles.IsUserInRole(User.Identity.Name, "Cocinero"))
                {
                    return RedirectToAction("VerPedidos", "Cocinero");
                }
                else if (Roles.IsUserInRole(User.Identity.Name, "Funcionario"))
                {
                    return RedirectToAction("EnviarInvitacionFuncionario", "Funcionario");
                }
                else if (Roles.IsUserInRole(User.Identity.Name, "Garzón"))
                {
                    return RedirectToAction("ConsultarReserva", "Garzon");
                }
                else 
                { 
                // Fail
                }
            }
            

            return View();
        }
        //
        // POST: /Account/LogOn

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (Membership.ValidateUser(model.UserName, model.Password))
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                    if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                        && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                    {
                        return Redirect(returnUrl);
                    }
                    else if (Roles.IsUserInRole(model.UserName, "Administrador"))
                    {
                        return RedirectToAction("ConsultarReservas", "Admin");
                    }
                    else if (Roles.IsUserInRole(model.UserName, "Cliente"))
                    {
                        return RedirectToAction("ConsultarReserva", "Cliente");
                    }
                    else if (Roles.IsUserInRole(model.UserName, "Cocinero"))
                    {
                        return RedirectToAction("VerPedidos", "Cocinero");
                    }
                    else if (Roles.IsUserInRole(model.UserName, "Funcionario"))
                    {
                        return RedirectToAction("EnviarInvitacionFuncionario", "Funcionario");
                    }
                    else if (Roles.IsUserInRole(model.UserName, "Garzón"))
                    {
                        return RedirectToAction("ConsultarReserva", "Garzon");
                    }                   
                    else // Si no tiene ningún Rol --> Fail
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Contraseña o usuario incorrecto.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/LogOff

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("LogOn", "Account");
        }

        //
        // GET: /Account/Register

        public ActionResult Register()
        {
            var model = new L_Appetit.Models.RegisterModel();
            return View(model);
        }

        //
        // POST: /Account/Register

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {

            
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus;
                Membership.CreateUser(model.UserName, model.Password, model.Email, null, null, true, null, out createStatus);
                model.RegistroCliente();
                if (createStatus == MembershipCreateStatus.Success)
                {

                    FormsAuthentication.SetAuthCookie(model.UserName, false /* createPersistentCookie */);
                    Roles.AddUserToRole(model.UserName, "Cliente");
                    return RedirectToAction("ConsultarReserva", "Cliente");
                }
                else
                {
                    ModelState.AddModelError("", ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePassword

        [Authorize]
        public ActionResult ChangePassword()
        {
            return View();
        }

        //
        // POST: /Account/ChangePassword

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {

                // ChangePassword will throw an exception rather
                // than return false in certain failure scenarios.
                bool changePasswordSucceeded;
                try
                {
                    MembershipUser currentUser = Membership.GetUser(User.Identity.Name, true /* userIsOnline */);
                    changePasswordSucceeded = currentUser.ChangePassword(model.OldPassword, model.NewPassword);
                }
                catch (Exception)
                {
                    changePasswordSucceeded = false;
                }

                if (changePasswordSucceeded)
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                else
                {
                    ModelState.AddModelError("", "El usuario y/o la contraseña son invalidos");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePasswordSuccess

        public ActionResult ChangePasswordSuccess()
        {
            return View();
        }

        #region Status Codes
        public static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "Usuario invalido. Intente de nuevo";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        #endregion
    }
}
