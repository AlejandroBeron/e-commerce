<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="BandejaVacia.aspx.cs" Inherits="tp_integrador.BandejaVacia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  
    <h1 style="text-align:center ;color: midnightblue;font-size:50px; text-decoration-line:underline; "><strong> Mensajeria vacia, regrese luego </strong></h1>
        <div class="row" style="margin-top: 5%; margin-bottom: 2%; justify-content: center;">
       <img src="https://static.vecteezy.com/system/resources/previews/008/129/222/non_2x/empty-inbox-illustration-concept-vector.jpg"
           alt="Alternate Text" style="width: 60%;">
   </div>
   <div class="btn-container" style="display: flex; justify-content: center; padding-bottom: 40px;">
       <%if ( Session["Emails"] != null)
           { %>
       <a href="<%: ResolveUrl("~/Mensajeria.aspx")%>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color: dimgray; color: black; background-color: aqua;"><strong> Volver a Mensajeria </strong><i class="bi bi-envelope-fill"></i></a>
  <%}
      else
      {%> <a href="<%: ResolveUrl("~/Default.aspx")%>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color: dimgray; color: black; background-color: aqua;"><strong> Volver al Inicio </strong><i class="bi bi-envelope-fill"></i></a>

       <%} %>
       </div>
</asp:Content>
