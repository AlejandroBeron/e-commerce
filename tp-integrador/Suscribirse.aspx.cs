using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace tp_integrador
{
    public partial class Suscribirse : System.Web.UI.Page
    {
        public Suscribirse suscribirse { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            string email = TextEmail.Text;
            string asunto = TextAsunto.Text;
            string mensaje = TextMensaje.Text;
            string Body = 
                  "<body>" +
                   "<img src='https://i.pinimg.com/474x/4c/80/d9/4c80d905ae7cebe0f7434daf755dfa37.jpg' class='rounded mx-auto d-block' alt='' style='width: 1 %; height: 1 %;' />" +
                    "<div class='card border-dark' style='border-color: black; border-width: 4px; margin-left: 10px; height: 400px; width: 500px;'>" +
                 "<strong>Recibiste una consulta de: </strong>" + nombre +
                   "<br/>" + "<br/>" +
                    "<strong>su email es: </strong>" + email +
                    "<br/>" + "<br/>" +
                    "<strong>el asunto de su consulta es: </strong>" + asunto +
                    "<br/>" + "<br/>" +
                    "<strong>su consulta es: </strong>" + mensaje +
                   "</div>" +
                 "</body>";

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("ale.frecuenci@gmail.com", "gqxt urtz nfvp cabk");
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.EnableSsl = true;

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("ale.frecuenci@gmail.com", "Electrotecno");
            mail.To.Add(new MailAddress("ale.frecuenci@gmail.com"));
            mail.Subject = "Tienes una nueva consulta";
            mail.IsBodyHtml = true;
            mail.Body = Body;

            smtp.Send(mail);
            Response.Redirect("~/Consultarealizada.aspx");

        }
    }
}