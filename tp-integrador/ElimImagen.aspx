<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="ElimImagen.aspx.cs" Inherits="tp_integrador.ElimImagen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <h1>Listado de Imágenes del Inmueble</h1>
    <div>
        <asp:Repeater runat="server" ID="rptImagenes">
            <ItemTemplate>
                <img src='<%# Eval("Nombre_imagen") %>' alt="Imagen de Inmueble" style="width: 300px; height: 200px; margin: 10px;" />
            </ItemTemplate>
        </asp:Repeater>
    </div>
 
</asp:Content>
