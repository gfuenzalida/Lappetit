using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace L_Appetit.Models
{
    public class EnviarInvitacionModel
    {
        public String rutContacto;
        public String rutCliente;
        public DateTime fechaEmision;
        public Int32 cantidad;

        public void SetInvitacion()
        {
            LinqDBDataContext db = new LinqDBDataContext();


        }
    }
}