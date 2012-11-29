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
        [StringLength(100, ErrorMessage = "La contraseña debe tener mínimo 6 caracteres.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Password { get; set; }

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


        /* 0 = Hoteleria;
         * 1 = Gastronomía;
         * 2 = Funcionario;
         * 3 = Administrador;
         */
        public void Registro(int tipo)
        {
            string nombre = this.Nombre + " " + this.ApellidoPaterno + " " + this.ApellidoMaterno;
            LinqDBDataContext db = new LinqDBDataContext();
            if (tipo == 0)
            {
                CONTACTO C = new CONTACTO { RUT_CONTACTO = this.UserName, NOMBRE_CONTACTO = nombre, SEXO_CONTACTO = this.Sexo, CODIGO_CARRERA = 1, CORREO_CONTACTO = this.Email, FONO_CONTACTO = Convert.ToInt32(this.Telefono), CANT_TICKETS = 30};
                db.CONTACTO.InsertOnSubmit(C);
                db.SubmitChanges();
            }
            else if (tipo == 1)
            {
                CONTACTO C = new CONTACTO { RUT_CONTACTO = this.UserName, NOMBRE_CONTACTO = nombre, SEXO_CONTACTO = this.Sexo, CODIGO_CARRERA = 2, CORREO_CONTACTO = this.Email, FONO_CONTACTO = Convert.ToInt32(this.Telefono), CANT_TICKETS = 30 };
                db.CONTACTO.InsertOnSubmit(C);
                db.SubmitChanges();
            }
            else if (tipo == 2)
            {
                CONTACTO C = new CONTACTO { RUT_CONTACTO = this.UserName, NOMBRE_CONTACTO = nombre, SEXO_CONTACTO = this.Sexo, CORREO_CONTACTO = this.Email, FONO_CONTACTO = Convert.ToInt32(this.Telefono), CANT_TICKETS = 30 };
                db.CONTACTO.InsertOnSubmit(C);
                db.SubmitChanges();
            }
            else if (tipo == 3)
            {
                // Debería ingresar un administrador al sistema, pero esto solamente serviría para almacenar información de contacto
            }
            else
            {
                // Si no es ni 0, 1, 2, 3 Fail!
            }
            
            
        }

    }

    public class MesasModel
    {
        public List<Mesa> lista_mesas {get; set;}

        public MesasModel()
        {
            lista_mesas = new List<Mesa>();
        }

        public void getMesas()
        {
            LinqDBDataContext db = new LinqDBDataContext();
            var mesas = (from mesa in db.MESA
                        select new
                        {
                            mesa.CODIGO_MESA,
                            mesa.POS_X,
                            mesa.POS_Y,
                            mesa.CANT_MAXIMA
                        }
                        );

            foreach (var una_mesa in mesas)
            {
                lista_mesas = new List<Mesa>();
                Mesa _mesa = new Mesa();
                _mesa.id_mesa = una_mesa.CODIGO_MESA;
                _mesa.pos_x = una_mesa.POS_X.Value;
                _mesa.pos_y = una_mesa.POS_Y.Value;
                _mesa.cant_maxima = una_mesa.CANT_MAXIMA.Value;
                lista_mesas.Add(_mesa);
            }
        }
    }
    
    public class Mesa
    {
        public decimal id_mesa { get; set; }
        public int cant_maxima { get; set; }
        public int pos_x { get; set; }
        public int pos_y { get; set; }

        void RegistrarMesa()
        {
            LinqDBDataContext db = new LinqDBDataContext();
            MESA m1 = new MESA { POS_X = pos_x, POS_Y = pos_y, CANT_MAXIMA = (short)cant_maxima};
            db.MESA.InsertOnSubmit(m1);
            db.SubmitChanges();
        }
    }


}