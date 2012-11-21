using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using L_Appetit.Models;

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
        {/*
            var fecha = "2010-01-01 00:00:00.000";
            bool horario = true;
            LinqDBDataContext db = new LinqDBDataContext();
            var menu = from m in db.MENU_FECHA
                       join i in db.ITEM 
                       on m.CODIGO_ITEM equals i.CODIGO_ITEM
                       select new (i.TIPO_ITEM, i.NOMBRE_ITEM);*/

            //CLIENTE c1 = new CLIENTE { RUT_CLI = model.UserName, NOMBRE_CLI = nombre, SEXO_CLIENTE = sexo, CORREO_CLI = model.Email, TELEFONO_CLI = Convert.ToInt32(model.Telefono), TICKETS_RECIBIDOS = 0 };
            //CUENTA_USUARIO u1 = new CUENTA_USUARIO {RUT_CLI = model.RUT, USERNAME = nombre, PASSWORD = model.Password };

            //CLIENTE c1 = new CLIENTE { RUT_CLI = "17490314-k", NOMBRE_CLI = "sdsd", SEXO_CLIENTE = true, CORREO_CLI = "edede", TELEFONO_CLI = 3234343, TICKETS_RECIBIDOS = 0 };

            //db.CLIENTE.InsertOnSubmit(c1);
            //db.CUENTA_USUARIO.InsertOnSubmit(u1);
            //db.SubmitChanges();
            return View();
        }

        public ActionResult EditarPerfil()
        {
            return View();
        }


    }
}
