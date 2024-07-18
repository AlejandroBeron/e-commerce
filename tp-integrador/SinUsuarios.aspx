<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="SinPublicaciones.aspx.cs" Inherits="tp_integrador.SinPublicaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="noencontrado">  
        <h1 style="text-align:center ;color: midnightblue;font-size:50px; text-decoration-line:underline; ">No tienes usuarios a confirmar</h1>
   <center>
        <img src="https://webprogramacion.com/wp-content/uploads/2022/01/900.jpg" alt="Alternate Text" style=" width:40%" />
        <p style="text-align:center ;color: midnightblue;font-size:30px; "></p>
    </center>
    </div>
 
    <div class="btn-container" style="display: flex; justify-content: center; padding-bottom: 40px; ">
    <a href="<%: ResolveUrl("~/Default.aspx") %>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color: dimgray;text-decoration-color :black;
                color:black ; background-color:aqua; "><strong>Volver al menu </strong></a>
</div>
    

</asp:Content>