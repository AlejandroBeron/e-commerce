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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public List<Articulos> listafiltrada { get; set; }
        public Carrito lista { get; set; }
        public Usuario usuario { get; set; }
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
             favoritos.Text = lista.TotalProductos.ToString();
            usuario = (Usuario)Session["usuario"];
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


    }
}