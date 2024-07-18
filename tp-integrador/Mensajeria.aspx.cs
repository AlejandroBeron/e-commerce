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
    public partial class Mensajeria : System.Web.UI.Page
    {
        public List<Email> listaemail { get; set; }
        public Usuario usuario { get; set; }
        public Email email { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ReturnUrl"] = Request.Url.ToString();
            if (Session["usuario"] != null)
            {
                usuario = (Usuario)Session["usuario"];
                Usuario usu = (Usuario)Session["usuario"];
                Email email = new Email();
                NegocioEmail negoE = new NegocioEmail();
                if (Session["Emails"] == null)
                {
                    listaemail = negoE.listartodos(usu.nombre_u);
                    Session["Emails"] = listaemail;
                }

                listaemail = (List<Email>)Session["Emails"];

                if (listaemail.Count == 0)
                {
                    Session["Emails"] = null;
                    Response.Redirect("BandejaVacia.aspx");
                }
            }
            else
            {
                Session["Emails"] = null;
                Session.Add("error", "Debes Iniciar Sesión para Ingresar");
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnResponder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contacto.aspx");
        }


        protected void btnenviados_Click(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];
            Email email = new Email();
            NegocioEmail negoE = new NegocioEmail();
            listaemail = negoE.listarenviados(usu.nombre_u);
            if (listaemail.Count == 0)
            {
                Response.Redirect("BandejaVacia.aspx");
            }
            else
            {
                Session["Emails"] = listaemail;
            }
        }

        protected void btnrecibidos_Click(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];
            Email email = new Email();
            NegocioEmail negoE = new NegocioEmail();
            listaemail = negoE.listarrecibidos(usu.nombre_u);
            if (listaemail.Count == 0)
            {
                Response.Redirect("BandejaVacia.aspx");
            }
            else
            {
                Session["Emails"] = listaemail;
            }
        }

        protected void btnnuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contacto.aspx");
        }

        protected void btntodos_Click(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];
            Email email = new Email();
            NegocioEmail negoE = new NegocioEmail();
            listaemail = negoE.listartodos(usu.nombre_u);
            if (listaemail.Count == 0)
            {
                Response.Redirect("BandejaVacia.aspx");
            }
            else
            {
                Session["Emails"] = listaemail;
            }
        }

        protected void btnPapelera_Click(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];
            Email email = new Email();
            NegocioEmail negoE = new NegocioEmail();
            listaemail = negoE.listarpapelera(usu.nombre_u);
            if (listaemail.Count == 0)
            {
                Response.Redirect("BandejaVacia.aspx");

            }
            else
            {
                Session["Emails"] = listaemail;
            }
        }

        protected void btnnoleidos_Click(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];
            Email email = new Email();
            NegocioEmail negoE = new NegocioEmail();
            listaemail = negoE.listarnoLeidos(usu.nombre_u);
            if (listaemail.Count == 0)
            {
                Response.Redirect("BandejaVacia.aspx");
            }
            else
            {
                Session["Emails"] = listaemail;
            }
        }
    }
}