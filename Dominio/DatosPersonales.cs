using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DatosPersonales
    {
        public string Email { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Telefono { get; set; }
        public string DNI { get; set; }
        public string Domicilio { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public bool Activo { get; set; }

        public DatosPersonales()
        {
            Nombre = "nada";
            Apellido = "nada";
            Telefono = "nada";
            DNI = "nada";
            Domicilio = "nada";
            Email = "nada";
            Activo = false;

        }


        public DatosPersonales(string nom, string ape, string tel, string dn, string domic, DateTime naci, string ema)
        {
            Nombre = nom;
            Apellido = ape;
            Telefono = tel;
            DNI = dn;
            Domicilio = domic;
            FechaNacimiento = naci;
            Email = ema;
            Activo = false;
        }

    }
}