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
    public partial class Detalles : System.Web.UI.Page
    {
        public List<Articulos> listaarticulo { get; set; }
        public Articulos articulos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
           // Usuario usuario = new Usuario();
            ArticulosNegocio usario = new ArticulosNegocio();

            Session["ReturnUrl"] = Request.Url.ToString();

            listaarticulo = (List<Articulos>)Session["listaarticulo"];
            int id_a = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;
            articulos = listaarticulo.FirstOrDefault(i => i.Id_a == id_a);
            try
            {

                if (articulos != null && !IsPostBack)
                {
                    lblnombre.InnerText = articulos.nombre_a;
                    lblDescripcion.InnerText = articulos.descripcion_a;
                  //  lblDireccion.InnerText = "Ubicación: " + inmueble.ubicacion.Direccion + "," + inmueble.ubicacion.Localidad + "(" + inmueble.ubicacion.Codigo_Postal.ToString() + "), " + inmueble.ubicacion.Partido;
                    lblprecio.InnerText = "$" + articulos.precio_a.ToString();
                    lblcategoriaytipo.InnerText = articulos.categoria_a.nombre_categoria;
                    lblmarca.InnerText = articulos.marca_a.Nombre.ToString();

                    //  lblambientes.Text = "Ambientes: " + inmueble.ambientes.ToString();
                    //lblbaños.Text = "Baños: " + inmueble.baños.ToString();

                    /*  checkagua.Enabled = false;
                      Checkluz.Enabled = false;
                      checkgas.Enabled = false;
                      Checkcochera.Enabled = false;
                      Checkaire.Enabled = false;
                      Checkpatio.Enabled = false;
                      Checkpavimento.Enabled = false;
                      Checkcalefaccion.Enabled = false;
                      Checkcloaca.Enabled = false;*/

                    /* if (inmueble.aguacorriente == true) { checkagua.Checked = true; }
                     if (inmueble.luz == true) { Checkluz.Checked = true; }
                     if (inmueble.gasnatural == true) { checkgas.Checked = true; }
                     if (inmueble.cochera == true) { Checkcochera.Checked = true; }
                     if (inmueble.aireacondicionado == true) { Checkaire.Checked = true; }
                     if (inmueble.patio == true) { Checkpatio.Checked = true; }
                     if (inmueble.pavimento == true) { Checkpavimento.Checked = true; }
                     if (inmueble.cloacas == true) { Checkcloaca.Checked = true; }
                     if (inmueble.calefaccion == true) { Checkcalefaccion.Checked = true; }*/


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
        public bool verificarusuario(int id)
        {
            if (Session["usuario"] != null)
            {
                try
                {

                    Usuario usuario = (Usuario)Session["usuario"];
                    ArticulosNegocio fnegocio = new ArticulosNegocio();

                   /* if (fnegocio.verificarusuario(usuario., id) == true)
                    {
                        return true;
                    }
                    else*/
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


        protected void btnagregarfavorito_Click1(object sender, EventArgs e)
        {
            int selectedQuantity;
            Carrito carritoactual;
            carritoactual = (Carrito)Session["carro"];
            CarritoNegocio cNegocio = new CarritoNegocio();

            try
            {

                if (selectUnit.SelectedIndex > 0)
                {
                    selectedQuantity = int.Parse(selectUnit.Value);
                }
                else
                {
                    selectedQuantity = 1;
                }

                carritoactual = cNegocio.AguegarArticuloAlCarrito(articulos, carritoactual, selectedQuantity);
                Session["carro"] = carritoactual;
                Response.Redirect("~/Detalles.aspx?id=" + articulos.Id_a);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}