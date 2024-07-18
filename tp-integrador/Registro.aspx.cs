using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
namespace tp_integrador
{
    public partial class Registro : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();
        DatosPersonales datospersonales = new DatosPersonales();
        NegocioUsuario Unegocio = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                usuario = (Usuario)Session["usuario"];
                txtmail.Text = "Bienvenido: " + usuario.nombre_u;
                txtmensaje.Text = "Para continuar es necesario registrar algunos datos extra!";


            }
        }

        protected void btnregistrarse_Click(object sender, EventArgs e)
        {
            try
            {

                usuario.nombre_u = txtEmail.Text;
                usuario.contra_u = txtpass.Text;


                bool isLengthValid = usuario.contra_u.Length >= 6;
                bool hasUpperCase = usuario.contra_u.Any(char.IsUpper);
                bool hasNumber = usuario.contra_u.Any(char.IsDigit);



                if (isLengthValid)
                {
                    lblLength.Style["color"] = "green";
                }
                else
                {
                    lblLength.Style["color"] = "red";
                }

                if (hasUpperCase)
                {
                    lblUpperCase.Style["color"] = "green";
                }
                else
                {
                    lblUpperCase.Style["color"] = "red";
                }

                if (hasNumber)
                {
                    lblNumber.Style["color"] = "green";
                }
                else
                {
                    lblNumber.Style["color"] = "red";
                }

                if (!isLengthValid || !hasUpperCase || !hasNumber)
                {


                    txtpass.Text = "";
                    txtpass2.Text = "";


                    return;
                }

                Unegocio.agregar(usuario);

                if (isLengthValid && hasUpperCase && hasNumber)
                {


                    Session["usuario"] = usuario;
                    if (Session["usuario"] != null)
                    {
                        Response.Redirect("~/Registro.aspx");

                    }

                }




                Response.Redirect("~/Default.aspx");
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }

        }

        protected void cerrarbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime fechaNacimiento = DateTime.Parse(TxtFecha.Text);

                int edad = CalcularEdad(fechaNacimiento);

                if (edad >= 18)
                {
                    datospersonales.Nombre = TxtNombre.Text;
                    datospersonales.Apellido = TxtApellido.Text;
                    datospersonales.DNI = TxtDni.Text;
                    datospersonales.Domicilio = TxtDomicilio.Text;
                    datospersonales.Telefono = TxtTel.Text;
                    datospersonales.Email = usuario.nombre_u;
                    datospersonales.FechaNacimiento = fechaNacimiento;

                    Unegocio.agregarDatos(datospersonales);
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    lblError.Text = "Debes ser mayor de 18 años para registrarte.";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "fecha de nacimiento no valida ";
            }
        }
        private int CalcularEdad(DateTime fechaNacimiento)
        {
            DateTime now = DateTime.Today;
            int age = now.Year - fechaNacimiento.Year;
            if (fechaNacimiento > now.AddYears(-age))
                age--;

            return age;
        }
    }
}