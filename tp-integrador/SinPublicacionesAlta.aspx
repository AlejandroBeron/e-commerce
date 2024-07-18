<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="SinPublicaciones.aspx.cs" Inherits="tp_integrador.SinPublicaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="noencontrado">  
        <h1 style="text-align:center ;color: midnightblue;font-size:50px; text-decoration-line:underline; ">No tienes publicaciones a confirmar</h1>
   <center>
        <img src="https://img.freepik.com/vector-premium/ilustracion-vector-dibujos-animados-paisaje-urbano-estilo-aplicacion-ninos-corte-papel-casas-bienes-inmuebles-edificios-ciudad-alta_570429-26884.jpg?size=626&ext=jpg&ga=GA1.1.672697106.1717891200&semt=sph" alt="Alternate Text" style=" width:60%" />
        <p style="text-align:center ;color: midnightblue;font-size:30px; "></p>
    </center>
    </div>

   
    <div class="btn-container" style="display: flex; justify-content: center; padding-bottom: 40px; ">
    <a href="<%: ResolveUrl("~/Default.aspx") %>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color: dimgray;text-decoration-color :black;
                color:black ; background-color:aqua; "><strong>Volver al menú</strong></a>
</div>
    

</asp:Content>