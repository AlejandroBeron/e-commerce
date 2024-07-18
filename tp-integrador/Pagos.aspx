<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="tp_integrador.Pagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 style="font-weight: bold; color: darkblue; text-align: center; margin-top: 30px; font-size: 60px;"><u>Nuestros</u> <u>Planes</u></h1>

    <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
        <div class="row" style="margin-top: 100px; margin-left: 30px; margin-right:30px; margin-bottom: 40px;">

            <div class="col-2" style="margin-left:25px;" >
                <div class="card border-primary" style="margin-left:10px; background: lightblue; border-radius: 3%; height: 220px; width: 220px;">
                    <div class="card-header " style="font-size: 20px; color: darkblue; border-block-color: blue;">
                        <center>
                            <h1 style="font-weight: bold; font-size: 19px;">Costo del Plan: $500</h1>
                        </center>
                        <h2 style="font-weight: bold; font-size: 15px; color: black;"></h2>
                    </div>
                    <div class="card-body " style="margin-bottom: 2px; font-size: 15px; color: black; font-weight: bold;">
                        <center>
                            <p style="font-weight: bold;">La Duración de la Publicación será de 5 días. </p>
                        </center>
                        <center>
                            <br />
                            <p style="font-weight: bold; font-size: 20px; color:darkblue;">Plan: Hierro</p>
                        </center>
                    </div>
                </div>
            </div>

            <div class="col-2" style="margin-left:25px;" >
                <div class="card border-primary" style="margin-left:10px; background: lightblue; border-radius: 3%; height: 220px; width: 220px;">

                    <div class="card-header " style="font-size: 20px; color: darkblue; border-block-color: blue;">
                        <center>
                            <h1 style="font-weight: bold; font-size: 19px;">Costo del Plan: $700</h1>
                        </center>
                        <h2 style="font-weight: bold; font-size: 15px; color: black;"></h2>
                    </div>
                    <div class="card-body " style="margin-bottom: 2px; font-size: 15px; color: black; font-weight: bold;">
                        <center> 
                        <p style="font-weight: bold;">La Duración de la Publicación será de 10 días </p>
                        <p style="font-weight: bold; font-size: 20px; color:darkblue;">Plan: Plata</p>
                        </center>
                    </div>
                </div>
            </div>
 
            <div class="col-2" style="margin-left:25px;">
                <div class="card border-primary" style="margin-left:5px; background: lightblue; border-radius: 3%; height: 220px; width: 220px;">
                    <div class="card-header " style="font-size: 20px; color: darkblue; border-block-color: blue;">
                        <center>
                            <h1 style="font-weight: bold; font-size: 18px;">Costo del Plan: $1000</h1>
                        </center>
                        <h2 style="font-weight: bold; font-size: 15px; color: black;"></h2>
                    </div>
                    <div class="card-body " style="margin-bottom: 2px; font-size: 15px; color: black; font-weight: bold;">
                        <center>
                            <p style="font-weight: bold;">La Duración de la Publicación será de 15 días. </p>
                        </center>
                        <center>
                            <p style="font-weight: bold; font-size: 20px; color:darkblue;">Plan: Oro</p>
                        </center>
                    </div>
                </div>
            </div>
 
            <div class="col-2 "style="margin-left:25px;">
                <div class="card border-primary" style="margin-left:5px; background: lightblue; border-radius: 3%; height: 220px; width: 220px;">
                    <div class="card-header " style="font-size: 20px; color: darkblue; border-block-color: blue;">
                        <center>
                            <h1 style="font-weight: bold; font-size: 18px;">Costo de Plan: $1500</h1>
                        </center>
                        <h2 style="font-weight: bold; font-size: 15px; color: black;"></h2>
                    </div>
                    <div class="card-body " style="margin-bottom: 2px; font-size: 15px; color: black; font-weight: bold;">
                        <center>
                            <p style="font-weight: bold;">La Duración de la Publicación será de 30 días. </p>
                        </center>
                        <center>
                            <p style="font-weight: bold; font-size: 20px; color:darkblue;">Plan: Diamante</p>
                        </center>
                    </div>
                </div>
            </div>

            <div class="col-2" style="margin-left:25px;"" >
                <div class="card border-primary" style="background: lightblue; border-radius: 3%; height: 220px; width: 220px;">
                    <div class="card-header " style="font-size: 20px; color: darkblue; border-block-color: blue;">
                        <center>
                            <h1 style="font-weight: bold; font-size: 18px;">Costo de Plan: $3000</h1>
                        </center>
                        <h2 style="font-weight: bold; font-size: 15px; color: black;"></h2>
                    </div>
                    <div class="card-body " style="margin-bottom: 2px; font-size: 14px; color: black; font-weight: bold;">
                        <center>
                            <p style="font-weight: bold;">La Duración de la Publicación será de 30 días y formará Parte de nuestros Inmuebles Destacados. </p>
                        </center>
                        <center>
                            <p style="font-weight: bold; font-size: 20px; color:darkblue;">Plan: Platino</p>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>