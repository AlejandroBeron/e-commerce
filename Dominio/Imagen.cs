using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace Dominio
{
    public class Imagen
    {
        [DisplayName("Url Imagen")]
        public string Nombre_imagen { get; set; }
        [DisplayName("ID Imagen")]
        public int id_imagen { get; set; }
        [DisplayName("Articulo")]
        public string nombre_Articulo { get; set; }
        [DisplayName("Id Articulo")]
        public int id_Articulo { get; set; }

        public int ID()
        {
            return id_Articulo;
        }

        public override string ToString()
        {
            return Nombre_imagen;
        }

    }
}