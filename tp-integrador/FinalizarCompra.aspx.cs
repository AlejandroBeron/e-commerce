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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string descriptionTextBlock()
        {
            try
            {
                Carrito current = (Carrito)Session["Carro"];
                List<List<string>> orderDescription = new List<List<string>>();

                foreach (var cartItem in current.listaarticulo)
                {
                    var itemDescription = new List<string>
                    {
                        cartItem.articulos.nombre_a,
                        cartItem.articulos.descripcion_a,
                        cartItem.cantidad.ToString(),
                        "Precio por unidad : $" + cartItem.articulos.precio_a.ToString(),
                        "Precio por cantidad :$" + (cartItem.articulos.precio_a * cartItem.cantidad).ToString()
                    };
                    orderDescription.Add(itemDescription);
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

    }
}