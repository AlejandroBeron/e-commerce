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
                        <asp:TextBox runat="server" type="text" class="form-control" Style="border-color: black;" ID="name" placeholder="Nombre" name="nombre" />
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="lastName" class="form-label"><strong>Apellido</strong></label>
                    <div class="input-group">
                        <asp:TextBox runat="server" type="text" class="form-control" Style="border-color: black;" ID="lastName" placeholder="Apellido" name="apellido" />
                    </div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="typeDocument" class="form-label" style="border-color: black;"><strong>Tipo de documento</strong></label>
                    <div class="input-group">
                        <select class="form-select" style="border-color: black;" id="typeDocument" name="tipodocumento" required>
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
                        <asp:TextBox runat="server" type="number" class="form-control" Style="border-color: black;" ID="documentNumber" placeholder="Numero de Documento" name="numero" />
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <label for="emailAdress" class="form-label"><strong>Dirección de correo electrónico</strong></label>
                <div class="input-group">
                    <asp:TextBox runat="server" type="email" class="form-control" Style="border-color: black;" ID="emailAdress" placeholder="Email" name="Email" />
                </div>
            </div>

            <div class="mb-3">
                <label for="purchaseOrder" class="form-label"><strong>Orden de compra</strong></label>
                <div class="input-group">
                  <asp:TextBox runat="server" type="text" class="form-control" style="border-color: black;" id="purchaseOrder" name="orden de compra" readonly/>
                   
                </div>
            </div>

            <div class="mb-3">
                <label for="txtSummary" class="form-label" style="border-color: black;"><strong>Resumen de compra</strong></label>
                <div class="input-group">
                    <asp:TextBox runat="server" TextMode="MultiLine" class="form-control"  id="txtSummary" cols="30" rows="10" name="Resumen" style="border-color: black; resize: none; margin-bottom: 20px; font-weight: bold; height: 220px; overflow: auto; white-space: pre-wrap; word-wrap: break-word;" readonly>
    
</asp:TextBox>
                </div>
            </div>

            <asp:Button runat="server" Text="Finalizar compra" type="submit" value="Order purchase" class="btn btn-dark" ID="liveAlertBtn" Style="background-color: black; margin-bottom: 50px;" OnClick="liveAlertBtn_Click" OnClientClick="return confirm('¿Estás segura de que quieres confirmar el pedido?');"></asp:Button>

            <a class="btn btn-dark" href="carrito.aspx" style="margin-bottom: 50px;"><strong>Atrás</strong></a>
            <input type="hidden" name="_next" value="https://localhost:44394/Default.aspx"></input>
            <input type="hidden" name="_captcha" value="false"></input>

            <br />
            <br />
            <footer style="background-color: black;">
                <div class="container-fluid text-center">
                    <div class="row">
                        <div class="col-xs-12 col-md-6 col-lg-3">
                            <p style="color: white;" class="h5 mb-3"><strong>Compra en Linea </strong></p>
                            <div class="mb-2">
                                <a class="text-decoration-none" href="carrito.aspx" style="color: white;">Mi Carrito</a>
                            </div>
                            <div class="mb-2">
                                <a class="text-decoration-none" href="#" style="color: white;">Mis Compras</a>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 col-lg-3">
                            <p style="color: white;" class="h5 mb-3"><strong>Acerca de: </strong></p>
                            <div class="mb-2">
                                <a class="text-decoration-none" href="#" style="color: white;">Promociones</a>
                            </div>
                            <div class="mb-2">
                                <a class="text-decoration-none" href="#" style="color: white;">Metodos de Pago</a>
                            </div>
                            <div class="mb-2">
                                <a class="text-decoration-none" href="#" style="color: white;">Consulta Envios</a>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 col-lg-3">
                            <p style="color: white;" class="h5 mb-3"><strong>Ayuda </strong></p>
                            <div class="mb-2">
                                <a class="text-decoration-none" href="#" style="color: white;">Politicas de Privacidad</a>
                            </div>
                            <div class="mb-2">
                                <a class="text-decoration-none" href="Preguntas.aspx" style="color: white;">Preguntas Frecuentes</a>
                            </div>
                            <div class="mb-2">
                                <a class="text-decoration-none" href="#" style="color: white;">Centro de Seguridad</a>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 col-lg-3">
                            <p style="color: white;" class="h5 mb-3"><strong>Atencion Al Cliente  </strong></p>
                            <div class="mb-2">
                                <a class="text-decoration-none" href="#" style="color: white;"><i class="bi bi-whatsapp"></i></a>
                            </div>
                            
                        </div>
                        <div class="col-xs-12">
                            <p style="color: white; padding-top: 20px;" class="text-white text-center"><strong>&copy; 2025 - Alejandro Beron </strong></p>
                        </div>
                    </div>
                </div>

            </footer>
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
