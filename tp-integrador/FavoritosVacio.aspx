<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="FavoritosVacio.aspx.cs" Inherits="tp_integrador.FavoritosVacio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />  
    <br />  
     
    <h1 style="text-align:center ;color: midnightblue;font-size:50px; text-decoration-line:underline; "><strong>  Aún no tenes Inmuebles en Favoritos</strong></h1>
   <center> <img style="width:60%;height:500px" src="https://imgs.search.brave.com/9nEUrgj_dCbX4qPy0FMP8FoOEpxN_xRqOD0h0L4qFXU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG4u/cGl4YWJheS5jb20v/cGhvdG8vMjAxNy8x/MS8xNi8xNi8yOS9y/ZWFsLWVzdGF0ZS0y/OTU1MDU3XzY0MC5q/cGc"alt="" />
    </center>  
    
 <div class="btn-container" style="display: flex; justify-content: center; padding-bottom: 40px; ">
     <a href="<%: ResolveUrl("~/Default.aspx") %>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color: dimgray;text-decoration-color :black;
                 color:black ; background-color:aqua; "><strong>Agregar Inmuebles Presionando: </strong><i class="bi bi-star "></i></a>
 </div>
</asp:Content>
