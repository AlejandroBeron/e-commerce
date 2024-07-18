<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Mensajeria.aspx.cs" Inherits="tp_integrador.Mensajeria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="nav nav-tabs" style="border-color: aqua">
        <li class="nav-item" style="font-size: 20px;">
            <a class="nav-link active" aria-current="page" href="#" style="color: black; border-color: aqua;"><strong>Principal</strong></a>
        </li>
        <li class="nav-item dropdown" style="font-size: 20px;">
            <a class="nav-link dropdown-toggle " data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black; border-color: aqua;"><strong>Mensajes</strong></a>
            <ul class="dropdown-menu  ">
                <asp:Button class="dropdown-item btn-outline-info" Text="Bandeja de Salida" runat="server" ID="btnenviados" OnClick="btnenviados_Click" Style="padding: 7px 10px; color: black; background-color: aquamarine; font-weight: bold; text-align: center; border: 2px solid darkcyan; cursor: pointer; transition: all 300ms ease;" />
                <asp:Button class="dropdown-item btn-outline-info" Text="Bandeja de Entrada" runat="server" ID="btnrecibidos" OnClick="btnrecibidos_Click" Style="padding: 7px 10px; color: black; background-color: aquamarine; font-weight: bold; text-align: center; border: 2px solid darkcyan; cursor: pointer;" />
                <asp:Button class="dropdown-item btn-outline-info" Text="Todos" runat="server" ID="btntodos" OnClick="btntodos_Click" Style="padding: 7px 10px; color: black; background-color: aquamarine; font-weight: bold; text-align: center; border: 2px solid darkcyan; cursor: pointer;" />
                <asp:Button class="dropdown-item btn-outline-info" Text="Papelera" runat="server" ID="btnPapelera" OnClick="btnPapelera_Click" Style="padding: 7px 10px; color: black; background-color: aquamarine; font-weight: bold; text-align: center; border: 2px solid darkcyan; cursor: pointer;" />
                <asp:Button class="dropdown-item btn-outline-info" Text="Nuevo Mensaje" runat="server" ID="btnnuevo" OnClick="btnnuevo_Click" Style="padding: 7px 10px; color: black; background-color: aquamarine; font-weight: bold; text-align: center; border: 2px solid darkcyan; cursor: pointer;" />

            </ul>
        </li>

        <asp:Button class="btn btn" Text="No Leídos" runat="server" ID="btnnoleidos" OnClick="btnnoleidos_Click" Style="color: black; border: 2px solid aqua; font-weight: bold; text-align: center; cursor: pointer;" />

    </ul>
    <br />
    <br />
    <div class="row g-3">
        <div class="col-6 text-center ">
            <p class="card-text" style="font-size: 15px; color: black; font-weight: bold;">Asunto:</p>
        </div>
        <div class="col-2 text-center">
            <p class="card-text" style="font-size: 15px; color: black; font-weight: bold;">Remitente:</p>
        </div>
        <div class="col-3 text-center ">
            <p class="card-text" style="font-size: 15px; color: black; font-weight: bold;">Fecha:</p>
        </div>
        <div class="col-1 text-start">
            <p class="card-text" style="font-size: 15px; color: black; font-weight: bold;">Detalles:</p>
        </div>

    </div>
    <% foreach (Dominio.Email email in listaemail)
        { %>
    <div class="container-fluid " style="height: 50px; width: 98%; margin-left: 10px; margin-right: 10px; margin-top: 2px; border: 2px solid darkcyan; padding: 5px; align-content: center;">
        <div class="row g-3">
            <div class="col-6 " <%if (email.Visto == true && usuario.nombre_u == email.destino)
                { %>
                style="background-color: paleturquoise;"
                <%} %>>
                <p class="card-text" style="font-size: 20px; color: darkcyan; font-weight: bold; align-items: flex-start; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%:email.asunto%></p>

            </div>
            <div class="col-3 text-start" <%if (email.Visto == true && usuario.nombre_u == email.destino)
                { %>
                style="background-color: paleturquoise;"
                <%} %>>
                <p class="card-text" style="font-size: 15px; color: black; font-weight: bold; align-items: flex-start; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%:email.remitente%></p>
            </div>
            <div class="col-2 text-start" <%if (email.Visto == true && usuario.nombre_u == email.destino)
                { %>
                style="background-color: paleturquoise;"
                <%} %>>
                <p class="card-text" style="font-size: 15px; color: black; font-weight: bold; align-items: flex-start; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                    <%:email.Fecha%>
                </p>
            </div>
            <div class="col-1 d-flex justify-content-end align-items-center" <%if (email.Visto == true && usuario.nombre_u == email.destino)
                { %>
                style="background-color: paleturquoise;"
                <%} %>>

                <a href="<%:ResolveUrl("~/Mensaje.aspx?id=" + email.Id) %>" class="btn btn-outline-info" style="border-radius: 20px; color: black; align-items: center; height: 40px; font-size: 20px; font-weight: bold; border-color: darkturquoise;" title="Abrir"><i class="bi bi-arrow-right-circle"></i></a>


            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
