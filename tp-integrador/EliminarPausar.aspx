<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="EliminarPausar.aspx.cs" Inherits="tp_integrador.EliminarPausar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="font-weight: bold; color: darkblue; text-align: center; margin-top: 30px; font-size: 60px;"><u>Propiedad</u> <u>Seleccionada:</u></h1>
    <div class="container">
        <center>
            <div class="row" style="margin-top: 10%; margin-bottom: 10%">
                <div class="col-md-8">


                    <div id="carouselExampleDark" class="carousel carousel-dark slide">
                        <div class="carousel-indicators">
                            <% for (int i = 0; i < inmueble.Imagenes.Count(); i++)
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
                                for (int i = 0; i < inmueble.Imagenes.Count(); i++)
                                {
                                    if (first)
                                    {
                                        first = false; %>
                            <div class="carousel-item active">

                                <% if (inmueble.Imagenes[i].Nombre_imagen == "fallacarga")
                                    { %>
                                <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% }
                                    else if (inmueble.Imagenes[i].Nombre_imagen == "sinimagen")
                                    { %>
                                <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% }
                                    else
                                    { %>
                                <img src="<%: inmueble.Imagenes[i] %>" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% }  %>
                            </div>
                            <%}
                                else
                                {%>


                            <div class="carousel-item ">
                                <% if (inmueble.Imagenes[0].Nombre_imagen == "fallacarga")
                                    { %>
                                <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% }
                                    else if (inmueble.Imagenes[0].Nombre_imagen == "sinimagen")
                                    { %>
                                <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% }
                                    else
                                    { %>

                                <img src=" <%: inmueble.Imagenes[i]%>" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
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

                    <asp:LinkButton ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" CommandArgument='<%# Eval("inmueble.Id_I") %>' UseSubmitBehavior="false" OnClientClick="return confirm ('Esta seguro que desea eliminar la Publicación?');" BorderStyle="Dotted" Style="border-radius: 20px; border-color: red;">
                            <i class="bi bi-trash-fill text-danger" style="font-size:50px;"></i>
                    </asp:LinkButton>
                    <%if (inmueble.Pausa == true)
                        { %>
                    <asp:LinkButton ID="btnActivar" runat="server" OnClick="btnPausar_Click" CommandArgument='<%# Eval("inmueble.Id_I") %>' UseSubmitBehavior="false" OnClientClick="return confirm('Esta seguro que desea pausar la Publicación?');" BorderStyle="Dotted" BorderColor="green" Style="border-radius: 20px; margin-left: 40px;">
                            <i class="bi bi-play-fill text-success" style="font-size:50px;"></i></asp:LinkButton>
                    <%}
                        else
                        {%>
                    <asp:LinkButton ID="btnPausar" runat="server" OnClick="btnPausar_Click" CommandArgument='<%# Eval("inmueble.Id_I") %>' UseSubmitBehavior="false" OnClientClick="return confirm('Esta seguro que desea pausar la Publicación?');" BorderStyle="Dotted" BorderColor="turquoise" Style="border-radius: 20px; margin-left: 40px;">
                            <i class="bi bi-pause-fill text-info" style="font-size:50px;"></i></asp:LinkButton>
                    <%} %>
                </div>


                <div class="card border-primary" style="border-color: blue; height: 600px; width: 350px">
                    <center>
                        <div id="Datosdelinmueble">
                            <div class="card-header text-center" style="font-size: 30px; text-align: center; color: midnightblue; border-block-color: blue;">
                                <p><strong id="lblprecio" runat="server"></strong></p>
                            </div>
                            <div class="card-body text-center" style="margin-bottom: 20px;">
                                <div class="card-title">
                                    <h2><strong id="lblnombre" runat="server" style="font-size: 25px; color: midnightblue; border-block-color: blue;"></strong></h2>
                                </div>
                                <p><strong id="lblcategoria" runat="server" style="font-size: 20px; color: darkblue;"></strong></p>
                                <p><strong id="lblDescripcion" runat="server" style="font-size: 16px; color: navy;"></strong></p>
                                <div class="row g-12">
                                    <div class="input-group mb-3" style="width: 50%; border-color: aqua; margin-left: 10px; font-weight: bold;">
                                        <asp:Label Text="Ambientes: " runat="server" Style="font-size: 20px; color: darkblue;" />
                                        <asp:Label Text="" runat="server" ID="lblambientes" Style="font-size: 20px; color: darkblue;" />
                                    </div>
                                    <div class="input-group mb-3" style="width: 40%; border-color: aqua; font-weight: bold;">
                                        <asp:Label Text="Baños: " runat="server" Style="font-size: 20px; color: darkblue;" />
                                        <asp:Label Text="" runat="server" ID="lblbaños" Style="font-size: 20px; color: darkblue;" />
                                    </div>
                                </div>
                                <br />
                                <div class="form-check" style="text-align: center;">
                                    <label for="inputState" class="form-label" style="color: navy;"><strong>Servicio:</strong></label>

                                    <div class="mx-auto d-flex" style="justify-content: center;">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox Text="Agua Corriente" runat="server" ID="checkagua" Style="font-weight: bold; color: black;" />
                                        </div>
                                        <div class="form-check form-check-inline ">
                                            <asp:CheckBox Text="Gas Natural" runat="server" ID="checkgas" Style="font-weight: bold; color: black;" />
                                        </div>

                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox Text="Luz" runat="server" ID="Checkluz" Style="font-weight: bold; color: black;" />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row g-3">
                                        <div class="mx-auto d-flex" style="justify-content: center;">
                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox Text="Cochera" runat="server" ID="Checkcochera" Style="font-weight: bold; color: black;" />
                                            </div>
                                            <div class="form-check form-check-inline ">
                                                <asp:CheckBox Text="Patio" runat="server" ID="Checkpatio" Style="font-weight: bold; color: black;" />
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox Text="Cloaca" runat="server" ID="Checkcloaca" Style="font-weight: bold; color: black;" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row g-3">
                                        <div class="mx-auto d-flex" style="justify-content: center;">
                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox Text="Pavimento" runat="server" ID="Checkpavimento" Style="font-weight: bold; color: black;" />
                                            </div>


                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox runat="server" ID="Checkcalefaccion" Text="Calefacción" Style="font-weight: bold; color: black;" />

                                            </div>
                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox Text="Aire" runat="server" ID="Checkaire" Style="font-weight: bold; color: black;" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </center>
                </div>
            </div>
        </center>
    </div>


</asp:Content>
