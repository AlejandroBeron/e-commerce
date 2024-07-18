using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace tp_integrador
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void cerrarbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            NegocioUsuario negocioUsuario = new NegocioUsuario();
            try
            {
                usuario.nombre_u = txtEmail.Text;
                usuario.contra_u = txtPass.Text;
                usuario = negocioUsuario.Loguear(usuario);
                if (usuario.nombre_u != null)
                {
                    if (usuario.Activo == true)
                    {
                        Session["usuario"] = usuario;

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


                    else if (usuario.Activo == false)
                    {
                        txtmsjerror.Visible = true;
                        txtmsjerror.Text = "El Usuario todavia no fue Confirmado";
                        Session.Add("error", "El Usuario todavia no fue Confirmado");
                    }
                }
                else
                {
                    txtmsjerror.Visible = true;
                    txtmsjerror.Text = "usuario o contraseña incorrectos, reintentar.";
                    txtEmail.Text = "";
                    txtPass.Text = "";
                    Session.Add("error", "usuario o contraseña incorrectos...");
                }


            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }

    }
}