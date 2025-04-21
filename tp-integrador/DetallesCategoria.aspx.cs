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
    public partial class DetallesCategoria : System.Web.UI.Page
    {

        public List<Articulos> listaArticulo { get; set; }
        public List<Categoria> listaCategorias { get; set; }

        public List<Usuario> usuario { get; set; }
        public Carrito carritoactual { get; set; }
        public Categoria categoria { get; set; }
        public Articulos articulos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {  
           
            int codigoCategoria = int.Parse(Request.QueryString["id"]);
            Usuario usuario = new Usuario();
            ArticulosNegocio usario = new ArticulosNegocio();
            ArticulosNegocio negocio = new ArticulosNegocio();
            NegocioCategoria negocioc = new NegocioCategoria();

            Session["ReturnUrl"] = Request.Url.ToString();
            Session["listaPropia"] = null;

            carritoactual = (Carrito) Session["carro"];
            if (Request.QueryString["id"] != null)
            {
                listaArticulo = negocio.Listacompleta();
                List <Dominio.Articulos> listaFiltrada = listaArticulo.Where(a => a.categoria_a.codigo_categoria == codigoCategoria).ToList();
                categoria = negocioc.categoriaid(codigoCategoria);

                // Ahora usamos la lista filtrada para mostrar solo los artículos de esa categoría
                listaArticulo = listaFiltrada;
            }
            
    }
        }

 /* public bool verificarusuario(int id)
    {
        if (Session["usuario"] != null)
        {
            try
            {

                Usuario usuario = (Usuario)Session["usuario"];
                NegocioInmueble fnegocio = new NegocioInmueble();


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
   

    }*/
}