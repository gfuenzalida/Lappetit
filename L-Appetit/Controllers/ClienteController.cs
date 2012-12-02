using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Mvc;
using L_Appetit.Models;
using System.Collections;
using System.Collections.Specialized;

namespace L_Appetit.Controllers
{
    //[Authorize(Roles = "Cliente")]
    public class ClienteController : Controller
    {
        //
        // GET: /Cliente/
        [HttpGet]
        public ActionResult ConsultarMenu()
        {
            MenuModel modelo = new MenuModel();
            DateTime fecha = DateTime.Now.Date;
            modelo.GetItems(fecha,false);

            ViewBag.Fecha = fecha.ToString("dd-MM-yyy");
                        
            return View(modelo);
        }

        [HttpPost]
        public ActionResult ConsultarMenu(MenuModel modelo)
        {
            string date = Request.Form["__DATE"];
            MenuModel new_model = new MenuModel();
            ViewBag.Fecha = DateTime.Now.ToString("dd-MM-yyy");
            if (date != null)
            {
                new_model.GetItems(DateTime.Parse(date), modelo.horario);//DateTime.Parse(date)
                ViewBag.Fecha = new_model.fecha.ToString("dd-MM-yyy");
            }
                        
            return View(new_model);
        }

        public ActionResult ConsultarReserva()
        {
            ConsultarReservaModel modelo = new ConsultarReservaModel();
            String rut = HttpContext.User.Identity.Name;
            modelo.GetReservas(rut);

            return View(modelo);
        }
        
        [HttpPost]
        public ActionResult ConsultarReserva(ConsultarReservaModel modelo)
        {

            return View();
        }

        public ActionResult EditarPerfilCliente()
        {
            return View();
        }

        [HttpGet]
        public ActionResult HacerReserva()
        {
            DateTime fecha = DateTime.Now.Date;

            if (fecha.DayOfWeek == DayOfWeek.Saturday)
                fecha = DateTime.Now.AddDays(2).Date;
            else if (fecha.DayOfWeek == DayOfWeek.Sunday)
                fecha = DateTime.Now.AddDays(1).Date;

            MesasModel modelo = new MesasModel();
            modelo.getMesasReserva(fecha, false);

            ViewBag.Fecha = fecha.ToString("dd-MM-yyy");
                        
            
            return View(modelo);
        }
        
        [HttpPost]
        public ActionResult HacerReserva(MesasModel modelo)
        {
            string date = Request.Form["__DATE"];
            string operacion = Request.Form["op"];
            MesasModel _modelo = new MesasModel();

            DateTime fecha = DateTime.Now.Date;

            if (fecha.DayOfWeek == DayOfWeek.Saturday)
                fecha = DateTime.Now.AddDays(2).Date;
            else if (fecha.DayOfWeek == DayOfWeek.Sunday)
                fecha = DateTime.Now.AddDays(1).Date;

            if (date != null)
            {
                if (operacion == "mk")
                {
                    Int16 mesa_id = Int16.Parse(Request.Form["form_mesa_id"]);
                    short num_comen = Int16.Parse(Request.Form["form_num_comen"]);
                    string rut = User.Identity.Name;
                    bool horario = modelo.horario;
                    string obs = Request.Form["form_obs"];
                    
                    // Intentando agregar a DB
                    LinqDBDataContext db = new LinqDBDataContext();

                    bool respuesta = (bool)db.MK_RESERVA(rut,
                                                        mesa_id,
                                                        DateTime.Parse(date),
                                                        horario,
                                                        num_comen,
                                                        obs).ReturnValue;
                    if (respuesta)
                        ViewBag.RESP = "La reserva se ha realizado con éxito";
                    else
                        ViewBag.RESP = "Ya existe una reserva hecha en dicha mesa";
                }
                
                _modelo.getMesasReserva(DateTime.Parse(date), modelo.horario);//DateTime.Parse(date)
                ViewBag.Fecha = _modelo.fecha.ToString("dd-MM-yyy");
            }

            return View(_modelo);
        }



        public ActionResult EditarPerfil()
        {
            return View();
        }


    }
}
