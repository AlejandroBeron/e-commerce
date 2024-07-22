<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="CarritoVacio.aspx.cs" Inherits="tp_web_carritoCompra.CarritoVacio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="title" style="text-align: center; font-size: 40px; color: darkgreen; text-decoration-line: underline; margin-top: 5%; margin-bottom: 2%;">
        <h1><strong>Su Carrito Se Encuentra Vacio</strong></h1>
        <div class="row" style="margin-top: 5%; margin-bottom: 2%; justify-content: center;">
            <img src="https://cdn-icons-png.flaticon.com/512/11329/11329060.png" alt="empty cart" style="width: 40%; height: 40%;">
        </div>
    </div>

    <div class="btn-container" style="display: flex; justify-content: center; padding-bottom: 40px;">
        <a href="<%: ResolveUrl("~/Default.aspx") %>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color: dimgray; color: black; background-color: seagreen;"><strong>Volver al Inicio </strong></a>
    </div>
</asp:Content>
