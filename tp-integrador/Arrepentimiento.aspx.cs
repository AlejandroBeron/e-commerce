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
    public partial class Arrepentimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Enviar_Click(object sender, EventArgs e)
        {
            string nombre = name.Text;
            string Apellido = apellido.Text;
            string Documento = documento.Text;
            string Email = email.Text;
            string tel = Tel.Text;
            string orden = Orden.Text;
            string mensaje = TextMensaje.Text;

            string Body =
                  "<body>" +
                   "<img src='https://media.istockphoto.com/id/1306118503/es/foto/retroalimentaci%C3%B3n-negativa-y-tasa-con-mala-cara-de-sonrisa.jpg?s=612x612&w=0&k=20&c=E7-m-_eHRMiqbQJLBAvY1PA897tJ9m8QLu-FcXqAMFw=' class='rounded mx-auto d-block' alt='' style='width: 1 %; height: 1 %;' />" +
                    "<div class='card border-dark' style='border-color: black; border-width: 4px; margin-left: 10px; height: 400px; width: 500px;'>" +
                 "<strong>Arrepentimiento de compra </strong>" + 
                   "<br/>" + "<br/>" +
                    "<strong>Nombre: </strong>" + nombre +
                    "<br/>" + "<br/>" +
                    "<strong>Apellido: </strong>" + Apellido +
                    "<br/>" + "<br/>" +
                    "<strong>Documento: </strong>" + Documento +
                    "<br/>" + "<br/>" +
                    "<strong>Email: </strong>" + Email +
                    "<br/>" + "<br/>" +
                     "<strong>Numero de telefono: </strong>" + tel +
                    "<br/>" + "<br/>" +
                     "<strong>Orden de compra: </strong>" + orden +
                    "<br/>" + "<br/>" +
                    "<strong>Su mensaje es: </strong>" +  mensaje +
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
            mail.Subject = "Arrepentimiento de compra";
            mail.IsBodyHtml = true;
            mail.Body = Body;

            smtp.Send(mail);
            Response.Redirect("~/ConsultaArrepentimiento.aspx");

        }
    }
}