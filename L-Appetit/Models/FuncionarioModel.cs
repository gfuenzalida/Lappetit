using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using L_Appetit.Validations;

namespace L_Appetit.Models
{
    public class EnviarInvitacionModel
    {
        public String rutContacto {get;set;}

        [Required(ErrorMessage = "No ingresado")]
        [VerificadorRUT]
        [RegularExpression("^[1-9][0-9]{6,7}[-][1-9kK]", ErrorMessage = "El RUT no posee el formato adecuado")]
        [Display(Name = "RUT_CLIENTE")]
        public String rutCliente { get; set; }

        [Required(ErrorMessage="No ingresado")]
        [Display(Name = "CANTIDAD")]
        [RegularExpression("^[1-9]+[0-9]{0,1}", ErrorMessage = "Mal formato")]
        public Int32 cantidad { get; set; }

        public int SetInvitacion()
        {
            LinqDBDataContext db = new LinqDBDataContext();
            int resp;
            try
            {
                resp = db.SendInvitacion(rutContacto, rutCliente, cantidad);
            }
            catch
            {
                resp = -1;

            }

            return resp;
        }
    }
}