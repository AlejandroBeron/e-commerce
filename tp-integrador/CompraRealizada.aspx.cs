﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_integrador
{
    public partial class CompraRealizada : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            Session.Remove("Carro");
            Response.Redirect("Default.aspx");
        }

        protected void BtnDescargar_Click(object sender, EventArgs e)
        {


        }
    }
}