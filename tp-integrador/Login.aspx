<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="tp_integrador.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
        <div class="reg ">

            <div class="registro" style="background: black; border-radius: 10%; border-color:antiquewhite;">
                <center>
                    <asp:Label Text="" runat="server" ID="txtmsjerror" Visible="false" Style="color: red; font-weight: bold; font-size: 20px; margin-top: 15px;" />
                </center>
                <h1 style="text-align: center; padding: 10px 0 10px 0; border-bottom: 2px; color:antiquewhite;">Inicio de sesion</h1>
                <div method="post" style="padding: 0 45px; box-sizing: border-box; left: 20px;">
                    <div class="username" style="top: 50%; color: black; left: 5px; color: white; font-size: 20px;">

                        <asp:TextBox Style="border: hidden; background-color: white; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="txtEmail" />
                        <label>Usuario</label>
                    </div>

                    <div class="contraseña" style="margin-top: 5%; left: 5px; color: white; font-size: 20px;">

                        <asp:TextBox Style="border: hidden; background-color:white; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" type="password" CssClass="form-control1" ID="txtPass" />
                        <label for="inputPassword4" class="form-label">Contraseña</label>


                    </div>
                    <div class="requisitos">
                        <p style="font-size: 15px; color:white;">*Mas de 6 caracteres</p>
                        <p style="font-size: 15px; color:white;">*Minimo 1 Mayúscula</p>
                        <p style="font-size: 15px; color:white;">*Minimo 1 Número</p>
                    </div>

                    <asp:Button Text="Iniciar" ID="btnIniciar" runat="server" OnClick="btnIniciar_Click" Style="width: 100%; height: 50px; margin-top: 10px; border: 2px solid; background-color: white; border-radius: 25px; font-size: 18px; color: black; cursor: pointer; outline: none;" />
                    <div class="registrarse" style="margin: 30px 0; text-align: center; font-size: 16px; color: white;">
                        ¿Olvidaste tu contraseña? <a href="RecuperarPass.aspx">recuperala</a>
                    </div>
                    <div class="registrarse" style="margin: 30px 0; text-align: center; font-size: 16px; color: white;">
                        ¿No tienes una cuenta? <a href="Registro.aspx">Registrarse</a>
                    </div>
                    <br />
                </div>
            </div>
            <div class="btn " style="width: 100%; margin-top: 15px; display: flex; justify-content: center; align-items: center;">
                <asp:Button ID="cerrarbtn" Text="Cerrar" runat="server" OnClick="cerrarbtn_Click" formnovalidate="true" Style="padding: 7px 10px; background-color: #5488a3; color: #fff; border-radius: 25px; cursor: pointer; transition: all 300ms ease;" />
            </div>
        </div>
    </div>
</asp:Content>
