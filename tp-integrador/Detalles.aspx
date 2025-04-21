<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="tp_integrador.Detalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div style="background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/PSX-Console-wController.png/1200px-PSX-Console-wController.png'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover; height: 20em; display: flex; flex-direction: column; justify-content: center">

        <h2 style="font-size: 3em; text-align: center; padding: 20px; background: rgba(0,0,0,0.5); color:aliceblue;"><%:articulos.categoria_a%></h2>
    </div>
    <br />
    <br />
    <div class="container">
        <center>
            <br />
            <br />
            <ul class="nav nav-tabs" style="border-color: black; color: black;">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#"><strong>Detalles</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true"><strong>Entregas</strong></a>
                </li>
            </ul>
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
                        <p><strong id="lblDireccion" runat="server" style="font-size: 15px; color: black;"></strong></p>



                        <center>
                            <asp:Button ID="btnagregarfavorito" class="btn btn-dark" runat="server" Text="Agregar al carrito" OnClick="btnagregarfavorito_Click1" Style="font-weight: bold; width: 30%;" />

                            <div class="mb-3">
                                <a><strong>Cantidad: </strong></a>
                                <select class="form-select form-select-sm" id="selectUnit" name="selectUnit" runat="server" required style="width: 23%; top: 15px; margin-right: 8px; border-color: black;">
                                    <option value="-1" selected>Seleccionar</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>

                                </select>

                            </div>
                        </center>
                        <% if (Session["usuario"] == null)

                            {%>
                        <asp:Label Text="" Style="color: darkred; font-size: 15px; font-weight: bold;" runat="server" />
                        <% }%>


                        <a class="btn btn-dark text-white text-decoration-none" href="Default.aspx" style="margin-bottom: 2px; width: 30%"><strong>Atrás</strong></a>
                        <a class="btn btn-dark text-white text-decoration-none" href="carrito.aspx" style="margin-bottom: 2px; width: 30%"><strong>Comprar</strong></a>

                    </center>
                </div>

                <div class="card border-dark" style="border-color: black; border-width: 4px; margin-left: 10px; height: 600px; width: 540px">
                    <center>
                        <div id="DatosArticulos">
                            <div class="card-header text-center" style="font-size: 25px; text-align: center; color: midnightblue; border-block-color: black;">
                                <h2><strong id="lblnombre" runat="server" style="font-size: 28px; color: black; border-block-color: black; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></strong></h2>

                            </div>
                            <div class="card-body text-center" style="margin-bottom: 20px; height: 220px;">
                                <div class="card-title">
                                    <p><strong>Categoria: </strong><strong id="lblcategoriaytipo" runat="server" style="font-size: 18px; color: black; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></strong></p>
                                </div>
                                <div class="card-title">
                                    <p><strong>Marca: </strong><strong id="lblmarca" runat="server" style="font-size: 18px; color: black; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></strong></p>
                                </div>

                                <div class="row g-12">
                                    <div class="col mb-6" style="width: 50%; text-align: center; border-color: aqua; margin-left: 10px; font-weight: bold;">
                                        <asp:Label Text="" runat="server" ID="lblambientes" Style="font-size: 20px; color: black;" />
                                    </div>
                                    <div class="col mb-6" style="width: 40%; text-align: center; border-color: aqua; font-weight: bold;">
                                        <asp:Label Text="" runat="server" ID="lblbaños" Style="font-size: 20px; color: black;" />
                                    </div>
                                </div>

                                <label for="inputState" class="form-label" style="font-size: 25px; color: black; margin-top: 10px;"><strong>Descripción:</strong></label>
                                <br />
                               
                                <p><strong id="lblDescripcion" runat="server" style="font-size: 20px; color: black;"></strong></p>
                            </div>

                            <br />
                            <br />
                            <p><strong id="lblprecio" runat="server" style="font-size: 26px; color: black;"></strong></p>
                            <div class="card-footer text-center" style="margin-top: 10px; text-align: center; color: black; border-block-color: black;">

                                <br />
                                <a id="sendbtn" class="shortcode_wa_button btn btn-success text-white text-decoration-none" href="https://web.whatsapp.com/send?phone=5491136482023&amp;text=Hola, quiero realizar una consulta sobre este producto: <%:articulos.nombre_a%> de $<%:articulos.precio_a%>" style="margin-bottom: 2px; width: 50%;"><span>Realizá tu Consulta <i class="bi bi-whatsapp"></i></span></a>
                                <br />
                                <br />
                                <p class="sc-f6cfc5e5-5 bWRKiI"><strong>¡Nuestras promociones bancarias!</strong></p>
                                  <div class="sc-f6cfc5e5-3 fAAgss"><img src="https://images.fravega.com/f300/11509c3fdfabb96a8fe2c3692726597b.png.webp" width="50" height="auto" loading="lazy" alt="Opción de pago" 
                                class="sc-f6cfc5e5-9 kBtWJP"><img src="https://images.fravega.com/f300/4af8f5c4d9776dcbd6862adf577b3856.png.webp" width="50" height="auto" loading="lazy" alt="Opción de pago" 
                                    class="sc-f6cfc5e5-9 kBtWJP"><img src="https://images.fravega.com/f300/d91d7904a85783a86377e30feb87e7ff.png.webp" width="50" height="auto" loading="lazy" alt="Opción de pago" 
                                        class="sc-f6cfc5e5-9 kBtWJP"><img src="https://images.fravega.com/f300/54c0d769ece1b00f739360d6c900e4f9.png.webp" width="50" height="auto" loading="lazy" alt="Opción de pago" 
                                            class="sc-f6cfc5e5-9 kBtWJP"><img src="https://images.fravega.com/f300/519814f3d2e261325c676a08e1f3b6c1.png.webp" width="50" height="auto" loading="lazy" alt="Opción de pago" 
                                                class="sc-f6cfc5e5-9 kBtWJP"></div>
    
                            </div>

                        </div>
                    </center>

                </div>
                <br />


            </div>
        </center>
    </div>
</asp:Content>
