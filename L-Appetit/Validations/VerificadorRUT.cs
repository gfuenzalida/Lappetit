using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace L_Appetit.Validations
{
    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property, AllowMultiple = false, Inherited = true)]
    public class VerificadorRUT : ValidationAttribute
    {      

        public VerificadorRUT()
            : base("RUT no válido")
        { }
        public override bool IsValid(object value)
        {
            int Digito;
            int Contador;
            int Multiplo;
            int Acumulador;
            string RutDigito;
            string run = (string)value;
            string[] split;
            string num;
            string ver;
            
            split = run.Split('-');

            num = split[0];
            ver = split[1];

            int rut = Convert.ToInt32(num);

            Contador = 2;
            Acumulador = 0;

            while (rut != 0)
            {
                Multiplo = (rut % 10) * Contador;
                Acumulador = Acumulador + Multiplo;
                rut = rut / 10;
                Contador = Contador + 1;
                if (Contador == 8)
                {
                    Contador = 2;
                }

            }
            Digito = 11 - (Acumulador % 11);
            RutDigito = Digito.ToString().Trim();
            if (Digito == 10 )
            {
                RutDigito = "K";
             }
            if (Digito == 11)
            {
                RutDigito = "0";
            }            
            if (ver.CompareTo(RutDigito)!=0)
                return false;
            return true;
        }
    }
}