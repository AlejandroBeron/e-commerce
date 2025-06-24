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
    public partial class FinalizarCompra : System.Web.UI.Page
    {
        public Compra compra { get; set; }
                List<DetalleCompra> d_compra = new List<DetalleCompra>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                purchaseOrder.Text = GenerateCode();
                txtSummary.Text = descriptionTextBlock();

            }
        }
        public string descriptionTextBlock()
        {
            try
            {
                Carrito current = (Carrito)Session["Carro"];
                Compra compra = new Compra();
                DetalleCompra detalle = new DetalleCompra();
                ArticulosNegocio articulosNegocio = new ArticulosNegocio();
                List<List<string>> orderDescription = new List<List<string>>();

                foreach (var cartItem in current.listaarticulo)
                {
                    var itemDescription = new List<string>
                    {
                       "Articulo : " + cartItem.articulos.nombre_a,
                       "Descripción : " + cartItem.articulos.descripcion_a,
                        "Cantidad : " + cartItem.cantidad.ToString(),
                        "Precio por unidad : $" + cartItem.articulos.precio_a.ToString(),
                        "Precio por cantidad :$" + (cartItem.articulos.precio_a * cartItem.cantidad).ToString()
                        };

                        detalle.id_articulo = cartItem.articulos.Id_a;
                        detalle.cantidad_d = cartItem.cantidad;
                        detalle.precio_uni = cartItem.articulos.precio_a;
                        detalle.precio_total = (cartItem.articulos.precio_a * cartItem.cantidad);


                    orderDescription.Add(itemDescription);
                    d_compra.Add(detalle);


                }

                string formattedText = string.Empty;

                foreach (List<string> innerList in orderDescription)
                {
                    formattedText += "Producto :\r\n";
                    foreach (string item in innerList)
                    {
                        formattedText += "\t" + item + "\r\n";
                    }
                    formattedText += "\r\n";
                }

                formattedText += "Total : $" + current.TotalPrecio.ToString();
                return formattedText;
               
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Error.aspx");
                throw ex;
            }

        }

       

        protected void liveAlertBtn_Click(object sender, EventArgs e)
        {
            Compra compra = new Compra();
            List<DetalleCompra> detallesCompra = new List<DetalleCompra>(); 
            Carrito current = (Carrito)Session["Carro"];

            compra.orden_c = purchaseOrder.Text;
            compra.nombre_c = name.Text;
            compra.apellido_c = lastName.Text;
            compra.dni_c = int.Parse(documentNumber.Text);
            compra.email_c = emailAdress.Text;

            
            foreach (var cartItem in current.listaarticulo)
            {
                DetalleCompra detalle = new DetalleCompra
                {
                    id_articulo = cartItem.articulos.Id_a,
                    cantidad_d = cartItem.cantidad,
                    precio_uni = cartItem.articulos.precio_a,
                    precio_total = cartItem.articulos.precio_a * cartItem.cantidad
                };

                detallesCompra.Add(detalle); 
            }

            
            ArticulosNegocio articulosNegocio = new ArticulosNegocio();
            if (articulosNegocio.CompraC(compra, detallesCompra))
            {
                Response.Redirect("~/CompraRealizada.aspx");
            }

        }

        private string GenerateCode()
        {
            return Guid.NewGuid().ToString("N").Substring(0, 8).ToUpper();
        }
    }
}
//if (confirm   { window.location.href='CompraRealizada.aspx'; return false; } else { return false; }