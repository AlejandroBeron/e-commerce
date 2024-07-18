<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="RecuperarPass.aspx.cs" Inherits="tp_integrador.RecuperarPass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
     <div class="reg ">

         <div class="reCU" style="background: lightblue; border-radius: 3%;">

             <h1 style="text-align: center; padding: 10px 0 10px 0; border-bottom: 2px double grey;">Recuperar contraseña</h1>
             <div method="post" style="padding: 0 45px; box-sizing: border-box; left: 20px;">
                 <div class="username" style="top: 50%; color: black; left: 5px; color: black; font-size: 20px;">

                     <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="txtEmail" />
                     <label>Usuario</label>
                 </div>

                 <div class="DNI" style="margin-top: 5%; left: 5px; color: black; font-size: 20px;">

                    <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" type="password" CssClass="form-control1" ID="txtDNI" />
                     <label for="inputPassword4" class="form-label">DNI</label>

                    
                 </div>
               </div>
             <div   style="width: 100%; margin-top: 15px; display: flex; justify-content: center; align-items: center;">   
                 
                 
                 <asp:Button ID="btnRecuperar" runat="server" Text="Recuperar" OnClick="btnRecuperar_Click" Style="padding: 7px 10px; background-color: #5488a3; color: #fff; border-radius: 25px; cursor: pointer; transition: all 300ms ease;" /> 
                 </div>   
             <center>
             <div>
                 <asp:Label ID="lblMensaje" runat="server" Text="" CssClass="mensaje" style="text-align:center;text-shadow:inherit" />
             </div>
             <div class="log" style="margin: 30px 0; text-align: center; font-size: 16px; color: black;">
             ¿Recordaste tu contraseña? <a href="Login.aspx">Iniciar sesion</a>
             </div>
             </center>
             <div class="btn " style="width: 100%; margin-top: 15px; display: flex; justify-content: center; align-items: center;">
                 <asp:Button ID="cerrarbtn" Text="Cerrar" runat="server" OnClick="cerrarbtn_Click" formnovalidate="true" Style="padding: 7px 10px; background-color: #5488a3; color: #fff; border-radius: 25px; cursor: pointer; transition: all 300ms ease;" />
             </div>
         </div>
     </div>
         </div>

</asp:Content>
