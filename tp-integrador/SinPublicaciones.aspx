<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="SinPublicaciones.aspx.cs" Inherits="tp_integrador.SinPublicaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="noencontrado">  
        <h1 style="text-align:center ;color: midnightblue;font-size:50px; text-decoration-line:underline; ">No encontramos edificaciones por ningun lado</h1>
   <center>
        <img src="https://imgs.search.brave.com/jjivKhqm8VwI6753SV3ApbFp0ww26bHJ2Jy4-6Q8gaM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZnJlZWltYWdl/cy5jb20vaW1hZ2Vz/L2xhcmdlLXByZXZp/ZXdzL2ViYy9tYWdu/aWZ5aW5nLWdsYXNz/LW1hcC0xMjQ1MTYy/LmpwZz9mbXQ" alt="Alternate Text" style=" width:60%" />
        <p style="text-align:center ;color: midnightblue;font-size:30px; ">Intenta publicar algo o busca tu futuro hogar en nuestra pagina</p>
    </center>
    </div>
    <div class="btn-container" style="display: flex; justify-content: center; padding-bottom: 40px; ">
    <a href="<%: ResolveUrl("~/Alta_Modificacion.aspx") %>"  class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color: dimgray;text-decoration-color :black;
                color:black ; background-color:aqua; "><strong>Publica tu Inmueble  </strong></a>
</div>
    
    <div class="btn-container" style="display: flex; justify-content: center; padding-bottom: 40px; ">
    <a href="<%: ResolveUrl("~/Default.aspx") %>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color: dimgray;text-decoration-color :black;
                color:black ; background-color:aqua; "><strong>Busca tu hogar soñado </strong></a>
</div>
    

</asp:Content>
