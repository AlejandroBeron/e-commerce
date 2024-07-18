<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="tp_integrador.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
        <div class="reg ">
            <div class="card border-primary" style="text-align: center; background: lightblue; border-radius: 3%; min-height: 500px; min-width: 400px;">
                <div class="card-header text-center" style="padding: 0 45px; box-sizing: border-box; left: 20px; margin-top: 15px; text-align: center;">
                    <div class="row ">
                        <div class="col-auto">
                            <h1 style="text-align: center; letter-spacing: 2px;">MENSAJE NUEVO</h1>
                        </div>
                        <div class="col-auto ms-auto">
                            <asp:Button runat="server" type="button" class="btn-close" ID="Button1" OnClick="btncerrar_Click" data-bs-dismiss="modal" Style="align-items: flex-end; margin-top: 10px;" aria-label="Cerrar"></asp:Button>
                        </div>
                    </div>
                </div>
                <div class="card-body " style="padding: 0 20px; box-sizing: border-box;margin-left:10px;margin-right:10px; ">
                    <div class="row mb-3 ">
                        <div class="col-1">
                            <label><strong>De:</strong></label>
                        </div>
                        <div class="col-11 " style="text-align: left;">
                            <asp:Label Text="" ID="txtremitente" runat="server" Style="margin-left: 5px; font-size: 20px; font-weight: bold; padding: 0 10px; outline: none; background: lightblue; letter-spacing: 1px; transition: .3s; color: black;" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-1">
                            <label><strong>Para:</strong></label>
                        </div>
                        <div class="col-11" style="text-align: left;">
                            <asp:Label Text="" ID="txtpara" runat="server" Style="margin-left: 5px; font-size: 20px; font-weight: bold; padding: 0 10px; outline: none; background: lightblue; letter-spacing: 1px; transition: .3s; color: black;" />
                            
                            <asp:TextBox runat="server" ID="txtdestino" Style="width: 70%; height: 40px; padding: 0 10px; outline: none; background: lightblue; border: 3px solid darkcyan; letter-spacing: 1px; transition: .3s; color: black;"  />
                        </div>
                        
                    </div>
                    <div class="row mb-3 ">
                        <div class="col-2">
                            <label><strong>Asunto:</strong></label>
                        </div>
                        <div class="col-10 ">

                            <asp:TextBox Style="width: 100%; height: 40px; padding: 0 10px; outline: none; background: lightblue; border: 3px solid darkcyan; letter-spacing: 1px; transition: .3s; color: black;" runat="server" ID="txtasunto" />
                        </div>
                    </div>
                    <div class="row mb-3 ">
                        <div style="position: relative;" class="txt-mensaje">
                            <label><strong>Mensaje: </strong></label>
                        </div>

                        <div class="row mb-3" >
                        
                                <asp:TextBox TextMode="MultiLine" Style="margin-left: 10px; width: 100%; height: 250px; max-height: 250px; padding: 0 10px; background: lightblue; border: 3px solid darkcyan; letter-spacing: 1px; outline: none; transition: .3s; color: black; letter-spacing: 1.5px;" runat="server" ID="txtmensaje" />
                            </div>
                       
                    </div>
                </div>
                <div class="card-footer" style="padding: 0 45px; box-sizing: border-box; left: 20px;">
                    <div class="row mb-3">
                        <asp:Button Style="width: 100%; margin-top: 10px; padding: 10px; outline: none; background: blue; color: #fff; border: none; transition: .1s; cursor: pointer; font-size: 1rem;" Text="Enviar" runat="server" ID="btnaceptar" OnClick="btnaceptar_Click"  OnClientClick="return confirm('Recuerde reunirse en una escribania para realizar cualquier tipo de transacción!');"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>





















