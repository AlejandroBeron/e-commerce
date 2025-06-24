using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public  class DetalleCompra
    {
        [DisplayName("id_detalle")]
        public int Id_d { get; set; }
        [DisplayName("id_compra")]
        public int id_compra { get; set; }
        [DisplayName("id_articulo")]
        public int id_articulo { get; set; }
        [DisplayName("cantidad")]
        public int cantidad_d { get; set; }
        [DisplayName("precio_unitario")]
        public decimal precio_uni { get; set; }
        [DisplayName("precio_total")]
        public decimal precio_total { get; set; }


        public DetalleCompra()
        {
            Id_d = 0;
            id_compra = 0;
            id_articulo = 0;
            cantidad_d = 0;
            precio_uni = 0;
            precio_total= 0;


        }
        public DetalleCompra(int id, int id_com, int id_art, int can_d, decimal precioU, decimal precioT)
        {

            Id_d = id;
            id_compra = id_com;
            id_articulo = id_art;
            cantidad_d = can_d;
            precio_uni = precioU;
            precio_total = precioT;

        }

    }
}
