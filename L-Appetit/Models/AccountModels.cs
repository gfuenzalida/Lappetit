using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using L_Appetit.Validations;

namespace L_Appetit.Models
{


    public class ChangePasswordModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class LogOnModel
    {
        [Required]
        [Display(Name = "Nombre")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Password { get; set; }

        [Display(Name = "Recordarme?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterModel
    {
        [Required]
        [Display(Name = "Nombre")]
        public string Nombre { get; set; }

        [Required]
        [Display(Name = "Apellido Paterno")]
        public string ApellidoPaterno { get; set; }

        [Required]
        [Display(Name = "Apellido Materno")]
        public string ApellidoMaterno { get; set; }

        [Required]
        [Display(Name = "Sexo")]
        public bool Sexo { get; set; }

        public IEnumerable<SelectListItem> Generos
        {
            get
            {
                IList<SelectListItem> genero_select = new List<SelectListItem>();// = new IEnumerable<SelectListItem>();
                SelectListItem sli = new SelectListItem();
                sli.Text = "Masculino";
                sli.Value = "False";
                genero_select.Add(sli);
                sli = new SelectListItem();
                sli.Text = "Femenino";
                sli.Value = "True";
                genero_select.Add(sli);
                return genero_select;
            }
        }

        [Required]
        [RegularExpression("^[1-9][0-9]{6,7}[-][1-9kK]", ErrorMessage = "El RUT no posee el formato adecuado")]
        [VerificadorRUT]
        [Display(Name = "RUT")]
        public string UserName { get; set; }
        
        [Required]
        [StringLength(100, ErrorMessage = "La contraseña debe tener mínimo 6 caracteres.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirmar Contraseña")]
        [Compare("Password", ErrorMessage = "La contraseña y la contraseña de confirmacion no coinciden.")]
        public string ConfirmPassword { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$", ErrorMessage = "Correo electrónico ingresado con mal formato")]
        [Display(Name = "Correo")]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Teléfono")]
        [RegularExpression("^[1-9]+[0-9]{6,9}", ErrorMessage = "Telefono mal ingresado.")]
        public string Telefono { get; set; }


    }
}
