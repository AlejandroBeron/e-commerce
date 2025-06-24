using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Compra
    {

        [DisplayName("id_compra")]
        public int Id_c { get; set; }
        [DisplayName("nombreC")]
        public string nombre_c { get; set; }
        [DisplayName("apellidoC")]
        public string apellido_c { get; set; }
        [DisplayName("dniC")]
        public int dni_c { get; set; }
        [DisplayName("emailC")]
        public string email_c { get; set; }
        [DisplayName("ordenC")]
        public string orden_c { get; set; }

        public Compra()
        {
            Id_c = 0;
            nombre_c = "nada";
            apellido_c = "nada";
            dni_c = 0;
            email_c = "nada";
            orden_c = "nada";
           

        }
        public Compra(int cod, string nom, string apelli, int dnic, string email, string ord)
        {
            
            Id_c = cod;
            nombre_c = nom;
            apellido_c = apelli;
            dni_c = dnic;
            email_c = email;
            orden_c = ord;
            
        }

    }
}
