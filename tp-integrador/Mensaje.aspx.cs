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
    public partial class Mensaje : System.Web.UI.Page
    {
        public List<Email> listaemail { get; set; }
        public Email emailseleccionado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usu = (Usuario)Session["usuario"];
                listaemail = (List<Email>)Session["Emails"];
                int Id = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;

                if (Id != -1 && listaemail != null)
                {
                    emailseleccionado = listaemail.FirstOrDefault(i => i.Id == Id);

                    if (emailseleccionado != null)
                    {

                        if (emailseleccionado.Visto == true)
                        {
                            emailseleccionado.Visto = false;
                            NegocioEmail negocioEmail = new NegocioEmail();
                            negocioEmail.Leidos(emailseleccionado.Id);
                        }
                        txtasunto.Text = emailseleccionado.asunto;
                        txtremitente.Text = emailseleccionado.remitente;
                        txtmensaje.Text = emailseleccionado.mensaje;
                    }

                }

            }
            Usuario usu1 = (Usuario)Session["usuario"];
            listaemail = (List<Email>)Session["Emails"];
            Email email1 = new Email();
            NegocioEmail negoE = new NegocioEmail();
            int Id1 = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id1) ? id1 : -1;
            email1 = listaemail.FirstOrDefault(i => i.Id == Id1);
            emailseleccionado = email1;

        }

        protected void btnResponder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contacto.aspx?id=" + txtremitente.Text);
        }

        protected void btnEliminarmensaje_Click(object sender, EventArgs e)
        {      
            
            NegocioEmail nego = new NegocioEmail();

            if (emailseleccionado != null)
            {
                
                nego.BajaLogica(emailseleccionado.Id, false);

                listaemail = listaemail.Where(em => em.Id != emailseleccionado.Id).ToList();
                Session["Emails"] = listaemail;
            }
            Response.Redirect("~/Mensajeria.aspx");
        }


        protected void btncerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mensajeria.aspx");
        }
    }
}