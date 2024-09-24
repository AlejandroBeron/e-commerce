<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Alta_Modificacion.aspx.cs" Inherits="tp_integrador.Alta_Modificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Validacion {
            color: red;
            font-size: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <h1 style="text-align: center; color: black; font-size: 50px; text-decoration-line: underline"><strong>Mi Articulo</strong></h1>
    <br />
    <br />

    <div class="row g-3">
        <div class="col-md-6">
            <div class="row g-3" style="margin-left: 15px; font-weight: bold; height: 100px;">
                <label for="inputnombre" class="form-label"><strong>Nombre </strong></label>
                <asp:TextBox runat="server" type="text" class="form-control" Style="border-color: black" ID="txtnombre" placeholder="Ingrese nombre del articulo" />
                <asp:RequiredFieldValidator CssClass="Validacion" ErrorMessage="Campo obligatorio" ControlToValidate="txtnombre" ValidationGroup="validacionAgregar" runat="server" />
            </div>
            <br />
            <div class="row g-3">
                <div class="input-group mb-3" style="height: 50px; width: 200px; margin-left: 15px; margin-top: 15px;">
                    <label for="inputnombre" class="form-label"><strong>Precio </strong></label>
                    <span class="input-group-text" style="border-color: black"><strong>$</strong>
                        <asp:TextBox runat="server" ID="txtprecio" Style="border: none;" placeholder=" Ingrese un valor" />
                        <asp:RegularExpressionValidator ErrorMessage="El precio solo admite numeros" ValidationGroup="validacionAgregar" ControlToValidate="txtprecio" runat="server" ValidationExpression="^[0-9]+$" CssClass="Validacion" Display="Dynamic" />
                    </span>
                </div>
            </div>
            <%/*<div class="row g-3" style="margin-left: 25px; font-weight: bold;">
<label for="inputGroupSelect01" class="form-label">Tipo de Propiedad</label>
<asp:DropDownList runat="server" ID="selpropiedad" AppendDataBoundItems="true" class="form-select" Style="border-color: aqua">
</asp:DropDownList>
</div>*/ %>
            <br />
                <div class="col-5">
            <div class="row g-3">
                <div class="col-md-10" style="margin-left: 15px;">
                    <label for="inputCity" class="form-label"><strong>Descripción:</strong></label>
                    <asp:TextBox runat="server" type="text" class="form-control" ID="txtdescripcion" Style="border-color: black; font-weight: bold; height: 100px; overflow: auto; white-space: pre-wrap;"/>
                    <asp:RequiredFieldValidator CssClass="Validacion" ErrorMessage="Campo obligatorio" ControlToValidate="txtdescripcion" ValidationGroup="validacionAgregar" runat="server" />
                </div>
            </div>
            <br />
        </div>

            <%/*  <div class="row g-3">
<div class="input-group mb-3" style="height: 45px; width: 280px; border-color: aqua; margin-left: 25px; font-weight: bold;">
<label class="input-group-text" style="border-color: aqua; font-weight: bold;" for="inputGroupSelect01">Ambientes:</label>
<asp:DropDownList runat="server" ID="ambientes" class="form-select" Style="width: 15px; border-color: aqua; font-weight: bold;">
<asp:ListItem Text="1" />
<asp:ListItem Text="2" />
<asp:ListItem Text="3" />
<asp:ListItem Text="4" />
<asp:ListItem Text="5" />
</asp:DropDownList>
<asp:RequiredFieldValidator CssClass="Validacion" ErrorMessage="Campo obligatorio" ControlToValidate="ambientes" ValidationGroup="validacionAgregar" runat="server" InitialValue="0" />
</div>
<div class="input-group mb-3" style="height: 45px; width: 280px; border-color: aqua; margin-left: 25px; font-weight: bold;">
<label class="input-group-text" style="border-color: aqua; font-weight: bold;" for="inputGroupSelect01">Baños:</label>
<asp:DropDownList runat="server" ID="baños" class="form-select" Style="width: 15px; border-color: aqua; font-weight: bold;">
<asp:ListItem Text="1" />
<asp:ListItem Text="2" />
<asp:ListItem Text="3" />
<asp:ListItem Text="4" />
<asp:ListItem Text="5" />
</asp:DropDownList>
<asp:RequiredFieldValidator CssClass="Validacion" ErrorMessage="Campo obligatorio" ControlToValidate="baños" ValidationGroup="validacionAgregar" runat="server" InitialValue="0" />
</div>
</div>
<div class="row g-3">
<div class="col-md-6" style="margin-left: 25px; font-weight: bold;">
<label for="inputCity" class="form-label">Dirección</label>
<asp:TextBox runat="server" type="text" class="form-control" ID="txtdireccion" Style="border-color: aqua;" />
<asp:RequiredFieldValidator CssClass="Validacion" ErrorMessage="Campo obligatorio" ControlToValidate="txtdireccion" ValidationGroup="validacionAgregar" runat="server" />
</div>
</div>
<asp:UpdatePanel ID="Updatepanel2" runat="server" style="margin-left: 50px;">
<ContentTemplate>
<div class="row g-3">
<div class="col-md-3" style="margin-left: 25px; font-weight: bold;">
<label for="inputGroupSelect01" class="form-label">Codigo Postal</label>
<asp:DropDownList runat="server" ID="codigo_postal" OnSelectedIndexChanged="codigo_postal_SelectedIndexChanged" AutoPostBack="true" class="form-select" Style="border-color: aqua">
</asp:DropDownList>
</div>
<div class="col-md-8" style="margin-left: 25px; font-weight: bold;">
<label for="inputGroupSelect01" class="form-label">Localidad</label>
<asp:DropDownList runat="server" ID="localidad" class="form-select" Style="border-color: aqua">
</asp:DropDownList>
</div>
</div>
</ContentTemplate>
</asp:UpdatePanel>
</div>*/ %>

            <div class="col-10 col-md-6">
                <asp:UpdatePanel ID="Updatepanel1" runat="server" style="margin-left: 50px;">
                    <ContentTemplate>
                        <div class="row g-3" style="margin-left: 15px; font-weight: bold; height: 100px; border-radius: 20px;">
                            <label for="txtImagenurl" class="form-label"><strong>Url imagen</strong></label>
                            <asp:TextBox runat="server" type="text" ID="txtImagenurl" CssClass="from-control" Style="width: 80%; border-color: black;" AutoPostBack="true" OnTextChanged="txtImagenurl_TextChanged" />
                            <asp:Button Text="Agregar imagenes" runat="server" type="submit" Style="width: 80%" class="btn btn-dark" ID="Btn_addimg" OnClick="Btn_addimg_Click" />
                        </div>
                        <br />
                        <br />
                        <center>
                            <div id="carouselExample" class="carousel carousel-dark slide" style="height: 300px; width: 300px;">
                                <div class="carousel-inner">
                                    <asp:Repeater ID="rptImages" runat="server">
                                        <ItemTemplate>
                                            <div class='<%# Container.ItemIndex == 0 ? "carousel-item active" : "carousel-item" %>' style="margin-top: 40px;">
                                                <img src='<%# Container.DataItem %>' alt="Imagen" id="imgselec" style="object-fit: scale-down; height: 25vh; width: 100%;"" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </center>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <br />

        <%/*  <div class="row g-3">
<div class="input-group mb-3" style="height: 50px; width: 300px; border-color: aqua; margin-left: 25px; font-weight: bold;">
<label class="input-group-text" style="border-color: aqua; font-weight: bold;" for="inputGroupSelect01">Tipo de Operación:</label>
<asp:DropDownList runat="server" ID="tipoope" class="form-select" Style="width: 20px; border-color: aqua; font-weight: bold;">
<asp:ListItem Text="Alquiler" />
<asp:ListItem Text="Venta" />
</asp:DropDownList>
<asp:RequiredFieldValidator CssClass="Validacion" ErrorMessage="Campo obligatorio" ControlToValidate="tipoope" ValidationGroup="validacionAgregar" runat="server" InitialValue="" />
</div>
</div> */%>

        <br />

        <% /*  <div class="col-12" style="margin-left: 25px;">
<div class="card border-info" style="width: 90%;">
<div class="form-check" style="text-align: center;">
<label for="inputState" class="form-label"><strong>Servicios:</strong></label>
<div class="mx-auto d-flex">
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
<div class="form-check form-check-inline">
<asp:CheckBox Text="Cloaca" runat="server" ID="Checkcloaca" Style="font-weight: bold; color: black;" />
</div>
<div class="form-check form-check-inline">
<asp:CheckBox Text="Pavimento" runat="server" ID="Checkpavimento" Style="font-weight: bold; color: black;" />
</div>
<div class="form-check form-check-inline">
<asp:CheckBox runat="server" ID="Checkcalefaccion" Text="Calefacción" Style="font-weight: bold; color: black;" />
</div>
<div class="form-check form-check-inline">
<asp:CheckBox Text="Aire Acondicionado" runat="server" ID="Checkaire" Style="font-weight: bold; color: black;" />
</div>
</div>
</div>
</div>
</div> */ %>

    


        <%  /* <div class="col-12" style="margin-left: 25px;">
<div class="card border-info" style="width: 90%;">
<div class="form-check" style="text-align: center;">
<label for="inputState" class="form-label"><strong>Opcion de pago:</strong></label>
<div>
<div class="form-check form-check-inline">
<asp:RadioButton Text="Hierro" runat="server" GroupName="Pago" ID="checkHierro" Style="font-weight: bold; color: black;" AutoPostBack="true" />
</div>
<div class="form-check form-check-inline">
<asp:RadioButton Text="Plata" runat="server" GroupName="Pago" ID="checkPlata" Style="font-weight: bold; color: black;" AutoPostBack="true" />
</div>
<div class="form-check form-check-inline">
<asp:RadioButton Text="Oro" runat="server" GroupName="Pago" ID="checkOro" Style="font-weight: bold; color: black;" AutoPostBack="true" />
</div>
<div class="form-check form-check-inline">
<asp:RadioButton Text="Diamante" runat="server" GroupName="Pago" ID="ceckDiamante" Style="font-weight: bold; color: black;" AutoPostBack="true" />
</div>
<div class="form-check form-check-inline">
<asp:RadioButton Text="Platino" runat="server" GroupName="Pago" ID="checkPlatino" Style="font-weight: bold; color: black;" AutoPostBack="true" />
</div>

</div>
</div>
</div>
</div> 
<div style="margin-left: 25px; color: black; padding-top: 30px">
<center>
<asp:Button Text="Nuestros planes de publicacion" runat="server" type="submit" class="btn btn-info" ID="btnInfo" OnClick="btnInfo_Click" />
</center>
</div>*/ %>

        <div class="col-12" style="margin-left: 25px; color: black; padding-top: 30px">
            <asp:Button Text="Agregar" runat="server" type="submit" class="btn btn-dark" ID="btnAgregar" OnClick="btnAgregar_Click" Visible="true" ValidationGroup="validacionAgregar" />
            <asp:Button Text="Modificar" runat="server" type="submit" class="btn btn-dark" ID="btnModificar" OnClick="btnModificar_Click" Visible="false" />
        </div>
</asp:Content>
