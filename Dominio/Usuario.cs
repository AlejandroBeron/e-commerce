using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Dominio
{
    public enum Tipousuario
    {
        NORMAL = 0,
        ADMIN = 1,
    }

    public class Usuario
    {
        [DisplayName("Nombre")]
        public string nombre_u { get; set; }
        [DisplayName("Contraseña")]
        public string contra_u { get; set; }
        [DisplayName("Id")]
        public int id_u { get; set; }
        [DisplayName("IdTipo")]
        public bool idtipo_u { get; set; }
        [DisplayName("TipoUsuario")]
        public Tipousuario Tipousuario { get; set; }
        public bool Activo { get; set; }


       


        public Usuario()
        {

        }

        public Usuario(string user, string pass, bool admin)
        {
            nombre_u = user;
            contra_u = pass;
            Tipousuario = admin ? Tipousuario.ADMIN : Tipousuario.NORMAL;
            Activo = false;
        }

    }
}