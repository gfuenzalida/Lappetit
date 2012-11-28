using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using L_Appetit.Validations;
using System.Web.Mvc;

namespace L_Appetit.Models
{
    public class GestionUsuariosModel
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
        [Display(Name = "Carrera")]
        public bool Carrera { get; set; }

        public IEnumerable<SelectListItem> Carreras
        {
            get
            {
                IList<SelectListItem> carrera_select = new List<SelectListItem>();// = new IEnumerable<SelectListItem>();
                SelectListItem sli = new SelectListItem();
                sli.Text = "Hotelería";
                sli.Value = "False";
                carrera_select.Add(sli);
                sli = new SelectListItem();
                sli.Text = "Gastronomía";
                sli.Value = "True";
                carrera_select.Add(sli);
                return carrera_select;
            }
        }


        [Required]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$", ErrorMessage = "Correo electrónico ingresado con mal formato")]
        [Display(Name = "Correo")]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Teléfono")]
        [RegularExpression("^[1-9]+[0-9]{6,9}", ErrorMessage = "Telefono mal ingresado.")]
        public string Telefono { get; set; }

        public void RegistroCliente()
        {
            string nombre = this.Nombre + " " + this.ApellidoPaterno + " " + this.ApellidoMaterno;
            LinqDBDataContext db = new LinqDBDataContext();
            CLIENTE c1 = new CLIENTE { RUT_CLI = this.UserName, NOMBRE_CLI = nombre, SEXO_CLIENTE = this.Sexo, CORREO_CLI = this.Email, TELEFONO_CLI = Convert.ToInt32(this.Telefono), TICKETS_RECIBIDOS = 0 };

            db.CLIENTE.InsertOnSubmit(c1);
            db.SubmitChanges();
        }

    }
}