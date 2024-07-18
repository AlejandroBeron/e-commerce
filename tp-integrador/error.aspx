<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="tp_integrador.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top: 5%; margin-bottom: 2%; justify-content: center;">
       <img src="https://imgs.search.brave.com/DqDfY7I2RWiMxB-Z3avh8aQbTCByOrHh_tOIN51RJbg/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9ibG9n/LnRob21hc25ldC5j/b20vaHMtZnMvaHVi/ZnMvc2h1dHRlcnN0/b2NrXzc3NDc0OTQ1/NS5qcGc_d2lkdGg9/NjAwJm5hbWU9c2h1/dHRlcnN0b2NrXzc3/NDc0OTQ1NS5qcGc"
           alt="Alternate Text" style="width: 60%;">
   </div>
   <div class="btn-container" style="display: flex; justify-content: center; padding-bottom: 40px;">
       <a href="<%: ResolveUrl("~/Default.aspx")%>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color: dimgray; color: black; background-color: aqua;"><strong> Volver al Inicio </strong><i class="bi bi-buildings-fill "></i></a>
   </div>
</asp:Content>
