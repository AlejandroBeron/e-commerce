using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class ElementoAuxiliar
    {
        public Articulos articulos { get; set; }

        public int cantidad { get; set; }

        public decimal Subtotal { get; set; }

        public ElementoAuxiliar()
        {
            cantidad = 0;
            Subtotal = 0;

        }

    }
}