using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace Dominio
{
    public class Marca
    {
        [DisplayName("Marca")]
        public string Nombre {  get; set; }
        [DisplayName("Id")]
        public int     Codigo { get; set; }
     


        public override string ToString()
        {
            return Nombre;
            
        }
       
    }
}
