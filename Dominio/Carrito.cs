using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Carrito
    {
        public int TotalProductos { get; set; }
        public decimal TotalPrecio { get; set; }
        public List<ElementoAuxiliar> listaarticulo { get; set; }

        public Carrito()
        {
            listaarticulo = new List<ElementoAuxiliar>();
            TotalPrecio = 0;
            TotalProductos = 0;
            ;
        }
        public void agregararticulocarrito(Articulos art)
        {
            bool existe = false;
            for (int x = 0; x < listaarticulo.Count(); x++)
            {
                if (listaarticulo[x].articulos.Id_a == art.Id_a)
                {
                    listaarticulo[x].cantidad++;
                    listaarticulo[x].Subtotal = listaarticulo[x].articulos.precio_a * listaarticulo[x].cantidad;
                    existe = true;

                }
            }
            if (existe == false)
            {
                ElementoAuxiliar aux = new ElementoAuxiliar();
                aux.articulos = art;
                aux.cantidad++;
                aux.Subtotal = art.precio_a;
                listaarticulo.Add(aux);

            }
            TotalPrecio = listaarticulo.Sum(aux => aux.cantidad * aux.articulos.precio_a);
            TotalProductos = listaarticulo.Sum(aux => aux.cantidad);
        }

    }
}
