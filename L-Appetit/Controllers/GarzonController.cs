using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using L_Appetit.Models;

namespace L_Appetit.Controllers
{
    [Authorize(Roles = "Garzón")]
    public class GarzonController : Controller
    {

        [HttpPost]
        public ActionResult TomarPedido(PedidoModel modelo, string id_reserva, string rut_garzon, string btn_submit)
        {
            DateTime fecha = DateTime.Parse(Request.Form["__DATE"]);
            bool horario = Boolean.Parse(Request.Form["__HORARIO"]);

            PedidoModel _modelo = new PedidoModel();
            if (btn_submit == null)
            {
                string user_rut = User.Identity.Name.ToString();
                if (!String.IsNullOrEmpty(rut_garzon) && !rut_garzon.Equals(user_rut))
                {
                    TempData.Add("Error", "_"+user_rut+"_"+rut_garzon+"_");
                    return RedirectToAction("ConsultarReserva", "Garzon");
                }
                else
                {
                    LinqDBDataContext db = new LinqDBDataContext();
                    int respuesta = (Int32)db.CrearPedido(Int16.Parse(id_reserva), user_rut);

                    if (respuesta <= 0)
                    {
                        TempData.Add("Error", "Ha habido un error inesperado");
                        return RedirectToAction("ConsultarReserva", "Garzon");
                    }
                    else if (respuesta > 0)
                    {
                        _modelo = new PedidoModel();
                        _modelo.id_pedido = (Int16)respuesta;
                    }
                }
                ModelState.Clear();
            }
            else
            {
                _modelo.id_pedido = Int16.Parse(Request.Form["id_pedido"]);
                if (ModelState.IsValid)
                {
                    int resp = _modelo.setPedido(Int16.Parse(modelo.selected_item), Int16.Parse(modelo.selected_cant), modelo.observacion);
                    
                    if (resp == 2)
                    {
                        TempData.Add("Resp", "El Pedido se ha actualizado");
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

            ViewBag.Fecha = fecha.ToString("dd-MM-yyy");
            _modelo.getListas(fecha,horario);
            _modelo.getPedido();

            return View(_modelo);
        }

        public ActionResult ConsultarReserva()
        {
            DateTime fecha = DateTime.Now.Date;

            if (fecha.DayOfWeek == DayOfWeek.Saturday)
                fecha = DateTime.Now.AddDays(2).Date;
            else if (fecha.DayOfWeek == DayOfWeek.Sunday)
                fecha = DateTime.Now.AddDays(1).Date;

            MesasModel modelo = new MesasModel();
            modelo.getMesasGarzon(fecha, false);

            ViewBag.Fecha = fecha.ToString("dd-MM-yyy");


            return View(modelo);
        }

        [HttpPost]
        public ActionResult ConsultarReserva(MesasModel modelo)
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

                _modelo.getMesasGarzon(DateTime.Parse(date), modelo.horario);//DateTime.Parse(date)
                ViewBag.Fecha = _modelo.fecha.ToString("dd-MM-yyy");
            }
            return View(_modelo);
        }

        public ActionResult EditarPerfil()
        {
            return View();
        }

        public ActionResult EnviarInvitacion()
        {
            EnviarInvitacionModel model = new EnviarInvitacionModel();

            return View(model);
        }
        [HttpPost]
        public ActionResult EnviarInvitacion(EnviarInvitacionModel modelo)
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
                    TempData.Add("Resp", "No posee tantas invitaciones para enviar");
                }
                else if (resp == -1)
                {
                    TempData.Add("Resp", "El RUT ingresado no pertenece al sistema");
                }
            }

            return View(modelo);
        }

    }
}
