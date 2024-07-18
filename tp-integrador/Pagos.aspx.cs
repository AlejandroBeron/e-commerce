using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace tp_integrador
{
    public partial class Pagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            
            
            
               

        }

        protected void cerrar_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Alta_Modificacion.aspx");
        }

        protected void btncerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Alta_Modificacion.aspx");
        }
    }
}