<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Arrepentimiento.aspx.cs" Inherits="tp_integrador.Arrepentimiento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form action="https://formsubmit.co/e7c674b30a5e1e5cfd2246a1f59c28c2" method="POST">
        <div class="container" style="margin-top: 50px;">

            <br />
            <center> 
            <h1><strong>Electrotecno 🕹️​</strong></h1>
            </center>
            <br />
            <br />


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
                        <asp:TextBox runat="server" type="text" class="form-control" Style="border-color: black;" ID="apellido" placeholder="Apellido" name="apellido" />
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
                        <asp:TextBox runat="server" type="number" class="form-control" Style="border-color: black;" ID="documento" placeholder="Numero de Documento" name="numero" />
                    </div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                <label for="emailAdress" class="form-label"><strong>Dirección de correo electrónico</strong></label>
                <div class="input-group">
                    <asp:TextBox runat="server" type="email" class="form-control" Style="border-color: black;" ID="email" placeholder="Email" name="Email" />
                </div>
              </div>
            <div class="col-md-6">
                <label for="tel" class="form-label"><strong>Teléfono</strong></label>
                <div class="input-group">
                    <asp:TextBox runat="server" type="telefono" class="form-control" Style="border-color: black;" ID="Tel" placeholder="teléfono" name="Telefono" />
                </div>
            </div>

            <div class="col-md-6">
                <label for="Order" class="form-label"><strong>Orden de compra</strong></label>
                <div class="input-group">
                    <asp:TextBox runat="server" type="text" class="form-control" Style="border-color: black;" ID="Orden" placeholder="Orden de compra" name="orden de compra" />

                </div>
            </div>
              </div>

            <br>
            <div class="mb-3">
            <label for="mensaj" class="form-label"><strong>Mensaje</strong></label>
                <div class="input-group">
            <asp:TextBox ID="TextMensaje" TextMode="MultiLine" runat="server" Style="width: 35%; border-color:black;" name="mensaje" placeholder="Cuentanos que problema tuviste" Rows="4" cols="50" color="black;"></asp:TextBox><br>
                         </div>
                  </div>
            <br>




            <asp:Button runat="server" Text="Enviar" type="submit" value="Order purchase" class="btn btn-dark" ID="Enviar" Style="background-color: black; margin-bottom: 50px;" OnClick="Enviar_Click" OnClientClick="return confirm('¿Estás segura de que quieres confirmar el arrepentimiento de tu pedido?');"></asp:Button>

            <a class="btn btn-dark" href="carrito.aspx" style="margin-bottom: 50px;"><strong>Atrás</strong></a>
            <input type="hidden" name="_next" value="https://localhost:44394/Default.aspx"></input>
            <input type="hidden" name="_captcha" value="false"></input>

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>



        <footer style="background-color: black; padding-top: 20px;">
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
</asp:Content>
