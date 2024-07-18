using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Net;

namespace tp_integrador
{
    public partial class CofirmarPublicaciones : System.Web.UI.Page
    {
        public List<Inmueble> listaautorizar { get; set; }
        public List<Inmueble> listainmueble { get; set; }

        public List<Usuario> usuario { get; set; }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Usuario usuario = new Usuario();
                NegocioUsuario usario = new NegocioUsuario();
                Session.Add("error", "Debes Iniciar Sesión para Ingresar");
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (Session["listainmueble"] != null)
                {
                    Usuario usuario = (Usuario)Session["usuario"];
                    if (usuario.nombre_u == "admin")
                    {
                        NegocioInmueble iManager = new NegocioInmueble();
                        listaautorizar = iManager.Listaautorizar();
                        listaautorizar = validarurl(listaautorizar);
                        Session["listaautorizar"] = listaautorizar;
                     //   listainmueble = iManager.Listacompleta();
                        listainmueble = validarurl(listainmueble);
                        Session["listainmueble"] = listainmueble;
                        if (listaautorizar.Count() == 0)
                        {
                            Response.Redirect("SinPublicacionesAlta.aspx");
                        }
                    }
                }
                else
                {
                    listaautorizar = (List<Inmueble>)Session["listaautorizar"];
                }
            }
        }
        public List<Inmueble> validarurl(List<Inmueble> aux)
        {
            foreach (Inmueble art in aux)
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

    }
}
