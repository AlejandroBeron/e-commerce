<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_integrador.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <% if ((List<Dominio.Articulos>)Session["articulofiltrados"] != null)
        {
            listaArticulo = (List<Dominio.Articulos>)Session["articulofiltrados"];
            Session.Remove("articulofiltrados");
        }%>


    <div class="row" style="margin-top: 100px; margin-left: 25px; margin-right: 25px; margin-bottom: 40px;">

        <% foreach (Dominio.Articulos articulo in listaArticulo)
            { %>

        <div class="col-12 col-md-6 col-lg-4 mb-2">
            <div class="card border-dark"
                <%if (articulo.Pausa == false)
                {%>style="border-color:black; height: 500px; width: 350px; ">
                <%} %>

                <div id="carouselExampleDark_<%:articulo.Id_a%>" class="carousel carousel-dark slide">
                    <div class="carousel-indicators">


                        <% for (int i = 0; i < articulo.Imagenes.Count(); i++)
                            { %>
                        <button type="button" id="independtiente" data-bs-target="#carouselExampleDark_<%: articulo.Id_a %>" data-bs-slide-to="<%= i %>"
                            <% if (i == 0)
                            { %>
                            class="active" aria-current="true" <% } %> aria-label="Slide <%= i + 1 %>">
                        </button>
                        <% } %>
                    </div>
                    <div class="carousel-inner">
                        <%
                            bool first = true;
                            for (int i = 0; i < articulo.Imagenes.Count(); i++)
                            {
                                if (first)
                                {
                                    first = false; %>
                        <div class="carousel-item active">

                            <% if (articulo.Imagenes[i].Nombre_imagen == "fallacarga")
                                { %>
                            <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="">
                            <% }
                                else if (articulo.Imagenes[i].Nombre_imagen == "sinimagen")
                                { %>
                            <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: fill; height: 250px; width: 350px;" alt="">
                            <% }
                                else
                                { %>
                            <img src="<%: articulo.Imagenes[i] %>" class="d-block w-100" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="">
                            <% }  %>
                        </div>
                        <%}
                            else
                            {%>
                        <div class="carousel-item ">
                            <% if (articulo.Imagenes[0].Nombre_imagen == "fallacarga")
                                { %>
                            <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: fill; height: 250px; width: 350px;" alt="">
                            <% }
                                else if (articulo.Imagenes[0].Nombre_imagen == "sinimagen")
                                { %>
                            <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: fill; height: 300px; width: 400px;" alt="">
                            <% }
                                else
                                { %>
                            <img src=" <%: articulo.Imagenes[i]%>" class="d-block w-100" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="">
                            <% } %>
                        </div>
                        <% }
                            }%>
                    </div>


                    <button class="carousel-control-prev" id="ant" type="button" data-bs-target="#carouselExampleDark_<%: articulo.Id_a %>" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon " aria-hidden="true"></span>
                        <span class="visually-hidden">Prev</span>
                    </button>
                    <button class="carousel-control-next" id="sig" type="button" data-bs-target="#carouselExampleDark_<%: articulo.Id_a %>" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>


                <center>
                    <div class="card-header text-center" style="font-size: 30px; color: black; border-block-color: black; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><strong><%: articulo.nombre_a %></strong></div>
                    <div class="card-body text-center" style="margin-bottom: 20px;">
                        <h5 class="card-title" style="font-size: 20px; color: black; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">$<%:articulo.precio_a  %></h5>
                        <p class="card-text" style="font-size: 20px; color: black; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%:articulo.categoria_a.nombre_categoria%></p>
                        <a href="<%: ResolveUrl("~/Detalles.aspx?id=" + articulo.Id_a) %>" class="btn btn-dark" style="font-weight: bold; border-color: black;" title="Detalles">Ver</a>
                        <%if (Session["usuario"] != null && verificarusuario(articulo.Id_a) == true)
                            { %>
                        <a href="<%: ResolveUrl("~/Alta_Modificacion.aspx?id=" + articulo.Id_a) %>" class="btn btn-dark" style="font-weight: bold; border-color: black;" title="modif">Modificar</a>
                        <a href="<%: ResolveUrl("~/EliminarPausar.aspx?id=" + articulo.Id_a) %>" class="btn btn-dark" style="font-weight: bold; border-color: black;" title="modif">Eliminar/Pausar</a>
                        <%} %>

                        <%if (Session["usuario"] != null && verificarusuario(articulo.Id_a) == false)
                            {%>
                        <a href="Default.aspx?id=<%:articulo.Id_a %>" class="btn btn-dark" usesubmitbehavior="false" commandargument='<%=articulo.Id_a%>'
                            style="font-weight: bold; border-color: black;">Agregar a Favoritos <i class="bi bi-star-fill "></i></a>
                        <a href="<%: ResolveUrl("~/Alta_Modificacion.aspx?id=" ) %>" class="btn btn-dark" style="font-weight: bold; border-color: black; font-weight: bold;"><i class="bi bi-phone-vibrate "></i></a>
                        <%}%>
                    </div>
                </center>

            </div>
        </div>

        <%
            }%>
    </div>
</asp:Content>
