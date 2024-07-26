<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="tp_integrador.Detalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <center>
            <div class="row" style="margin-top: 10%; margin-bottom: 10%">
                <div class="col-md-6">


                    <div id="carouselExampleDark" class="carousel carousel-dark slide">
                        <div class="carousel-indicators">
                            <% for (int i = 0; i < articulos.Imagenes.Count(); i++)
                                { %>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="<%= i %>"
                                <% if (i == 0)
                                { %>
                                class="active" aria-current="true" <% } %> aria-label="Slide <%= i + 1 %>">
                            </button>
                            <% } %>
                        </div>
                        <div class="carousel-inner">
                            <%
                                bool first = true;
                                for (int i = 0; i < articulos.Imagenes.Count(); i++)
                                {
                                    if (first)
                                    {
                                        first = false; %>
                            <div class="carousel-item active">

                                <% if (articulos.Imagenes[i].Nombre_imagen == "fallacarga")
                                    { %>
                                <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: scale-down; height: 350px; width: 550px;" alt="">
                                <% }
                                    else if (articulos.Imagenes[i].Nombre_imagen == "sinimagen")
                                    { %>
                                <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: scale-down; height: 350px; width: 550px;" alt="">
                                <% }
                                    else
                                    { %>
                                <img src="<%: articulos.Imagenes[i] %>" class="d-block w-100" style="object-fit: scale-down; height: 350px; width: 550px;" alt="">
                                <% }  %>
                            </div>
                            <%}
                                else
                                {%>


                            <div class="carousel-item ">
                                <% if (articulos.Imagenes[0].Nombre_imagen == "fallacarga")
                                    { %>
                                <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: scale-down; height: 350px; width: 550px;" alt="">
                                <% }
                                    else if (articulos.Imagenes[0].Nombre_imagen == "sinimagen")
                                    { %>
                                <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: scale-down; height: 350px; width: 550px;" alt="">
                                <% }
                                    else
                                    { %>

                                <img src=" <%: articulos.Imagenes[i]%>" class="d-block w-100" style="object-fit: scale-down; height: 350px; width: 550px;" alt="">
                                <% } %>
                            </div>
                            <% }

                                } %>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="previous">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">next</span>
                        </button>
                    </div>
                    <br />
                    <center>
                        <p><strong id="lblDireccion" runat="server" style="font-size: 15px; color: darkblue;"></strong></p>




                        <asp:Button ID="btnagregarfavorito" class="btn btn-outline-info" runat="server" Text="Agregar al carrito" OnClick="btnagregarfavorito_Click1" Style="font-weight: bold; width: 30%" />



                        <% if (Session["usuario"] == null)
                            {%>
                        <asp:Label Text="" Style="color: darkred; font-size: 15px; font-weight: bold;" runat="server" />
                        <% }%>
                        <br />
                        <br />
                        <a class="btn btn-outline-primary text-black text-decoration-none" href="Default.aspx" style="margin-bottom: 2px; width: 30%"><strong>Atrás</strong></a>
                        <a class="btn btn-outline-primary text-black text-decoration-none" href="carrito.aspx" style="margin-bottom: 2px; width: 30%"><strong>Comprar</strong></a>

                    </center>
                </div>

                <div class="card border-primary" style="border-color: blue; margin-left: 10px; height: 600px; width: 500px">
                    <center>
                        <div id="DatosArticulos">
                            <div class="card-header text-center" style="font-size: 25px; text-align: center; color: midnightblue; border-block-color: blue;">
                                <h2><strong id="lblnombre" runat="server" style="font-size: 25px; color: midnightblue; border-block-color: blue; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></strong></h2>
                                <p><strong id="lblprecio" runat="server"></strong></p>
                            </div>
                            <div class="mb-3">
                                <select class="form-select form-select-sm" id="selectUnit" name="selectUnit" runat="server" required>
                                    <option value="-1" selected>Unidades: Seleccionar</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>

                                </select>

                            </div>
                            <div class="card-body text-center" style="margin-bottom: 20px; height: 220px;">
                                <div class="card-title">
                                    <p><strong id="lblcategoriaytipo" runat="server" style="font-size: 20px; color: darkblue; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></strong></p>
                                </div>

                                <div class="row g-12">
                                    <div class="col mb-6" style="width: 50%; text-align: center; border-color: aqua; margin-left: 10px; font-weight: bold;">
                                        <asp:Label Text="" runat="server" ID="lblambientes" Style="font-size: 20px; color: darkblue;" />
                                    </div>
                                    <div class="col mb-6" style="width: 40%; text-align: center; border-color: aqua; font-weight: bold;">
                                        <asp:Label Text="" runat="server" ID="lblbaños" Style="font-size: 20px; color: darkblue;" />
                                    </div>
                                </div>

                                <label for="inputState" class="form-label" style="color: black; margin-top: 10px;"><strong>Descripción:</strong></label>
                                <p><strong id="lblDescripcion" runat="server" style="font-size: 16px; color: navy;"></strong></p>
                            </div>
                            <br />
                            
                            <a id="sendbtn"  class="shortcode_wa_button btn btn-success text-white text-decoration-none" href="https://web.whatsapp.com/send?phone=5491136482023&amp;text=Hola, quiero realizar una consulta." style="margin-bottom: 2px; width: 40%";><span>Realizá tu Consulta</span></a>
                            <div class="card-footer text-center" style="margin-top: 10px; text-align: center; color: midnightblue; border-block-color: black;">
                                <%/*   <div class="form-check" style="text-align: center;">
                                                <label for="inputState" class="form-label" style="color: navy;"><strong>Servicio:</strong></label>

                                                <div class="mx-auto d-flex" style="justify-content: center;">
                                                    <div class="form-check form-check-inline">
                                                        <asp:CheckBox Text="Aire" runat="server" ID="Checkaire" Style="font-weight: bold; color: black;" />
                                                    </div>
                                                    <div class="form-check form-check-inline ">
                                                        <asp:CheckBox Text="Patio" runat="server" ID="Checkpatio" Style="font-weight: bold; color: black;" />
                                                    </div>

                                                    <div class="form-check form-check-inline">
                                                        <asp:CheckBox Text="Luz" runat="server" ID="Checkluz" Style="font-weight: bold; color: black;" />
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <asp:CheckBox Text="Cochera" runat="server" ID="Checkcochera" Style="font-weight: bold; color: black;" />
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <asp:CheckBox Text="Cloaca" runat="server" ID="Checkcloaca" Style="font-weight: bold; color: black;" />
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row g-3">
                                                    <div class="mx-auto d-flex" style="justify-content: center;">
                                                        <div class="form-check form-check-inline">
                                                            <asp:CheckBox Text="Pavimento" runat="server" ID="Checkpavimento" Style="font-weight: bold; color: black;" />
                                                        </div>
                                                        <div class="form-check form-check-inline ">
                                                            <asp:CheckBox Text="Gas Natural" runat="server" ID="checkgas" Style="font-weight: bold; color: black;" />
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <asp:CheckBox runat="server" ID="Checkcalefaccion" Text="Calefacción" Style="font-weight: bold; color: black;" />

                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <asp:CheckBox Text="Agua Corriente" runat="server" ID="checkagua" Style="font-weight: bold; color: black;" />
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>*/ %>
                            </div>

                        </div>
                    </center>

                </div>
            </div>
        </center>
    </div>
</asp:Content>
