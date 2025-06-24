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
        public List<Articulos> listafiltrada { get; set; }
        public List<Marca> listamarca { get; set; }
        public List<Articulos> listaarticulos { get; set; }
        public List<Articulos> listaarticulosprecio { get; set; }


        public Carrito lista { get; set; }
        public List<Usuario> usuario { get; set; }
        public Carrito carritoactual { get; set; }
        public Categoria categoria { get; set; }
        public Articulos articulos { get; set; }
        NegocioMarca MNegocio = new NegocioMarca();
        ArticulosNegocio ANegocio = new ArticulosNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {

            // int codigoCategoria = int.Parse(Request.QueryString["id"]);

            int codigoCategoria;


            Usuario usuario = new Usuario();
            ArticulosNegocio usario = new ArticulosNegocio();
            ArticulosNegocio negocio = new ArticulosNegocio();
            NegocioCategoria negocioc = new NegocioCategoria();

            Session["ReturnUrl"] = Request.Url.ToString();
            Session["listaPropia"] = null;

            carritoactual = (Carrito)Session["carro"];

            if (!IsPostBack && Session["carro"] == null)
            {
                lista = new Carrito();
            

                Session.Add("carro", lista);

            }
            else
            {
                lista = (Carrito)Session["carro"];

            }
            if (Request.QueryString["id"] != null)
            {
                 codigoCategoria = int.Parse(Request.QueryString["id"]);

                listaArticulo = negocio.Listacompleta();
                List<Dominio.Articulos> listaFiltrada = listaArticulo.Where(a => a.categoria_a.codigo_categoria == codigoCategoria).ToList();
                categoria = negocioc.categoriaid(codigoCategoria);
                Session["Idcate"] = codigoCategoria;
                // Ahora usamos la lista filtrada para mostrar solo los artículos de esa categoría
                listaArticulo = listaFiltrada;
                Session.Add("list", listaArticulo);

            }
            else
            {
                codigoCategoria = (int)Session["Idcate"];
            }
            listaarticulos = (List<Articulos>)Session["listaarticulo"];
            int Id_I = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;
            articulos = listaarticulos.FirstOrDefault(i => i.Id_a == Id_I);
            listamarca = MNegocio.listar();

            tipoMarca.DataSource = listamarca;
            tipoMarca.DataTextField = "Nombre";
            tipoMarca.DataValueField = "Codigo";
            Session["MarcaSeleccionada"] = tipoMarca.SelectedItem.Text;
            Session["MarcaIDSeleccionado"] = tipoMarca.SelectedItem.Value;
            tipoMarca.DataBind();
            tipoMarca.Items.Insert(0, new ListItem("Marcas", ""));
           // Favoritos.Text = lista.TotalProductos.ToString();
            Session["listadomarca"] = listamarca;


            listaarticulosprecio = (List<Articulos>)Session["listaarticulo"];
            int Id_P = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id1) ? id1 : -1;
            articulos = listaarticulosprecio.FirstOrDefault(i => i.Id_a == Id_P);

           
            tipoPrecio.Items.Insert(0, new ListItem("Ordenar", ""));
            Session["ArtSeleccionada"] = tipoPrecio.SelectedItem.Text;
            //tipoPrecio.DataBind();
            
            Session["Listaprecio"] = listaarticulosprecio;

            if (Session["articulofiltrados"] != null)
            {
                listaArticulo = (List<Dominio.Articulos>)Session["articulofiltrados"];
                Session.Remove("articulofiltrados");
            }
            else if (Session["Idcate"] != null)
            {
                codigoCategoria = (int)Session["Idcate"];
                listaArticulo = negocio.Listacompleta().Where(a => a.categoria_a.codigo_categoria == codigoCategoria).ToList();
                Session["list"] = listaArticulo;
            }


        }

        protected void Buscarprecio(object sender, EventArgs e)
        {
            

            List<Articulos> aux = (List<Articulos>)Session["list"];
            string codi = Session["ArtSeleccionada"].ToString();
            int cat = (int)Session["Idcate"];

              if (Session["MarcaIDSeleccionadoanterior"] != null) { 
            string marca = (string)Session["MarcaIDSeleccionadoanterior"];
            int h = int.Parse(marca);

            if (codi == "Precio Menor") {
                listaarticulosprecio = ANegocio.listarMenor(cat, h);
            }
            else if (codi == "Precio Mayor")
            {
                listaarticulosprecio = ANegocio.listarMayor(cat,h);

            }
            Session.Add("articulofiltrados", listaarticulosprecio);

            if (!string.Equals(Request.Url.AbsolutePath, "/Default.aspx", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect($"DetallesCategoria.aspx");
            }
          }
         else if (Session["MarcaIDSeleccionadoanterior"] == null)
            {
                if (codi == "Precio Menor")
                {
                    listaarticulosprecio = ANegocio.listarMenorSinmarca(cat);
                }
                else if (codi == "Precio Mayor")
                {
                    listaarticulosprecio = ANegocio.listarMayorSinmarca(cat);

                }
                Session.Add("articulofiltrados", listaarticulosprecio);

                if (!string.Equals(Request.Url.AbsolutePath, "/Default.aspx", StringComparison.OrdinalIgnoreCase))
                {
                    Response.Redirect($"DetallesCategoria.aspx");
                }

            }



        }

        protected void BuscarMar(object sender, EventArgs e)
        {
            string probando = (String)Session["MarcaIDSeleccionado"];
            Session["MarcaIDSeleccionadoanterior"] = Session["MarcaIDSeleccionado"];

            List<Articulos> aux = (List<Articulos>)Session["list"];
            string codi = Session["MarcaSeleccionada"].ToString();


            listafiltrada = aux.FindAll(x => x.marca_a.Nombre.ToUpper().Contains(codi.ToUpper()));
            Session.Add("articulofiltrados", listafiltrada);

            if (!string.Equals(Request.Url.AbsolutePath, "/Default.aspx", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect($"DetallesCategoria.aspx");
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
                   }*/


        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            ArticulosNegocio negocio = new ArticulosNegocio();

            
                // Recuperar la categoría antes de limpiar
                int? codigoCategoria = Session["Idcate"] as int?;

                // Limpiar los filtros
                Session.Remove("articulofiltrados");
                Session.Remove("MarcaIDSeleccionado");
                Session.Remove("MarcaIDSeleccionadoanterior");
                Session.Remove("ArtSeleccionada");

                // Restaurar la lista de artículos con la última categoría buscada
                if (codigoCategoria != null)
                {
                    listaArticulo = negocio.Listacompleta();
                    List<Dominio.Articulos> listaFiltrada = listaArticulo.Where(a => a.categoria_a.codigo_categoria == codigoCategoria).ToList();
                    Session["list"] = listaFiltrada;
                }

                
                Response.Redirect("DetallesCategoria.aspx");
            }

        }
    }
