using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace Dominio
{

    public class Inmueble
    {
        [DisplayName("Nombre")]
        public string nombre_I { get; set; }
        [DisplayName("Nombre Usuario")]
        public string NombreUsuario { get; set; }
        public int Id_I { get; set; }
        [DisplayName("Precio")]
        public decimal precio_I { get; set; }
        [DisplayName("Descripción")]
        public string descripcion_I { get; set; }
        [DisplayName("Categoria")]
        public Categoria categoria_I { get; set; }
        [DisplayName("Imagen1")]
        public Imagen imagen_I { get; set; }
        [DisplayName("Imagen")]
        public string urlimagen { get; set; }
        public int ID() { return Id_I; }
        public List<Imagen> Imagenes { get; set; }
        public Ubicacion ubicacion { get; set; }
        public string tipo_operacion { get; set; }


        public bool Pausa { get; set; }
        public bool Estado { get; set; }
        public bool Activa { get; set; }



        public int ambientes { get; set; }
        public int baños { get; set; }
        public bool gasnatural { get; set; }
        public bool aguacorriente { get; set; }
        public bool cloacas { get; set; }
        public bool luz { get; set; }
        public bool cochera { get; set; }
        public bool patio { get; set; }
        public bool aireacondicionado { get; set; }
        public bool calefaccion { get; set; }
        public bool pavimento { get; set; }


        public Inmueble()
        {
            precio_I = 0;
            nombre_I = "nada";
            descripcion_I = "nada";
            categoria_I = new Categoria();
            Imagenes = new List<Imagen>();
            ubicacion = new Ubicacion();
            tipo_operacion = "nada";
            ambientes = 0;
            baños = 0;
            gasnatural = false;
            aguacorriente = false;
            cloacas = false;
            luz = false;
            patio = false;
            aireacondicionado = false;
            calefaccion = false;
            pavimento = false;
            Pausa = false;
            Estado = false;
            Activa = false;
            NombreUsuario = "nada";
        }
        public Inmueble(string nom, string desc, string nomusu, string tipo, Ubicacion ubi, Categoria cat, decimal pre, int am, int ba, bool g, bool ag, bool cl, bool l, bool pa, bool ai, bool cale, bool pavi, bool est, bool pau)
        {
            ubicacion = new Ubicacion();
            categoria_I = new Categoria();
            nombre_I = nom;
            NombreUsuario = nomusu;
            tipo_operacion = tipo;
            descripcion_I = desc;
            categoria_I = cat;
            ubicacion = ubi;
            precio_I = pre;
            Imagenes = new List<Imagen>();
            ambientes = am;
            baños = ba;
            gasnatural = g;
            aguacorriente = ag;
            cloacas = cl;
            luz = l;
            patio = pa;
            aireacondicionado = ai;
            calefaccion = cale;
            pavimento = pavi;
            Pausa = false;
            Estado = true;
            Activa = false;
        }

    }
}
