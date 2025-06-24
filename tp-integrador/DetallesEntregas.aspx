<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="DetallesEntregas.aspx.cs" Inherits="tp_integrador.DetallesEntregas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/PSX-Console-wController.png/1200px-PSX-Console-wController.png'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover; height: 20em; display: flex; flex-direction: column; justify-content: center">

        <h2 style="font-size: 3em; text-align: center; padding: 20px; background: rgba(0,0,0,0.5); color: aliceblue;">Detalles de entregas</h2>
    </div>
    <br />
    <br />
     <ul class="nav nav-tabs" style="border-color: black; color: black;">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="Detalles.aspx"><strong>Detalles</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="DetallesEntregas.aspx"><strong>Entregas</strong></a>
                </li>
            </ul>
    <br />
    <br />
    <center> 


       <img src="https://www.shutterstock.com/image-vector/young-delivery-man-holding-box-600nw-2456794355.jpg" class="img-fluid" alt="...">
    <br />
    <br />
    <p><strong>Compra de manera sencilla agregando productos al <mark>carrito</mark>. Una vez realizada la compra, recibirás un aviso por mail junto con la factura.</strong></p>
        
       <p><strong> Si tienes alguna duda, puedes consultarnos por <mark>WhatsApp</mark>.</strong></p>

    </center>
     <br />
    <br />

</asp:Content>
