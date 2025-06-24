using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Net;
using System.Data.SqlClient;


namespace tp_integrador
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public List<Articulos> listaarticulos { get; set; }
        public List<Articulos> listafiltrada { get; set; }
        public List<Categoria> listacategoria { get; set; }
        public List<Articulos> listaPropia { get; set; }

        public Carrito lista { get; set; }
        public Articulos articulos { get; set; }
        public Categoria categoria { get; set; }
        ArticulosNegocio articulosNegocio = new ArticulosNegocio();
        public Usuario usuario { get; set; }
        NegocioCategoria CNegocio = new NegocioCategoria();
        

        public string TotalProductosCarro { get; set; }
       

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && Session["carro"] == null)
            {
                lista = new Carrito();

                Session.Add("carro", lista);
       
            }
            else
            {
                lista = (Carrito)Session["carro"];

            }

            listaarticulos = (List<Articulos>)Session["listaarticulo"];
            int Id_I = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;
            articulos = listaarticulos.FirstOrDefault(i => i.Id_a == Id_I);
            listacategoria = CNegocio.listar();
            

            tipoCodigo.DataSource = listacategoria;
            tipoCodigo.DataTextField = "nombre_categoria"; 
            tipoCodigo.DataValueField = "codigo_categoria";   
            Session["ValorSeleccionado"] = tipoCodigo.SelectedItem.Text;
            tipoCodigo.DataBind();
            tipoCodigo.Items.Insert(0, new ListItem("Categorías", ""));
            favoritos.Text = lista.TotalProductos.ToString();
           
            usuario = (Usuario)Session["usuario"];

          
                
            
        }
        protected void BuscarCat(object sender, EventArgs e)
        {
            
            List<Articulos> aux = (List<Articulos>)Session["listaarticulo"];
            string codi = Session["ValorSeleccionado"].ToString();
            listafiltrada = aux.FindAll(x => x.categoria_a.nombre_categoria.ToUpper().Contains(codi.ToUpper()));
            Session.Add("articulofiltrados", listafiltrada);
            
            if (!string.Equals(Request.Url.AbsolutePath, "/Default.aspx", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect($"Default.aspx");
            }



        }



        protected void Buscar(string text)
        {
            List<Articulos> aux = (List<Articulos>)Session["listaarticulo"];
            listafiltrada = aux.FindAll(x => x.nombre_a.ToUpper().Contains(text.ToUpper()) ||
           x.categoria_a.nombre_categoria.ToUpper().Contains(text.ToUpper()));
            Session.Add("articulofiltrados", listafiltrada);
            if (!string.Equals(Request.Url.AbsolutePath, "/Default.aspx", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect($"Default.aspx");
            }



        }


        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                Buscar(TextBox1.Text);
            }
        }

        protected void cerrar_Click(object sender, EventArgs e)
        {

            Session["usuario"] = null;

            string previousUrl = Session["ReturnUrl"] as string;
            if (previousUrl != null)
            {
                Response.Redirect(previousUrl);

            }

            else
            {
                Response.Redirect("Default.aspx");
            }

        }


        protected void btnIngreso_Click(object sender, EventArgs e)
        {
            Response.Redirect( "~/Login.aspx");

        }

        protected void arrepentimiento_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/Arrepentimiento.aspx");
        }
    }
}