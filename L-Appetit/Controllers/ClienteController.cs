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
        {
            var fecha = Convert.ToDateTime("2010-01-01 00:00:00.000");
            bool horario = true;
            LinqDBDataContext db = new LinqDBDataContext();
            var menu = from item in db.ITEM
                       from menu_fecha in db.MENU_FECHA
                       from tipo_item in db.TIPO_ITEM
                       where
                         menu_fecha.FECHA == fecha &&
                         menu_fecha.HORARIO == horario &&
                         item.CODIGO_ITEM == menu_fecha.CODIGO_ITEM &&
                         tipo_item.CODIGO_TIPO_ITEM == item.CODIGO_TIPO_ITEM
                       select new
                       {
                           tipo_item.NOMBRE_TIPO_ITEM,
                           item.NOMBRE_ITEM
                       };
            /*
            var fecha = "2010-01-01 00:00:00.000";
            bool horario = true;
            LinqDBDataContext db = new LinqDBDataContext();
            var menu = from menu_fecha in db.MENU_FECHA
                       join item in db.ITEM
                             on new { menu_fecha.FECHA, menu_fecha.CODIGO_ITEM }
                         equals new { FECHA = fecha, item.CODIGO_ITEM }
                       select new
                       {
                           item.NOMBRE_ITEM
                       };*/
            /*
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
