<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Consultarealizada.aspx.cs" Inherits="tp_integrador.Consultarealizada" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div>
        <div>
            <center>

                <div class="row" style="margin-top: 5%; margin-bottom: 2%; justify-content: center;">

                    <h1 scope="col" style="color: black; width: 600%;"><strong>¡CONSULTA REALIZADA CON EXITO!</strong></h1>
                </div>
            </center>

            <div class="row" style="margin-top: 5%; margin-bottom: 2%; justify-content: center;">
                <img src="https://umh2809.umh.es/files/2016/05/OK-150x150.png" alt="empty cart" style="width: 20%; height: 20%;">
            </div>
        </div>
        <center>

            <div class="row" style="margin-top: 5%; margin-bottom: 2%; justify-content: center;">

                <h2 scope="col" style="color: black; width: 600%;"><strong>¡MUCHAS GRACIAS POR ESCRIBIRNOS!</strong></h2>
            </div>
            <div>
                <asp:Button ID="btnConsulta" runat="server" Text="Inicio" OnClick="btnConsulta_Click" CommandArgument='<%# Eval("articulo.codigo_a") %>'

                    class="btn btn-dark" Style="font-weight: bold; border-color: white; font-size: 25px;" />
                
            </div>
            <br />  
            <br />  
    </div>






</asp:Content>
