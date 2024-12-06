<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Somos.aspx.cs" Inherits="tp_integrador.Somos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .move-left {
            position: relative;
            animation: move-left 1.5s;
        }

        .move-right {
            position: relative;
            animation: move-right 1.5s;
        }

        @keyframes move-left {
            0% { left: -800px;}
            50% { left: 0px; }
            100% { left: 0;}

        }

        @keyframes move-right {
            0% {right: -800px;}
            50% {right: 0px;}
            100% {right: 0; }
        }

        .flex-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 430px;
            cursor: crosshair;
            opacity: 1;
            filter: contrast(120%);
        }

        .flex-item {
            flex-grow: 1;
            object-fit: cover;
            opacity: 0.8;
            transition: 0.5s ease;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br />
    <div style="text-align: center;">
        <h1><strong>¿Quiénes somos?</strong></h1>
    
    <br /><br />

    <div class="flex-container">
        <div class="flex-item move-left">
            <p><strong>En E-commerce, somos apasionados por la tecnología y estamos comprometidos a ofrecerte lo mejor en productos tecnológicos. Nuestro objetivo es brindarte una experiencia de compra única, donde la innovación y la calidad se encuentran al alcance de tu mano.
            Nuestra misión es democratizar el acceso a la tecnología de vanguardia, proporcionando productos de alta calidad a precios competitivos. Creemos que la tecnología debe ser accesible para todos, y trabajamos incansablemente para hacer realidad esta visión.</strong></p>
            <br>
            <p><strong>Nuestra misión: es democratizar el acceso a la tecnología de vanguardia, proporcionando productos de alta calidad a precios competitivos. Creemos que la tecnología debe ser accesible para todos, y trabajamos incansablemente para hacer realidad esta visión.</strong></p>
            <br />
            <p><strong>Nuestro compromiso: nos comprometemos a ofrecerte una experiencia de compra segura y confiable. Desde la selección de productos hasta la entrega en tu puerta, cada detalle es importante para nosotros. Queremos que te sientas seguro y satisfecho con cada compra que realices en nuestra tienda.</strong></p>
        </div>
        <img src="https://img.freepik.com/fotos-premium/variedad-dispositivos-tecnologicos-modernos-dispuestos-sobre-fondo-azul_14117-738152.jpg?semt=ais_hybrid" class="img-thumbnail flex-item move-right" style="height: 410px" alt="...">
    </div>
</asp:Content>


