using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Ubicacion
    {
        public int Id { get; set; }
        public int Codigo_Postal { get; set; }
        public string Direccion { get; set; }
        public string Localidad { get; set; }
        public string Partido { get; set; }


    }
}
