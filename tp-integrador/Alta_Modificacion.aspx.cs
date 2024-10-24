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
    public partial class Alta_Modificacion : System.Web.UI.Page
    {
        public List<Articulos> listaarticulos { get; set; }
        public List<Categoria> listacategoria { get; set; }
        public List<Marca> listamarca { get; set; }
        public List<Articulos> listaPropia { get; set; }

        public Articulos articulos { get; set; }
        public Categoria categoria { get; set; }
        public object selarticulos { get; private set; }

        ArticulosNegocio ANegocio = new ArticulosNegocio();
        NegocioCategoria CNegocio = new NegocioCategoria();
        NegocioMarca MNegocio = new NegocioMarca();
        // NegocioUbicacion UNegocio = new NegocioUbicacion();

        List<string> imagenUrls = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["usuario"] == null)
            {
                Session.Add("error", "Debes Iniciar Sesión para Ingresar");
                Response.Redirect("Login.aspx");
            }

            listaarticulos = (List<Articulos>)Session["listaarticulo"];
            int Id_I = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;
            articulos = listaarticulos.FirstOrDefault(i => i.Id_a == Id_I);
            listacategoria = CNegocio.listar();
            listamarca = MNegocio.listar();

            if (!IsPostBack)
            {
                tipoCodigo.DataSource = listacategoria;
                tipoCodigo.DataTextField = "nombre_categoria"; // Propiedad que representa el texto visible
                tipoCodigo.DataValueField = "codigo_categoria";   // Propiedad que representa el valor
                tipoCodigo.DataBind();

                tipoMarca.DataSource = listamarca;
                tipoMarca.DataTextField = "Nombre"; // Propiedad que representa el texto visible
                tipoMarca.DataValueField = "Codigo";   // Propiedad que representa el valor
                tipoMarca.DataBind();
            }
                try
            {

                if (articulos != null && !IsPostBack)
                {

                    txtnombre.Text = articulos.nombre_a;
                    txtprecio.Text = articulos.precio_a.ToString();
                    txtdescripcion.Text = articulos.descripcion_a;
                    txtmodelo.Text = articulos.codigo_a;

                   

                    tipoCodigo.SelectedValue = articulos.categoria_a.codigo_categoria.ToString(); 
                    tipoMarca.SelectedValue = articulos.marca_a.Codigo.ToString();

                    btnModificar.Visible = true;
                    //condicion para q no se aparezca boton agregar
                    btnAgregar.Visible = false;
                    if (articulos.Imagenes != null)
                    {
                        rptImages.DataSource = articulos.Imagenes;
                        rptImages.DataBind();
                    }
                    else { rptImages.DataSource = "https://img.freepik.com/vector-premium/icono-marco-fotos-foto-vacia-blanco-vector-sobre-fondo-transparente-aislado-eps-10_399089-1290.jpg"; }
                    for (int x = 0; x < articulos.Imagenes.Count(); x++)
                    {

                        string text = articulos.Imagenes[x].Nombre_imagen;
                        imagenUrls.Add(text);
                    }
                    Session["ImagenUrls"] = imagenUrls;
                }

            }

            catch (Exception ex)
            {
                Response.Redirect("~/Default.aspx");
                throw ex;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;

            Articulos articulos = new Articulos();
            ArticulosNegocio articulosNegocio = new ArticulosNegocio();
            Usuario usu = (Usuario)Session["usuario"];

            articulos.nombre_a = txtnombre.Text;
            articulos.precio_a = decimal.Parse(txtprecio.Text);
            articulos.categoria_a.codigo_categoria= int.Parse(tipoCodigo.SelectedValue);
            articulos.marca_a.Codigo = int.Parse(tipoMarca.SelectedValue);
            articulos.codigo_a= txtmodelo.Text;/// es el modelo
            articulos.descripcion_a = txtdescripcion.Text;
            
            List<string> imagenUrls = Session["ImagenUrls"] as List<string> ?? new List<string>();

            // nuevo agregar acumulado
            articulosNegocio.agregar(articulos, imagenUrls);
            Session["ImagenUrls"] = null;
            ArticulosNegocio iManager = new ArticulosNegocio();
            listaarticulos = iManager.Listacompleta();
            listaarticulos = validarurl(listaarticulos);
            Session["listaarticulo"] = listaarticulos;
            Response.Redirect("~/Default.aspx");

        }



        protected void Btn_addimg_Click(object sender, EventArgs e)
        {

            List<string> imagenUrls1 = Session["ImagenUrls"] as List<string> ?? new List<string>();


            if (!string.IsNullOrEmpty(txtImagenurl.Text))
            {
                imagenUrls.Add(txtImagenurl.Text);
            }
            Session["ImagenUrls"] = imagenUrls;

            txtImagenurl.Text = string.Empty;
            rptImages.DataSource = imagenUrls;
            rptImages.DataBind();

        }

        public List<Articulos> validarurl(List<Articulos> aux)
        {
            foreach (Articulos art in aux)
            {
                foreach (Imagen image in art.Imagenes)
                {


                    try
                    {
                        if (image.Nombre_imagen != "sinimagen")
                        {
                            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(image.Nombre_imagen);
                            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                            if (response.StatusCode != HttpStatusCode.OK)
                            {

                                image.Nombre_imagen = "fallacarga";
                            }
                        }
                    }
                    catch (WebException)
                    {

                        image.Nombre_imagen = "fallacarga";

                    }

                }

            }

            return aux;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            articulos.nombre_a = txtnombre.Text;
            articulos.precio_a = decimal.Parse(txtprecio.Text);
            articulos.codigo_a = txtmodelo.Text;
            articulos.descripcion_a = txtdescripcion.Text;
            articulos.categoria_a.codigo_categoria = int.Parse(tipoCodigo.SelectedValue);
            articulos.marca_a.Codigo = int.Parse(tipoMarca.SelectedValue);
            List<string> imagenUrls = Session["ImagenUrl"] as List<string> ?? new List<string>();


            ANegocio.modificar(articulos);
            Session["ImagenUrl"] = null; 
             ArticulosNegocio iManager = new ArticulosNegocio();
            listaarticulos = iManager.Listacompleta();
            listaarticulos = validarurl(listaarticulos);
            Session["listaarticulo"] = listaarticulos;
            if (Session["listapropia"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                listaPropia = iManager.Listapropia(usuario.nombre_u);
                listaPropia = validarurl(listaPropia);
                Session["listaPropia"] = listaPropia;
                Response.Redirect("~/MisPublicaciones.aspx");
            }
            Response.Redirect("~/Default.aspx");
        }
        protected void txtImagenurl_TextChanged(object sender, EventArgs e)
        {


        }
    }
}
/* 

            // listalocalidades = UNegocio.listar();
            // if (!IsPostBack)
            //  {
              listacategoria = CNegocio.listar();
                listalocalidades = UNegocio.listar();

                selpropiedad.DataSource = listacategoria;
                selpropiedad.DataTextField = "nombre_categoria"; // Propiedad que representa el texto visible
                selpropiedad.DataValueField = "codigo_categoria";   // Propiedad que representa el valor
                selpropiedad.DataBind();

                codigo_postal.DataSource = listalocalidades;
                codigo_postal.DataTextField = "codigo_postal";

                codigo_postal.DataBind();
                localidad.DataSource = listalocalidades;
                localidad.DataTextField = "Localidad";

                localidad.DataBind();
                string local = UNegocio.listarcodigopostal(int.Parse(codigo_postal.SelectedValue));
                localidad.SelectedValue = local.ToString();
            }
* if (checkagua.Checked == true) { inmueble.aguacorriente = true; }
 else { inmueble.aguacorriente = false; }
 if (Checkluz.Checked == true) { inmueble.luz = true; }
 else { inmueble.luz = false; }
 if (checkgas.Checked == true) { inmueble.gasnatural = true; }
 else { inmueble.gasnatural = false; }
 if (Checkcochera.Checked == true) { inmueble.cochera = true; }
 else { inmueble.cochera = false; }
 if (Checkaire.Checked == true) { inmueble.aireacondicionado = true; }
 else { inmueble.aireacondicionado = false; }
 if (Checkpatio.Checked == true) { inmueble.patio = true; }
 else { inmueble.patio = false; }
 if (Checkpavimento.Checked == true) { inmueble.pavimento = true; }
 else { inmueble.pavimento = false; }
 if (Checkcloaca.Checked == true) { inmueble.cloacas = true; }
 else { inmueble.cloacas = false; }
 if (Checkcalefaccion.Checked == true) { inmueble.calefaccion = true; }
 else { inmueble.calefaccion = false; }
//  articulos.categoria_a.codigo_categoria = int.Parse(selarticulos.SelectedValue);
// inmueble.tipo_operacion = tipoope.SelectedValue;

// nuevo agregar acumulado
  protected void codigo_postal_SelectedIndexChanged(object sender, EventArgs e)
  {
      string local = UNegocio.listarcodigopostal(int.Parse(codigo_postal.SelectedValue));
      localidad.SelectedValue = local.ToString();
  }

//  txtdireccion.Text = inmueble.ubicacion.Direccion;
 // baños.SelectedValue = inmueble.baños.ToString();
// ambientes.SelectedValue = inmueble.ambientes.ToString();
// selpropiedad.SelectedValue = inmueble.categoria_I.codigo_categoria.ToString();
 //  codigo_postal.SelectedValue = inmueble.ubicacion.Codigo_Postal.ToString();
// localidad.DataBind();
// string local = UNegocio.listarcodigopostal(int.Parse(codigo_postal.SelectedValue));
// localidad.SelectedValue = local.ToString();
*/
/*   <asp:ListItem Text="audio"/>
                        <asp:ListItem Text="mouse y teclados"/> 
                        <asp:ListItem Text="consolas"/> 
                        <asp:ListItem Text="Celulares"/>
                        <asp:ListItem Text="P47"/>
                        <asp:ListItem Text="speaker"/> 
                        <asp:ListItem Text="Sony"/> 
                        <asp:ListItem Text="kanji"/>
                        <asp:ListItem Text="genius"/> 
*/