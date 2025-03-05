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
    public partial class EliminarPausar : System.Web.UI.Page
    {
        public List<Articulos> listar { get; set; }
        public Articulos articulos { get; set; }
        public List<Articulos> listaArticulo { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            NegocioUsuario usario = new NegocioUsuario();
            ArticulosNegocio arti = new ArticulosNegocio();

            listar = (List<Articulos>)Session["listaarticulo"];
            int Id = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;

            articulos = listar.FirstOrDefault(i => i.Id_a == Id);

            try
            {

                if (articulos != null && !IsPostBack && !articulos.Pausa)
                {
                    lblnombre.InnerText = articulos.nombre_a;
                    lblDescripcion.InnerText = articulos.descripcion_a;
                    lblprecio.InnerText = "$" + articulos.precio_a;
                    lblcategoria.InnerText = articulos.categoria_a.nombre_categoria;
                    lblmarca.InnerText = articulos.codigo_a;

                }
                if (articulos == null)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Default.aspx");
                throw ex;
            }
        }

        protected void btnPausar_Click(object sender, EventArgs e)
        {
            ArticulosNegocio nego = new ArticulosNegocio();
            LinkButton btn = (LinkButton)sender;
            int id = articulos.Id_a;

            nego.Pausar(id, !articulos.Pausa);

     
            Response.Redirect("~/Default.aspx");

        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ArticulosNegocio nego = new ArticulosNegocio();
            LinkButton btn = (LinkButton)sender;
           

            nego.Eliminar(articulos);

            ArticulosNegocio iManager = new ArticulosNegocio();
            listaArticulo = iManager.Listacompleta();
            listaArticulo = validarurl(listaArticulo);
            Session["listaarticulo"] = listaArticulo;

            Response.Redirect("~/Default.aspx");

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