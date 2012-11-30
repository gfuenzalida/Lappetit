﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using L_Appetit.Validations;

namespace L_Appetit.Models
{
    // Modelo correspondiente a la Vista ConsultarMenu
    public class MenuModel
    {
        public DateTime fecha { get; set; }

        [Display(Name="horario")] 
        public bool horario {get; set;}

        public IEnumerable<SelectListItem> Horarios
        {
            get
            {
                IList<SelectListItem> horario_select = new List<SelectListItem>();// = new IEnumerable<SelectListItem>();
                SelectListItem sli = new SelectListItem();
                sli.Text = "Almuerzo";
                sli.Value = "False";
                horario_select.Add(sli);
                sli = new SelectListItem();
                sli.Text = "Cena";
                sli.Value = "True";
                horario_select.Add(sli);
                return horario_select;
            }
        }

        public List<string> ListaEntrada { get; set; }
        public List<string> ListaFondo { get; set; }
        public List<string> ListaBebestible { get; set; }
        public List<string> ListaPostre { get; set; }

        public MenuModel()
        {
            ListaBebestible = new List<string>();
            ListaEntrada = new List<string>();
            ListaFondo = new List<string>();
            ListaPostre = new List<string>();

            horario = false;
        }

        public void GetItems(DateTime fecha, bool horario)
        {
            this.fecha = fecha;
            ListaEntrada = new List<string>();
            ListaFondo = new List<string>();
            ListaPostre = new List<string>();
            ListaBebestible = new List<string>();

    // Modelo correspondiente a la Vista ConsultarReserva
    public class ReservaModel
    {
        public String rut;
        public List<Reservalista> ListaReservas { get; set; }
        
        public ReservaModel()
        {
            ListaReservas = new List<Reservalista>();
        }

        public void GetReservas(String rut)
        {
            this.rut = rut;
            
            
            LinqDBDataContext db = new LinqDBDataContext();
            Reservalista rl = new Reservalista();
            var reservas = from reserva in db.RESERVA
                    where
                      reserva.RUT_CLI == rut
                    select new
                    {
                        reserva.FECHA,
                        reserva.HORARIO,
                        reserva.NUMERO_COMENSALES,
                        reserva.OBSERVACIONES
                    };
            foreach (var r in reservas) 
            {
                rl.fecha = r.FECHA;
                rl.horario = r.HORARIO;
                rl.comensales = r.NUMERO_COMENSALES;
                rl.observaciones = r.OBSERVACIONES;
                ListaReservas.Add(rl);
            }
        }
    }

    public class Reservalista
    {
        public DateTime fecha {get;set;}
        public Boolean horario { get; set; }
        public System.Nullable<short> comensales { get; set; }
        public String observaciones { get; set; } 
    }
    // Modelo correspondiente a la vista HacerReserva
    public class HacerReservaModel
    {
        public Int32 mesa;
        public String rut;
        public DateTime fecha;
        public Boolean horario;
        public Int16 comensales;
        
        public void SetReserva(Int32 mesa, String rut, DateTime fecha, Boolean horario, Int16 comensales)
        {
            this.mesa = mesa;
            this.rut = rut;
            this.fecha = fecha;
            this.horario = horario;
            this.comensales = comensales;
            
            LinqDBDataContext db = new LinqDBDataContext();

            RESERVA iRESERVA = new RESERVA
            {
                CODIGO_MESA = mesa,
                RUT_CLI = rut,
                FECHA = fecha,
                HORARIO = horario,
                NUMERO_COMENSALES = comensales
            };
            db.RESERVA.InsertOnSubmit(iRESERVA);
            db.SubmitChanges();
        }
        public void DeleteReserva(Int32 codigo_reserva)
        {

            LinqDBDataContext db = new LinqDBDataContext();
            
            var eliminaRESERVA =
            from reserva in db.RESERVA
            where
              reserva.CODIGO_RESERVA == codigo_reserva
            select reserva;
            foreach (var del in eliminaRESERVA)
            {
                db.RESERVA.DeleteOnSubmit(del);
            }
            db.SubmitChanges();

        }

    }

}