using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Net.Mail;
using System.Net;

namespace tp_integrador
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Articulos> listaArticulo { get; set; }
        public List<Categoria> listaCategorias { get; set; }

        public List<Usuario> usuario { get; set; }
        public Carrito carritoactual { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ReturnUrl"] = Request.Url.ToString();
            Session["listaPropia"] = null;


            if (Session["listaarticulo"] == null)
            {

                ArticulosNegocio iManager = new ArticulosNegocio();
                listaArticulo = iManager.Listacompleta();
                listaArticulo = validarurl(listaArticulo);
                Session["listaarticulo"] = listaArticulo;
            }
            else
            {

                listaArticulo = (List<Articulos>)Session["listaarticulo"];
            }

            if (Session["categoriafiltrados"] == null)
            {
                NegocioCategoria iManager = new NegocioCategoria();
                listaCategorias = iManager.listar();
                listaCategorias = validarurlcat(listaCategorias);
                
                Session["categoriafiltrados"] = listaCategorias;
            }
            else
            {

                listaCategorias = (List<Categoria>)Session["categoriafiltrados"];
            }
            carritoactual = (Carrito)Session["carro"];
            if (Request.QueryString["id"] != null)
            {
                //addInmueble();
            }

        }

        public bool verificarusuario(int id)
        {
            if (Session["usuario"] != null)
            {
                try
                {

                    Usuario usuario = (Usuario)Session["usuario"];
                    ArticulosNegocio fnegocio = new ArticulosNegocio();


                    return true;


                }
                catch (Exception ex)
                {
                    Response.Redirect("~/Error.aspx");
                    throw ex;
                }
            }
            else
            {
                return false;
            }


        }


        public List<Articulos> validarurl(List<Articulos> aux)
        {
            foreach (Articulos art in aux)
            {
                foreach (Imagen image in art.Imagenes)
                {


                    try
                    {
                        if (image.Nombre_imagen != "sinimagen")
                        {
                            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(image.Nombre_imagen);
                            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                            if (response.StatusCode != HttpStatusCode.OK)
                            {

                                image.Nombre_imagen = "fallacarga";
                            }
                        }
                    }
                    catch (WebException)
                    {

                        image.Nombre_imagen = "fallacarga";

                    }

                }

            }

            return aux;
        }
        public List<Categoria> validarurlcat(List<Categoria> aux)
        {
            foreach (Categoria art in aux)
            {
                //foreach (Imagen image in art.ImagenesCat)
               // {


                   /* try
                    {
                        if (image. != "sinimagen")
                        {
                            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(image.Nombre_imagen);
                            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                            if (response.StatusCode != HttpStatusCode.OK)
                            {

                                image.Nombre_imagen = "fallacarga";
                            }
                        }
                    }
                    catch (WebException)
                    {

                        image.Nombre_imagen = "fallacarga";

                    }*/

               // }
                   
            }

            return aux;
        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombrePro.Text;
            string email = TextEmailPro.Text;
            
            string Body =
                  "<body>" +
                   "<img src='https://i.pinimg.com/474x/4c/80/d9/4c80d905ae7cebe0f7434daf755dfa37.jpg' class='rounded mx-auto d-block' alt='' style='width: 1 %; height: 1 %;' />" +
                    "<div class='card border-dark' style='border-color: black; border-width: 4px; margin-left: 10px; height: 400px; width: 500px;'>" +
                 "<strong>Quiero recibir promociones mi nombre es: </strong>" + nombre +
                   "<br/>" + "<br/>" +
                    "<strong> y mi email es: </strong>" + email +
                 "</body>";

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("ale.frecuenci@gmail.com", "gqxt urtz nfvp cabk");
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.EnableSsl = true;

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("ale.frecuenci@gmail.com", "Electrotecno");
            mail.To.Add(new MailAddress("ale.frecuenci@gmail.com"));
            mail.Subject = "Quiero recibir las promociones";
            mail.IsBodyHtml = true;
            mail.Body = Body;

            smtp.Send(mail);
            Response.Redirect("~/EmailConsulta.aspx");
        }
    }
    /* 
     * <% if (categoria.ImagenesCat[i] == "fallacarga")
                                        { %>
                                    <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="">
                                    <% }
                                        else if (categoria.ImagenesCat[i].Nombre_imagen == "sinimagen")
                                        { %>
                                    <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: fill; height: 250px; width: 350px;" alt="">
                                    <% }
                                        else
                                        { %>
    
     
     */

}

