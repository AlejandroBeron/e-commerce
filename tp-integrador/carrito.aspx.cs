using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
namespace tp_web_carritoCompra
{
    public partial class carrito : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.Repeater repetirarticulos;
        public Carrito carritoactual { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            carritoactual = (Carrito)Session["carro"];
            if (carritoactual.TotalProductos == 0)
            {
                Response.Redirect("~/CarritoVacio.aspx");
            }
            else if (carritoactual != null && carritoactual.TotalProductos > 0)
            {
                repetirarticulos.DataSource = carritoactual.listaarticulo;
                repetirarticulos.DataBind();
            }
        }

        protected void btnMenos_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string codigo_a = btn.CommandArgument;
            EliminararticuloCarrito (codigo_a, false);
            repetirarticulos.DataSource = carritoactual.listaarticulo;
            repetirarticulos.DataBind();
        }

        protected void btnmas_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string codigo_a = btn.CommandArgument;
            agregararticulosalcarro(codigo_a);
            repetirarticulos.DataSource = carritoactual.listaarticulo;
            repetirarticulos.DataBind();
        }


        protected void btnEliminarCarrito_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string codigoa = btn.CommandArgument;
            EliminararticuloCarrito(codigoa, true) ;
            repetirarticulos.DataSource = carritoactual.listaarticulo;
            repetirarticulos.DataBind();

        }

        protected void FinalizarCompra_Click(object sender, EventArgs e)
        {

            Session["carro"] = carritoactual;
           

        }
        private void agregararticulosalcarro(string codigoa)
        {
            try
            {
                for (int i = 0; i < carritoactual.listaarticulo.Count(); i++)
                {
                    if (carritoactual.listaarticulo[i].articulos.codigo_a == codigoa)
                    {
                        carritoactual.TotalPrecio = carritoactual.TotalPrecio + carritoactual.listaarticulo[i].articulos.precio_a;
                        carritoactual.TotalProductos = carritoactual.TotalProductos + 1;
                        carritoactual.listaarticulo[i].cantidad = carritoactual.listaarticulo[i].cantidad + 1;
                        carritoactual.listaarticulo[i].Subtotal = carritoactual.listaarticulo[i].cantidad * carritoactual.listaarticulo[i].articulos.precio_a;
                        Session["carro"] = carritoactual;
                        repetirarticulos.DataSource = carritoactual.listaarticulo;
                        repetirarticulos.DataBind();
                        break;
                    }
                }

                updateLabelCart();

            }
            catch (Exception ex)
            {
                Response.Redirect("~/Error.aspx");
                throw ex;
            }
        }
        private void EliminararticuloCarrito(string codigoa, bool todo)
        {
            for (int i = 0; i < carritoactual.listaarticulo.Count(); i++)
            {
                if (carritoactual.listaarticulo[i].articulos.codigo_a == codigoa)
                {
                    if (todo == true)
                    {
                        carritoactual.TotalPrecio = carritoactual.TotalPrecio - (carritoactual.listaarticulo[i].articulos.precio_a * carritoactual.listaarticulo[i].cantidad);
                        carritoactual.TotalProductos = carritoactual.TotalProductos - carritoactual.listaarticulo[i].cantidad;
                        carritoactual.listaarticulo.RemoveAt(i);
                        Session["carro"] = carritoactual;
                        repetirarticulos.DataSource = carritoactual.listaarticulo;
                        repetirarticulos.DataBind();
                        break;
                    }
                    else
                    {
                        carritoactual.TotalPrecio = carritoactual.TotalPrecio - carritoactual.listaarticulo[i].articulos.precio_a;
                        carritoactual.TotalProductos = carritoactual.TotalProductos - 1;
                        carritoactual.listaarticulo[i].cantidad = carritoactual.listaarticulo[i].cantidad - 1;
                        carritoactual.listaarticulo[i].Subtotal = carritoactual.listaarticulo[i].articulos.precio_a * carritoactual.listaarticulo[i].cantidad;
                        if (carritoactual.listaarticulo[i].cantidad == 0)
                        {
                            carritoactual.listaarticulo.RemoveAt(i);
                        }
                        Session["carro"] = carritoactual;
                        repetirarticulos.DataSource = carritoactual.listaarticulo;
                        repetirarticulos.DataBind();
                        break;
                    }
                }
            }
            updateLabelCart();
            if (carritoactual.TotalProductos == 0)
            {
                Response.Redirect("~/CarritoVacio.aspx");
            }
        }
        private void updateLabelCart()
        {
            var masterPage = this.Master;
            var lblHeader = masterPage.FindControl("Label1") as Label;
            if (lblHeader != null)
            {
                lblHeader.Text = carritoactual.TotalProductos.ToString();
            }
        }

    }
}