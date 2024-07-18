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
    public partial class Contacto : System.Web.UI.Page
    {
        public string destino { get; set; }
        public string previousUrl { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ReturnUrl"] = Request.Url.ToString();

            if (Session["usuario"] != null)
            {
                Usuario usu = (Usuario)Session["usuario"];
                Email email = new Email();
                NegocioUsuario usario = new NegocioUsuario();
                destino = Request.QueryString["id"];
                if (destino != null)
                {
                    txtpara.Visible = true;
                    txtdestino.Visible = false;
                }
                else
                {
                    txtpara.Visible = false;
                    txtdestino.Visible = true;
                }
                txtpara.Text = destino;
                txtremitente.Text = usu.nombre_u;
            }
            else
            {
                Session.Add("error", "Debes Iniciar Sesión para Ingresar");
                Response.Redirect("Login.aspx");


            }

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void btnaceptar_Click(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];

            Email email = new Email();
            email.mensaje = txtmensaje.Text;
            email.remitente = usu.nombre_u;
            email.asunto = txtasunto.Text;
            if (destino == null)
            {
                email.destino = txtdestino.Text;
            }
            else
            {
                email.destino = Request.QueryString["id"];
            }
            NegocioEmail negoE = new NegocioEmail();
            negoE.agregar(email);

            Response.Redirect("Mensajeria.aspx");
        }

        protected void btncerrar2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mensajeria.aspx");
        }

        protected void btnresponder_Click(object sender, EventArgs e)
        {

        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {

        }

        protected void btncerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mensajeria.aspx");
        }

    }
}