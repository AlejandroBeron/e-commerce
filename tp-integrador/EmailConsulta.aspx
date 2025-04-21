<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="EmailConsulta.aspx.cs" Inherits="tp_integrador.EmailConsulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
        <div class="reg ">

            <div class="registro" style="background: white; border-radius: 10%; border-color: black;">
                <center>
                    <asp:Label Text="" runat="server" ID="txtmsjerror" Visible="false" Style="color: red; font-weight: bold; font-size: 1000px; margin-top: 300px;" />
                </center>
                <h1 style="text-align: center; padding: 10px 0 10px 0; border-bottom: 2px; color: black;"><strong>¡Te suscribiste con exito!</strong></h1>
                <div method="post" style="padding: 0 45px; box-sizing: border-box; left: 20px;">

                    <div>
                        <img src="https://m.media-amazon.com/images/I/91wgvv8yo5L.jpg" alt="empty cart" style="width: 20%; height: 20%; position: fixed; justify-content: center; margin-left: 50px;">
                    </div>
                    <br />
                    <br />
                    <br />
                     <br />
                    <br />
                    <br />
                     <br />
                    <br />
                    <br />
                    <div class="col" style="display: flex; align-items: center; margin-left: 130px;">
                    <asp:Button Text="Volver al inicio" type="submit" runat="server" class="btn btn-dark"  ID="btnEnviar" OnClick="btnEnviar_Click" ></asp:button>
                        </div>
                    <br />
                    <br />
                </div>
            </div>
            <div class="btn " style="width: 100%; margin-top: 15px; display: flex; justify-content: center; align-items: center;">
            </div>
        </div>
    </div>
</asp:Content>
