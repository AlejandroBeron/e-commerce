<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Mensaje.aspx.cs" Inherits="tp_integrador.Mensaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
        <div class="reg ">
            <div class="card border-primary" style="text-align: center; background: lightblue; border-radius: 3%; height: 500px; width: 400px;">
                <div class="card-header text-center" style="padding: 0 45px; box-sizing: border-box; left: 20px; margin-top: 15px; text-align: center;">
                    <div class="row g-3">
                        <div class="col-auto">
                            <asp:Label Text="" ID="txtremitente" runat="server" Style="font-size: 20px; font-weight: bold;" />
                        </div>
                        <div class="col-auto ms-auto">
                            <asp:Button runat="server" type="button" class="btn-close" ID="btncerrar" OnClick="btncerrar_Click" data-bs-dismiss="modal" Style="align-items: flex-end; margin-top: 10px;" aria-label="Cerrar"></asp:Button>
                        </div>
                        <div class="row g-2">
                            <asp:Label Text="" ID="txtasunto" runat="server" Style="margin-top: 15px; font-size: 25px; color: darkcyan; font-weight: bold; align-items: flex-start;" />
                        </div>
                    </div>
                </div>
                <div class="card-body text-center" style="padding: 0 45px; box-sizing: border-box; left: 20px;">
                    <asp:Label Text="" TextMode="MultiLine"  ID="txtmensaje"  runat="server" Style="font-size: 15px; width:80%; max-width:90%; font-weight: bold; margin-top: 15px;" />
                </div>
                <div class="card-footer" style="padding: 0 45px; box-sizing: border-box; left: 20px;">

                    <div class="btn " style="width: 100%; margin-top: 15px; margin-bottom: 15px; align-content: end; display: flex; justify-content: center; align-items: center;">
                        <asp:Button Text="Cerrar" class="btn btn-secondary" ID="btncerrar2" OnClick="btncerrar_Click" runat="server" Style="margin-left: 10px; font-weight: bold;" />
                        <asp:Button Text="Responder" class="btn btn-primary" ID="btnresponder" OnClick="btnResponder_Click" runat="server" Style="margin-left: 10px; font-weight: bold;" />
                        <asp:LinkButton ID="btneliminar" runat="server" OnClick="btnEliminarmensaje_Click" UseSubmitBehavior="false" Style="margin-left: 10px;" OnClientClick="return confirm('Esta seguro que desea eliminar ?');">
                            <i class="bi bi-trash-fill text-danger"></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

