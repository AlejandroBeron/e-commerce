using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_integrador
{
    public partial class RecuperarPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            NegocioUsuario negocioUsuario = new NegocioUsuario();
            try
            {
                string nombreUsuario = txtEmail.Text;
                string dni = txtDNI.Text;
                string contraseña = negocioUsuario.RecuperarContraseña(nombreUsuario, dni);

                if (!string.IsNullOrEmpty(contraseña))
                {
                   
                    lblMensaje.Text = "Su contraseña es: " + contraseña;
                }
                else
                {
                    lblMensaje.Text = "Usuario o DNI incorrectos.";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Ocurrió un error: " + ex.Message;
            }
        }

        protected void cerrarbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}