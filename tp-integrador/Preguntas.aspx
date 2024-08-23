<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Preguntas.aspx.cs" Inherits="tp_integrador.Preguntas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="row" style="margin-top: 5%; margin-bottom: 2%; justify-content: center;">

        <h1 scope="col" style="color: black; width: 600%; text-align: center;"><strong>Preguntas Frecuentes</strong></h1>
    </div>

    <div class="accordion accordion-flush" id="accordionpregfrecuentes" style="margin-left: 10%; margin-right: 10%; margin-bottom: 2%;">
        <div class="accordion-item">
            <h2 class="accordion-header" style="color: black;">
                <button class="accordion-button collapsed" type="button" style="color: black; font-size: 25px" data-bs-toggle="collapse" data-bs-target="#flush-uno" aria-expanded="false" aria-controls="flush-uno">
                    <strong>¿Como comprar? </strong>
                </button>
            </h2>
            <div id="flush-uno" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <strong>¡Por whatsapp!</strong> Por el momento podes contactarte con nosotros a travez de whatsapp con el botón realizar consulta!.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" style="color: black; font-size: 25px" data-bs-toggle="collapse" data-bs-target="#flush-dos" aria-expanded="false" aria-controls="flush-dos">
                    <strong>Cupones y Descuentos </strong>

                </button>
            </h2>
            <div id="flush-dos" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <strong>¡Lo Sentimos!</strong>Momentaneamente esta área se encuentra fuera de servicio. Estamos trabajando para brindarle un mejor servicio, disculpe las molestias!.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" style="color: darkgreen;">
                <button class="accordion-button collapsed" type="button" style="color: black; font-size: 25px" data-bs-toggle="collapse" data-bs-target="#flush-tres" aria-expanded="false" aria-controls="flush-tres">
                    <strong>Informacion Sobre Productos </strong>
                </button>
            </h2>
            <div id="flush-tres" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <strong>¡Lo Sentimos!</strong>Momentaneamente esta área se encuentra fuera de servicio. Estamos trabajando para brindarle un mejor servicio, disculpe las molestias!.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" style="color: black; font-size: 25px" data-bs-toggle="collapse" data-bs-target="#flush-cuatro" aria-expanded="false" aria-controls="flush-cuatro">
                    <strong>Cambiar Domicilio de Entrega</strong>

                </button>
            </h2>
            <div id="flush-cuatro" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <strong>¡Lo Sentimos!</strong>Momentaneamente esta área se encuentra fuera de servicio. Estamos trabajando para brindarle un mejor servicio, disculpe las molestias!.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" style="color: black; font-size: 25px" data-bs-toggle="collapse" data-bs-target="#flush-cinco" aria-expanded="false" aria-controls="flush-cinco">
                    <strong>¿Como modificar un pedido? </strong>

                </button>
            </h2>
            <div id="flush-cinco" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <strong>¡Lo Sentimos!</strong>Momentaneamente esta área se encuentra fuera de servicio. Estamos trabajando para brindarle un mejor servicio, disculpe las molestias!.
                </div>
            </div>

        </div>
         <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" style="color:black; font-size: 25px" data-bs-toggle="collapse" data-bs-target="#flush-seis" aria-expanded="false" aria-controls="flush-seis">
                    <strong>Documentación para retirar mi pedido </strong>

                </button>
            </h2>
            <div id="flush-seis" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <strong>¡Lo Sentimos!</strong>Momentaneamente esta área se encuentra fuera de servicio. Estamos trabajando para brindarle un mejor servicio, disculpe las molestias!.
                </div>
            </div>

        </div>
    </div>
      <div class="btn-btn-dark" style="display: flex; justify-content: center; padding-bottom: 40px;">
        <a href="<%: ResolveUrl("~/Default.aspx") %>" class="btn btn-dark" style="font-weight: bold; border-color: antiquewhite; color: antiquewhite; background-color: black;"><strong>Regresar</strong></a>
    </div>


</asp:Content>

