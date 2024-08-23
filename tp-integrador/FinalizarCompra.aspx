<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="FinalizarCompra.aspx.cs" Inherits="tp_integrador.FinalizarCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form action="https://formsubmit.co/e7c674b30a5e1e5cfd2246a1f59c28c2" method="POST">
        <div class="container" style="margin-top: 50px;">

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="name" class="form-label"><strong>Nombre</strong></label>
                    <div class="input-group">
                        <input type="text" class="form-control" style="border-color:black;" id="name" placeholder="Nombre" name="nombre" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="lastName" class="form-label"><strong>Apellido</strong></label>
                    <div class="input-group">
                        <input type="text" class="form-control" style="border-color:black;" id="lastName" placeholder="Apellido" name="apellido" required>
                    </div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="typeDocument" class="form-label" style="border-color:black;"><strong>Tipo de documento</strong></label>
                    <div class="input-group">
                        <select class="form-select" style="border-color:black;" id="typeDocument" name="tipodocumento" required>
                            <option value="-1" selected>Seleccionar opción</option>
                            <option value="DNI">Dni</option>
                            <option value="Passport">Pasaporte</option>
                            <option value="identificationCard">Tarjeta de identificación</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="documentNumber" class="form-label"><strong>Numero de documento</strong></label>
                    <div class="input-group">
                        <input type="number" class="form-control" style="border-color:black;" id="documentNumber" placeholder="Numero de Documento" name="numero" required>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <label for="emailAdress" class="form-label"><strong>Dirección de correo electrónico</strong></label>
                <div class="input-group">
                    <input type="email" class="form-control" style="border-color:black;" id="emailAdress" placeholder="Email" name="Email" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="purchaseOrder" class="form-label"><strong>Orden de compra</strong></label>
                <div class="input-group">
                    <input type="text" class="form-control" style="border-color:black;" id="purchaseOrder" name="orden de compra" readonly>
                </div>
            </div>    
            
            <div class="mb-3">
                <label for="txtSummary" class="form-label" style="border-color:black;"><strong>Resumen de compra</strong></label>
                <div class="input-group">
                      <textarea class="form-control" style="border-color:black;" ID="txtSummary" cols="30" rows="10" name="Resumen" style="resize: none; margin-bottom:20px;" readonly>
    <% Response.Write(descriptionTextBlock()); %>
</textarea>   
                </div>
            </div>

            <asp:button runat="server" Text="Finalizar compra" type="submit" value="Order purchase" class="btn btn-dark" id="liveAlertBtn" style="background-color: black; margin-bottom: 50px;" OnClientClick="if (confirm('¿Estás segura de que quieres confirmar el pedido?')) { window.location.href='CompraRealizada.aspx'; return false; } else { return false; }"></asp:button>

            <a class="btn btn-dark" href="carrito.aspx" style="margin-bottom: 50px;"><strong>Atrás</strong></a>
            <input type="hidden" name="_next" value="https://localhost:44394/Default.aspx"></input>
            <input type="hidden" name="_captcha" value="false"></input>

        </div>

        <script>

            function randomValue() {
                var caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                var randomValue = '';
                for (var i = 0; i < 6; i++) {
                    var indiceAleatorio = Math.floor(Math.random() * caracteres.length);
                    randomValue += caracteres.charAt(indiceAleatorio);
                }
                return randomValue;
            }

            var purchaseOrderImput = document.getElementById("purchaseOrder");
            purchaseOrderImput.value = randomValue();
        </script>



</asp:Content>
