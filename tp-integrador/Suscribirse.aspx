<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Suscribirse.aspx.cs" Inherits="tp_integrador.Suscribirse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image: url('https://acdn.mitiendanube.com/stores/236/748/products/d_nq_np_2x_757458-mla53486418774_012023-f-6068ec5c9c183cc29917188133450512-1024-1024.png'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover; height: 20em; display: flex; flex-direction: column; justify-content: center">

        <h2 style="font-size: 3em; text-align: center; padding: 20px; background: rgba(0,0,0,0.5); color: aliceblue;"><strong>Contacto</strong></h2>
    </div>

    <section class="contacto" id="Contacto">
        <br />
        <br />
        <center>
            <h1><strong>¡Contactanos!</strong></h1>
            <br />
            <br />
            <h3><strong>Dejanos tu consulta que nos contactaremos a la brevedad.</strong></h3>
            <br />
            <br />
            <div class="card border-dark" style="border-color: black; border-width: 4px; margin-left: 10px; height: 650px; width: 900px">
                <br />
                <br />
                <div id="formulario">
                    <form action="https://formsubmit.co/ale.frecuenci@gmail.com" method="POST">

                        <label class="labe" for="nombre" style="font-size: 20px;"><strong>Nombre:</strong></label><br>
                        <br>
                        <asp:TextBox ID="txtNombre" runat="server" Style="width: 30%; height: 30px;" required="required"></asp:TextBox><br>
                        <br>
                        <label class="labe" for="email" style="font-size: 20px;"><strong>Email:</strong></label><br>
                        <br>
                        <asp:TextBox ID="TextEmail" runat="server" Style="width: 30%; height: 30px;" required="required"></asp:TextBox><br>
                        <br>
                        <label class="labe" for="asunto" style="font-size: 20px;"><strong>Asunto:</strong></label><br>
                        <br>
                        <asp:TextBox ID="TextAsunto" runat="server" Style="width: 30%; height: 30px;" required="required"></asp:TextBox><br>
                        <br>
                        <label class="labe" for="mensaje" style="font-size: 20px;"><strong>Mensaje:</strong></label><br>
                        <br>
                        <asp:TextBox ID="TextMensaje" textmode="MultiLine" runat="server" Style="width: 30%;" name="mensaje" rows="4" cols="50" color="black;" required="required"></asp:TextBox><br>
                        <br>
                        <br>
                        <asp:Button Text="Enviar"  type="submit" runat="server" class="btn btn-dark" ID="btnEnviar" OnClick="btnEnviar_Click"></asp:button>
                          
                    </form>
                </div>
            </div>
            <br />
            <br />
            <footer style="background-color: black">
                <hr />
                <div class="text-center">
                    <div class="Redes_sociales" style="color: antiquewhite; font-size: 20px;">
                        <h5><strong>¡Seguinos en Nuestras Redes!</strong></h5>


                        <div class="mx-auto d-flex">

                            <p style="font-size: 160%; color: white; margin-left: 43%; margin-right: 5px;"><i class="bi bi-instagram" style="color: whitesmoke"></i></p>
                            <p style="font-size: 160%; color: white; margin-left: 20px; margin-right: 5px;"><i class="bi bi-facebook" style="color: whitesmoke"></i></p>
                            <p style="font-size: 160%; color: white; margin-left: 20px; margin-right: 5px;"><i class="bi bi-twitter" style="color: whitesmoke"></i></p>
                            <p style="font-size: 160%; color: white; margin-left: 20px; margin-right: 5px;"><i class="bi bi-youtube" style="color: whitesmoke"></i></p>

                        </div>

                    </div>
                </div>
                <br />
                <div class="text-center">
                    <div class="autores" style="color: antiquewhite">
                        <p><strong>Autores: Macarena Casas - Alejandro Beron © 2025 </strong></p>
                        <br />
                    </div>
                </div>
            </footer>

        </center>
    </section>




</asp:Content>
