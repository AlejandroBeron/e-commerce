<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="DetalleyConfirmar.aspx.cs" Inherits="tp_integrador.DetalleyConfirmar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
        <div class="reg ">

            <div class="registro" style="background: lightblue; border-radius: 3%; max-width: 800px; max-height: 700px;">
                <div class="container">
                    <center>
                        <div class="row" style="margin-top: 10%; margin-bottom: 5%">

                            <div class="card border-primary" style="border-color: blue; height: 300px; width: 700px; margin-top: 5px; margin-left: 5px;">
                                <div id="Datosdelinmueble">
                                    <div class="card-header text-center" style="font-size: 25px; text-align: center; color: midnightblue; border-block-color: blue;">
                                        <h2><strong id="lblnombre" runat="server" style="font-size: 20px; color: midnightblue; border-block-color: blue;"></strong></h2>
                                    </div>
                                    <div class="card-body text-center" style="margin-bottom: 15px;">
                                        <div class="card-title">
                                            <p><strong id="lblDescripcion" runat="server" style="font-size: 15px; color: navy;"></strong></p>
                                        </div>
                                        <div class="row g-12">
                                            <div class="input-group mb-3" style="width: 20%; border-color: aqua; margin-left: 10px; font-weight: bold; text-align: center;">
                                                <asp:Label Text="Ambientes: " runat="server" Style="font-size: 15px; color: darkblue;" />
                                                <asp:Label Text="" runat="server" ID="lblambientes" Style="font-size: 15px; color: darkblue;" />
                                            </div>
                                            <div class="input-group mb-3" style="width: 20%; border-color: aqua; font-weight: bold; text-align: center;">
                                                <asp:Label Text="Baños: " runat="server" Style="font-size: 15px; color: darkblue;" />
                                                <asp:Label Text="" runat="server" ID="lblbaños" Style="font-size: 15px; color: darkblue;" />
                                            </div>
                                            <div class="input-group mb-3" style="width: 20%; border-color: aqua; font-weight: bold; text-align: center;">
                                                <asp:Label Text="" runat="server" ID="lblcategoriaytipo" Style="font-size: 15px; color: darkblue;" />

                                            </div>

                                            <div class="input-group mb-3" style="width: 20%; border-color: aqua; font-weight: bold; text-align: center;">
                                                <p><strong id="lblprecio" runat="server" style="font-size: 15px; color: darkblue;"></strong></p>
                                            </div>
                                        </div>

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
                                                <div class="form-check form-check-inline">
                                                    <asp:CheckBox Text="Cochera" runat="server" ID="Checkcochera" Style="font-weight: bold; color: black;" />
                                                </div>
                                                <div class="form-check form-check-inline ">
                                                    <asp:CheckBox Text="Patio" runat="server" ID="Checkpatio" Style="font-weight: bold; color: black;" />
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row g-3">
                                                <div class="mx-auto d-flex" style="justify-content: center;">
                                                    <div class="form-check form-check-inline">
                                                        <asp:CheckBox Text="Pavimento" runat="server" ID="Checkpavimento" Style="font-weight: bold; color: black;" />
                                                    </div>

                                                    <div class="form-check form-check-inline">
                                                        <asp:CheckBox Text="Cloaca" runat="server" ID="Checkcloaca" Style="font-weight: bold; color: black;" />
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
                            </div>
                        </div>
                    </center>
                    <center>

                        <div class="col-md-8 " style="margin-top: 5px">
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
                                        <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: scale-down; height: 300px; width: 300px" alt="">
                                        <% }
                                            else if (inmueble.Imagenes[i].Nombre_imagen == "sinimagen")
                                            { %>
                                        <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: scale-down; height: 300px; width: 300px;" alt="">
                                        <% }
                                            else
                                            { %>
                                        <img src="<%: inmueble.Imagenes[i] %>" class="d-block w-100" style="object-fit: scale-down; height: 300px; width: 300px;" alt="">
                                        <% }  %>
                                    </div>
                                    <%}
                                        else
                                        {%>
                                    <div class="carousel-item ">
                                        <% if (inmueble.Imagenes[0].Nombre_imagen == "fallacarga")
                                            { %>
                                        <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: scale-down; height: 300px; width: 300px;" alt="">
                                        <% }
                                            else if (inmueble.Imagenes[0].Nombre_imagen == "sinimagen")
                                            { %>
                                        <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: scale-down; height: 300px; width: 300px;" alt="">
                                        <% }
                                            else
                                            { %>

                                        <img src=" <%: inmueble.Imagenes[i]%>" class="d-block w-100" style="object-fit: scale-down; height: 300px; width: 300px;" alt="">
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
                        </div>
                    </center>

                    <div class="row" style="margin-top: 5px;">
                        <center>
                            <asp:Button ID="btnagregarfavorito" runat="server" Text="Confirmar" OnClick="btnagregarfavorito_Click1" CssClass="btn btn-primary" Style="background-color: aqua; color: black; font-weight: bold; border-color: dimgrey; width: 30%" />
                            <asp:Button ID="btnRechazar" runat="server" Text="Rechazar" OnClick="btnRechazar_Click" CssClass="btn btn-outline-danger" Style="background-color: aqua; color: black; font-weight: bold; border-color: dimgrey; width: 30%" />

                            <div class="btn " style="width: 100%; margin-top: 15px; display: flex; justify-content: center; align-items: center;">

                                <asp:Button ID="cerrarbtn" Text="Cerrar" runat="server" OnClick="cerrarbtn_Click" Style="padding: 7px 10px; background-color: #5488a3; color: #fff; border-radius: 25px; cursor: pointer; transition: all 300ms ease;" />

                            </div>
                        </center>
                    </div>
                </div>

            </div>
        </div>

    </div>

</asp:Content>

