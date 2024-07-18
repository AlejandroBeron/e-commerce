<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="tp_web_carritoCompra.carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row aling-items-center">
            <div class="col">
                <h1>Tu Carrito  </h1>
            </div>
            <div class="col-auto">
                <a href="<%:ResolveUrl("~/Default.aspx?") %>" class="btn btn-success" style="background-color: seagreen; color: ghostwhite; font-weight: bold; border-color: darkslategray">Salir</a>
            </div>
        </div>

    </div>
    <div class="table-responsive">
        <table class="table cart-items" style="text-align: center; vertical-align: middle; width: 70%; margin-left: 15%; margin-right: 15%;">
            <thead>
                <tr>
                    <th scope="col" style="color: mediumseagreen; width: 50%;"><strong>Producto</strong></th>
                    <th scope="col" style="width: 50%;"></th>
                    <th scope="col" style="color: mediumseagreen; width: 50%; font: 100;"><strong>Precio</strong></th>
                    <th scope="col" style="color: mediumseagreen; width: 40%;"><strong>Cantidad</strong></th>
                    <th scope="col" style="color: mediumseagreen; width: 50%;"><strong>Subtotal</strong></th>
                    <th scope="col" style="color: mediumseagreen; width: 30%;"></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repetirarticulos" runat="server">
                    <ItemTemplate>

                        <tr>
                            <td>
                                <asp:Image ID="imgenarticulo" runat="server" ImageUrl='<%# (Eval("articulos.Imagenes[0].Nombre_imagen").ToString() == "fallacarga") ? "https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" : (Eval("articulos.Imagenes[0].Nombre_imagen").ToString() == "sinimagen") ? "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" : Eval("articulos.Imagenes[0].Nombre_imagen") %>' CssClass="card-img-top" Style="object-fit: scale-down; height: 25vh; width: 50%" alt="Imagen" />
                            </td>
                            <td>
                                <%# Eval("articulos.nombre_a") %><br />
                                <p style="color: dimgray; font-size: small;"><%# Eval("articulos.marca_a.Nombre") %></p>

                            </td>

                            <td style="font-weight: bold;">$<%# Eval("articulos.precio_a") %></td>
                            <td>
                                <div style="margin-top: 6%; font-size: 20px; margin-left: 7%;">
                                    <div class="btn-group">
                                        <asp:Button ID="btnMenos" runat="server" Text="-" OnClick="btnMenos_Click" CommandArgument='<%# Eval("articulos.codigo_a") %>'
                                            UseSubmitBehavior="false"
                                            class="btn btn-outline-secondary" Style="font-weight: bold; border-color: white; font-size: 25px;" />
                                        <span style="font-size: 25px; vertical-align: middle;"><%#Eval("cantidad")%></span>
                                        <asp:Button ID="btnmas" runat="server" Text="+" OnClick="btnmas_Click" CommandArgument='<%# Eval("articulos.codigo_a") %>'
                                            UseSubmitBehavior="false"
                                            class="btn btn-outline-secondary" Style="font-weight: bold; border-color: white; font-size: 25px;" />

                                    </div>
                                </div>
                            </td>
                            <td style="font-weight: bold;">$<%# Eval("SubTotal")  %> </td>
                            <td>
                                <asp:LinkButton ID="btnEliminarCarrito" runat="server" OnClick="btnEliminarCarrito_Click" CommandArgument='<%# Eval("articulos.codigo_a") %>' UseSubmitBehavior="false" OnClientClick="return confirm('Esta seguro que desea eliminar el Articulo?');">
                            <i class="bi bi-trash-fill text-danger"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>




    <center>
        <div style="padding-top: 1%; padding-bottom: 1%; background-color: seagreen; color: antiquewhite;">
            <h2>Cantidad de Total de Articulos: <%:carritoactual.TotalProductos.ToString() %></h2>
            <h2>Precio Total: $<%:carritoactual.TotalPrecio.ToString() %></h2>
            <div>
                <asp:LinkButton ID="FinalizarCompra" runat="server" OnClick="FinalizarCompra_Click" CommandArgument='<%# Eval("articulos.codigo_a") %>' UseSubmitBehavior="false">
                           <a class="btn btn-outline-info text-dark text-decoration-none" href="FinalizarCompra.aspx"><strong><strong>Comprar</strong></strong></a>
                </asp:LinkButton>
            </div>

        </div>
    </center>

</asp:Content>
