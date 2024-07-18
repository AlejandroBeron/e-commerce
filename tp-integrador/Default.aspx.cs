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
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Articulos> listaArticulo { get; set; }

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
                Session["listaarticulo"] =listaArticulo;
            }
            else
            {

                listaArticulo = (List<Articulos>)Session["listaarticulo"];
            }
            carritoactual = (Carrito)Session["carro"];
            if (Request.QueryString["id"] != null)
            {
                //addInmueble();
            }

        }
       /* private void addInmueble()
        {

            if (Session["usuario"] != null)
            {
                try
                {
                    NegocioFavorito fnegocio = new NegocioFavorito();
                    listainmueble = (List<Inmueble>)Session["listainmueble"];
                    Inmueble inmueble;
                    int Id_I = int.Parse(Request.QueryString["id"]);

                    inmueble = fnegocio.encontrarInmueble(Id_I, listainmueble);
                    Session["inmueble"] = fnegocio.AguegarAFavorito(inmueble, favoritoactual, 1);

                }
                catch (Exception ex)
                {
                    Response.Redirect("~/Error.aspx");
                    throw ex;
                }
            }
            else
            {
                Session.Add("error", "Debes Iniciar Sesión");
                Response.Redirect("Login.aspx");
            }
        }*/
        public bool verificarusuario(int id)
        {
            if (Session["usuario"] != null)
            {
                try
                {

                    Usuario usuario = (Usuario)Session["usuario"];
                    NegocioInmueble fnegocio = new NegocioInmueble();

                    if (fnegocio.verificarusuario(usuario.nombre_u, id) == true)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }

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
    }
}