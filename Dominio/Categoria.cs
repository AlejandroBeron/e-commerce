using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace Dominio
{
    public class Categoria
    {
        [DisplayName("Categoria")]
        public string nombre_categoria { get; set; }
        [DisplayName("Id")]
        public int codigo_categoria { get; set; }
        public Imagen imagen_c { get; set; }
        [DisplayName("ImagenCategoria")]
        public String ImagenesCat { get; set; }
        public override string ToString()
        {
            return nombre_categoria;
        }
    }
}
