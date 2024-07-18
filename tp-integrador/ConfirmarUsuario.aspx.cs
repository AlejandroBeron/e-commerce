using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace tp_integrador
{
    public partial class ConfirmarUsuario : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.Repeater confirmarUsuarios;
        public List<DatosPersonales> datosusuarios { get; set; }
        NegocioUsuario Unegocio = new NegocioUsuario();
        DatosPersonales usu { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                if (usuario.nombre_u == "admin")
                {

                    datosusuarios = Unegocio.listard();
                    confirmarUsuarios.DataSource = datosusuarios;

                    confirmarUsuarios.DataBind();
                    Session["listaUsuariosAutorizar"] = confirmarUsuarios;

                    if (datosusuarios.Count() == 0)
                    {

                        Response.Redirect("SinUsuarios.aspx");
                    }
                }
            }
        }
        private void AgregarAFavorito(string em)
        {

            try
            {
                for (int i = 0; i < datosusuarios.Count(); i++)
                {
                    if (datosusuarios[i].Email == em)
                    {


                    }
                }



            }
            catch (Exception ex)
            {
                Response.Redirect("~/Error.aspx");
                throw ex;
            }
        }

        protected void btnconfirmarUsuario_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string em = btn.CommandArgument;

            Unegocio.Confirmar(em);

            confirmarUsuarios.DataSource = Unegocio.listard();
            confirmarUsuarios.DataBind();

            Email email = new Email();
            NegocioEmail eNego = new NegocioEmail();
            Usuario usuario = (Usuario)Session["usuario"];
            email.destino = em;
            email.remitente = usuario.nombre_u;
            email.asunto = "Usuario Confirmado.";
            email.mensaje = "Bienvenido: " + em + " tu usuario fue confirmado con exito!";
            eNego.agregar(email);

            Response.Redirect("ConfirmarUsuario.aspx");
        }
        protected void btnRechazarUsuario_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string em = btn.CommandArgument;

            Unegocio.Rechazar(em);

            confirmarUsuarios.DataSource = Unegocio.listard();
            confirmarUsuarios.DataBind();


            Response.Redirect("ConfirmarUsuario.aspx");
        }

    }
}