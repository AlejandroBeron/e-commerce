<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="ConfirmarUsuario.aspx.cs" Inherits="tp_integrador.ConfirmarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="font-weight: bold; color: darkblue; text-align: center; margin-top: 30px; font-size: 60px;"><u>Usuarios</u> <u>a</u> <u>Confirmar:</u></h1>
    <div class="row" style="margin-top: 100px; margin-left: 25px; margin-right: 25px; margin-bottom: 40px;">

        <asp:Repeater ID="confirmarUsuarios" runat="server">
            <ItemTemplate>
                <div class="col-12 col-md-6 col-lg-4 mb-2">
                    <div class="card border-primary" style="background: lightblue; border-radius: 3%; height: 400px; width: 350px;">

                        <div class="card-header " style="font-size: 15px; color: darkblue; border-block-color: blue;">
                            <center>
                                <h1 style="font-weight: bold; font-size: 20px;">Nombre y Apellido:</h1>
                            </center>
                            <h2 style="font-weight: bold; font-size: 20px; color: black;"><%# Eval("Nombre") %> <%# Eval("Apellido") %></h2>
                        </div>
                        <div class="card-body " style="margin-bottom: 2px; font-size: 15px; color: black; font-weight: bold;">
                            <p style="font-weight: bold;">Email: <%# Eval("Email") %> </p>
                            <p style="font-weight: bold;">Dni: <%# Eval("DNI") %> </p>
                            <p style="font-weight: bold;">Telefono: <%# Eval("Telefono") %></p>
                            <p style="font-weight: bold;">Domicilio: <%# Eval("Domicilio") %></p>
                            <p style="font-weight: bold;">Fecha de Nacimiento: <%# Eval("FechaNacimiento") %></p>
                        </div>
                        <div class="card-footer" style="border-block-color: blue; align-content: center; text-align: center; height: 60px; margin-top: 5px;">
                            <asp:LinkButton ID="btnconfirmarUsuario" runat="server" CssClass="btn btn-outline-success" OnClick="btnconfirmarUsuario_Click" CommandArgument='<%# Eval("Email") %>' UseSubmitBehavior="false" OnClientClick="return confirm('Desea Confirmar al Usuario?');">
                            Confirmar <i class="bi bi-person-check-fill"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btneliminarUsuario" runat="server" CssClass="btn btn-outline-danger" OnClick="btnRechazarUsuario_Click" CommandArgument='<%# Eval("Email") %>' UseSubmitBehavior="false" OnClientClick="return confirm('Desea Rechazar al Usuario?');">
                            Rechazar <i class="bi bi-person-fill-slash"></i>
                            </asp:LinkButton>

                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
