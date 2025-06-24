<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_integrador.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .icon-move {
            transition: transform 0.5s;
        }

            .icon-move:hover {
                transform: translateY(-10px);
            }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />


    <br />
    <div>
        <div>
            <div id="carouselCategorias" class="carousel slide border border-dark p-3">
                <div class="carousel-inner">
                    <% int contador = 0; %>
                    <% int grupo = 0; %>

                    <% foreach (Dominio.Categoria categoria in listaCategorias)
                        { %>
                    <% if (contador % 5 == 0)
                        { %>
                    <!-- Crear una nueva "carousel-item" cada 6 tarjetas -->
                    <div class="carousel-item <% if (grupo == 0)
                        { %> active <% } %>">
                         <div class="position-absolute w-100 text-center" style="top: 10px; font-size: 24px; font-weight: bold; color:darkorange;">
                              CATEGORIAS
                      </div>
                        <br />
                        <br />
                        <div class="d-flex justify-content-center flex-wrap">
                            <% } %>
                     
                            <div class="card border-dark mx-2" style="width: 250px; height: 250px; border-width: 3px;">
                                <p class="card-text text-center"><strong></strong></p>
                                <img src="<%:categoria.ImagenesCat %>" class="d-block w-100" style="object-fit: scale-down; height: 150px;" alt="">
                               
                                <center>
                                    <a href="<%: ResolveUrl("~/DetallesCategoria.aspx?id=" + categoria.codigo_categoria) %>" class="btn btn-dark" style="width: 130px; height: 30px; font-size: 12px;">
                                        <strong><%:categoria.nombre_categoria%></strong>
                                    </a>
                                </center>
                            </div>

                            <% contador++; %>

                            <% if (contador % 5 == 0 || contador == listaCategorias.Count)
                                { %>
                        </div>
                    </div>
                    <% grupo++; %>
                    <!-- Incrementamos el grupo -->
                    <% } %>
                    <% } %>
                </div>


                <button class="carousel-control-prev" type="button" data-bs-target="#carouselCategorias" data-bs-slide="prev"
                    style="position: absolute; left: -50px; top: 50%; transform: translateY(-50%);">
                    <span class="carousel-control-prev-icon" style="filter: invert(1);"></span>
                </button>


                <button class="carousel-control-next" type="button" data-bs-target="#carouselCategorias" data-bs-slide="next"
                    style="position: absolute; right: -50px; top: 50%; transform: translateY(-50%);">
                    <span class="carousel-control-next-icon" style="filter: invert(1);"></span>
                </button>
            </div>

            <br />
            <br />

            <% if ((List<Dominio.Articulos>)Session["articulofiltrados"] != null)
                {
                    listaArticulo = (List<Dominio.Articulos>)Session["articulofiltrados"];
                    Session.Remove("articulofiltrados");
                }%>

            <div class="row" style="margin-top: 100px; margin-left: 25px; margin-right: 25px; margin-bottom: 40px;">

                <% foreach (Dominio.Articulos articulo in listaArticulo)
                    { %>
                <%if (articulo.categoria_a.nombre_categoria != "TV")
                    {%>
           
                <div class="col-12 col-md-6 col-lg-4 mb-2">
                    <div class="card border-dark" 
                        <%if (articulo.Pausa == false)
                        {%>style="border-width: 3px; height: 490px; width: 400px; border-color:black;"
                        <%} %>
                        <%if (articulo.Pausa == true)
                        {%>style="border-width: 3px; height: 490px; width: 400px; border-color: blue;  opacity: 0.5;"
                        <%} %>>
                          <%if (articulo.Pausa == true)
                              {%><div class="vgwc-label vgwc-featured hot" style="background-color:orangered; width: 100px; font-size:20px;">
                                <stron>SIN STOCK</stron></div>
                        <%} %>

                        <div id="carouselExampleDark_<%:articulo.Id_a%>" class="carousel carousel-dark slide">
                            <%if (articulo.nombre_a == "Play station 5" || articulo.nombre_a == "Sony Playstation 5 825gb Marvels")
                                {%>
                            <div class="vgwc-label vgwc-featured hot" style="background-color:orangered; width: 80px; font-size:20px;">
                                <stron>30% OFF</stron></div>
                            <%} %>
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
                                <p class="card-text" style="font-size: 20px; color: black; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><strong><%:articulo.categoria_a.nombre_categoria%></strong></p>
                                <a href="<%: ResolveUrl("~/Detalles.aspx?id=" + articulo.Id_a) %>" class="btn btn-dark icon-move" style="font-weight: bold; border-color: black;" title="Detalles">Ver</a>
                                <%if (Session["usuario"] != null && verificarusuario(articulo.Id_a) == true)
                                    { %>
                                <a href="<%: ResolveUrl("~/Alta_Modificacion.aspx?id=" + articulo.Id_a) %>" class="btn btn-dark" style="font-weight: bold; border-color: black;" title="modif">Modificar</a>
                                 <%if (articulo.Pausa == false)
                                     { %>
                                <a href="<%: ResolveUrl("~/EliminarPausar.aspx?id=" + articulo.Id_a) %>" class="btn btn-dark" style="font-weight: bold; border-color: black;" title="modif">Eliminar/Pausar</a>
                                <%}
                                    else if (articulo.Pausa == true)
                                    { %>
                                <a href="<%: ResolveUrl("~/EliminarPausar.aspx?id=" + articulo.Id_a) %>" class="btn btn-dark" style="font-weight: bold; border-color: black;" title="modif">Activar</a>
                                <%}
                                    } %>

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
                <%} %>
                <%
                    }%>
            </div>
            <br />
            <br />
            <div style="background-image: url('https://media.a24.com/p/128949ef736116e46e2e41e8111fe259/adjuntos/296/imagenes/009/402/0009402994/1200x675/smart/playstation-5-pro-todo-lo-que-debes-saber-la-nueva-consola-sony.png'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover; height: 20em; display: flex; flex-direction: column; justify-content: center">

                <h2 style="font-size: 3em; text-align: center; padding: 20px; background: rgba(0,0,0,0.5); color: azure;">Promociones 💪</h2>
            </div>
            <br />
            <br />
            <br />
            <br />
            <div class="col" style="display: flex; align-items: center; margin-left: 10px;">
                <img style="margin-right: 100px;" alt="" width="500" height="400" src="https://saturnohogar.vtexassets.com/arquivos/ids/158136/.1.jpg?v=638416130618570000">
                <a class="nav-link"></a>
                <img decoding="async" src="https://www.centrodecomercio.org.ar/fotos/2024/03/i34a2g8ej56fcb1h0d79.jpg" alt="">
            </div>

            <br />
            <br />
            <br />
            <center>
                <div class="card w-75 mb-3" style="border-color: black; border-width: 5px;">
                    <div class="card-header w-75 mb-3" style="margin-left: 110px;">
                        <h5><strong>¿Te gustaría recibir nuestras promociones?</strong></h5>
                    </div>

                    <div class="row">
                        <center>

                            <div class="col" style="display: flex; align-items: center; margin-left: 90px;">
                                <img style="margin-right: 100px;" alt="" width="300" height="200" src="https://pressover.news/wp-content/uploads/2021/07/famicom-portada-scaled.jpg">


                                <div id="formulario">
                                    <form action="https://formsubmit.co/ale.frecuenci@gmail.com" method="POST">
                                        <label class="labe" for="nombrePro" style="font-size: 20px;"><strong>Nombre:</strong></label><br>
                                        <asp:TextBox ID="txtNombrePro" runat="server" Style="width: 100%; height: 30px;"></asp:TextBox><br>
                                        <br>

                                        <label class="labe" for="emailPro" style="font-size: 20px;"><strong>Email:</strong></label><br>
                                        <asp:TextBox ID="TextEmailPro" runat="server" Style="width: 100%; height: 30px;"></asp:TextBox><br>
                                        <br>
                                    </form>
                                </div>

                                <br />

                                <div class="col" style="margin-top: -25px; display: flex; align-items: center; margin-left: 50px;">
                                    <strong></strong>
                                    <div class="bi bi-envelope icon-move" style="font-size: 100px; margin-left: 100px; margin-bottom: -30px;">
                                    </div>

                                </div>
                            </div>

                            <br />
                            <p class="card-text"></p>

                            <asp:Button Text="Suscribirse" type="submit" runat="server" class="btn btn-dark" ID="btnEnviar" OnClick="btnEnviar_Click"></asp:Button>
                            <br />
                        </center>
                    </div>
                    <br />

                </div>
                <br />
                <br />
                <br />

            </center>

            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="card border-dark" style="margin-left: 45px; border-width: 3px;">
                            <img src="https://imagenes.elpais.com/resizer/v2/LICIQLMGYBE4ZM4WBSAVUXBNKI.jpg?auth=789e2b110b8f5e582bed987776a274964ab09c33ca3e7c2f0e704ed4e8a44826&width=414" class="card-img-top" style=" width: 100%; height: 200px; object-fit: scale-down"; alt="Promoción">
                            <div class="card-body">
                                <center>
                                    <h5 class="card-title">Oferta Especial</h5>
                                    <p class="card-text"><strong>¡Aprovecha esta promoción exclusiva!</strong></p>
                                    <a href="<%: ResolveUrl("~/DetallesCategoria.aspx?id=8") %>" class="btn btn-dark"><strong>Ver más</strong></a>
                                </center>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card border-dark" style="margin-left: 45px; border-width: 3px;">
                            <img src="https://files.merca20.com/uploads/2023/12/SAMS-CLUB-CELULARES-INFINIX-DESCUENTO-.jpg" class="card-img-top" style=" width: 100%; height: 200px; object-fit: scale-down"; alt="Promoción">
                            <div class="card-body">
                                <center>
                                    <h5 class="card-title">Oferta Especial</h5>
                                    <p class="card-text"><strong>¡El celular que buscas esta acá!</strong></p>
                                    <a href="<%: ResolveUrl("~/DetallesCategoria.aspx?id=4") %>" class="btn btn-dark"><strong>Ver más</strong></a>
                                </center>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card border-dark" style="margin-left: 45px; border-width: 3px;">
                            <img src="https://nextgames.com.ar/img/Public/1040-producto-switch-blanca-1-3422.jpg" class="card-img-top" style=" width: 100%; height: 200px; object-fit: scale-down"; alt="Promoción">
                            <div class="card-body">
                                <center>
                                    <h5 class="card-title">Oferta Especial</h5>
                                    <p class="card-text"><strong>¡Tu proxima consola!</strong></p>
                                    <a href="<%: ResolveUrl("~/DetallesCategoria.aspx?id=3") %>" class="btn btn-dark"><strong>Ver más</strong></a>
                                </center>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
          <div class="container mt-4 d-flex align-items-center" style="background-color:darkgrey; height:100px; border: 1px;">
    <div class="row w-100 d-flex justify-content-between align-items-center px-3">
        <div class="col-md-auto">
            <p class="fw-bold" style="font-size:20px; margin-left:20px;"><strong>SEGUINOS EN REDES:</strong></p>
        </div>
        <div class="col-md-auto text-md-start text-center">
            <a href="https://www.facebook.com/" target="_blank" class="btn btn-primary me-2">
                <i class="fab fa-facebook-f" style="margin-right: 10px;"></i><strong>Facebook </strong><i class="bi bi-facebook"></i>
            </a>
            <a href="https://www.instagram.com/" target="_blank" class="btn btn-danger">
                <i class="fab fa-instagram" style="margin-right: 10px;"></i><strong>Instagram </strong><i class="bi bi-instagram"></i>
            </a>
        </div>
    </div>
</div>

 <br />
            <br />
            <br />
            <br />
<div id="carouselOfertas" class="carousel slide border border-dark p-3">
    <div class="carousel-inner">
        <% int contador1 = 0; %>
        <% int grupo1 = 0; %>

        <% foreach (Dominio.Articulos articulo in listaArticulo)
            { %>
            <% if (articulo.Estado == true)
                { %>

                <% if (contador1 % 5 == 0)
                    { %>
                <div class="carousel-item <% if (grupo1 == 0)
                    { %> active <% } %>">
                    <div class="position-absolute w-100 text-center" style="top: 10px; font-size: 24px; font-weight: bold; color:darkorange;">
                        OFERTAS DESTACADAS
                    </div>
                    <br />
                    <div class="d-flex justify-content-center flex-wrap mt-4">
                <% } %>

                <div class="card border-dark mx-2" style="width: 250px; height: 250px; border-width: 3px;">
                    <img src="<%: articulo.Imagenes.Count() > 0 ? articulo.Imagenes[0] : articulo.imagen_a %>" class="d-block w-100" style="object-fit: scale-down; height: 150px;" alt="">
                    <center>
                        <a href="<%: ResolveUrl("~/Detalles.aspx?id=" + articulo.Id_a) %>" class="btn btn-dark" style="width: 130px; height: 40px; font-size: 12px;">
                            <strong><%: articulo.nombre_a %></strong>
                        </a>
                    </center>
                </div>

                <% contador1++; %>

                <% if (contador1 % 5 == 0 || contador1 == listaArticulo.Count)
                    { %>
                    </div>
                </div>
                <% grupo1++; %>
                <% } %>

            <% } %>
        <% } %>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#carouselOfertas" data-bs-slide="prev" 
        style="position: absolute; left: -50px; top: 50%; transform: translateY(-50%);">
        <span class="carousel-control-prev-icon" style="filter: invert(1);"></span>
    </button>

    <button class="carousel-control-next" type="button" data-bs-target="#carouselOfertas" data-bs-slide="next" 
        style="position: absolute; right: -50px; top: 50%; transform: translateY(-50%);">
        <span class="carousel-control-next-icon" style="filter: invert(1);"></span>
    </button>

   </div>


</div>
        </div>
            <br />
            <br />
            <br />
            <br />


</asp:Content>
