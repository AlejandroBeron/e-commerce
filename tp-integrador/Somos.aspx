<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Somos.aspx.cs" Inherits="tp_integrador.Somos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .move-left {
            position: relative;
            animation: move-left 1.5s;
        }

        .move-right {
            position: relative;
            animation: move-right 1.5s;
        }

        @keyframes move-left {
            0% { left: -800px;}
            50% { left: 0px; }
            100% { left: 0;}

        }

        @keyframes move-right {
            0% {right: -800px;}
            50% {right: 0px;}
            100% {right: 0; }
        }

        .flex-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 430px;
            cursor: crosshair;
            opacity: 1;
            filter: contrast(120%);
        }

        .flex-item {
            flex-grow: 1;
            object-fit: cover;
            opacity: 0.8;
            transition: 0.5s ease;
        }
        .icon-move { transition: transform 0.5s; }

        .icon-move:hover { transform: translateY(-10px); } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br />
    <div style="text-align: center;">
        <div  class="icon-move" style="font-size: 60px; margin-left:25px; margin-bottom: -30px;"
        <h1><strong>¿Quiénes somos?</strong></h1>
    </div>
    <br /><br />

    <div class="flex-container">
        <div class="flex-item move-left">
            <p><strong>En Electrotecno, somos apasionados por la tecnología y estamos comprometidos a ofrecerte lo mejor en productos tecnológicos. Nuestro objetivo es brindarte una experiencia de compra única, donde la innovación y la calidad se encuentran al alcance de tu mano.
            Nuestra misión es democratizar el acceso a la tecnología de vanguardia, proporcionando productos de alta calidad a precios competitivos. Creemos que la tecnología debe ser accesible para todos, y trabajamos incansablemente para hacer realidad esta visión.</strong></p>
            <br>
            <p><strong>Nuestra misión: es democratizar el acceso a la tecnología de vanguardia, proporcionando productos de alta calidad a precios competitivos. Creemos que la tecnología debe ser accesible para todos, y trabajamos incansablemente para hacer realidad esta visión.</strong></p>
            <br />
            <p><strong>Nuestro compromiso: nos comprometemos a ofrecerte una experiencia de compra segura y confiable. Desde la selección de productos hasta la entrega en tu puerta, cada detalle es importante para nosotros. Queremos que te sientas seguro y satisfecho con cada compra que realices en nuestra tienda.</strong></p>
        </div>
        <img src="https://img.freepik.com/fotos-premium/variedad-dispositivos-tecnologicos-modernos-dispuestos-sobre-fondo-azul_14117-738152.jpg?semt=ais_hybrid" class="img-thumbnail flex-item move-right" style="height: 410px" alt="...">
    </div>
        <br />
        <div  class="icon-move" style="font-size: 60px; margin-left:25px; margin-bottom: -30px;"

        <h1><strong>Donde estamos ubicados</strong>👇​</h1>
       </div>
        <br /> <br />
         <div class="card border-dark" style="border-color: black; border-width: 4px; margin-left: 10px; height: 810px; width: 1380px">
        <section class="elementor-section elementor-top-section elementor-element elementor-element-f9b25f9 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="f9b25f9" data-element_type="section">
						<div class="elementor-container elementor-column-gap-default">
					<div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-354678b" data-id="354678b" data-element_type="column">
			<div class="elementor-widget-wrap elementor-element-populated">
						<div class="elementor-element elementor-element-e5e368a elementor-widget elementor-widget-bwp_google_maps" data-id="e5e368a" data-element_type="widget" data-widget_type="bwp_google_maps.default">
				<div class="elementor-widget-container">
					<div class="elementor-custom-embed"><iframe src="https://maps.google.com/maps?q=Carrefour%20Market&amp;t=m&amp;z=12&amp;output=embed&amp;iwloc=near" aria-label="Ubicacion" width="1350" height="800" frameborder="0" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div>				</div>
				</div>
					</div>
		</div>
					</div>
		</section>
             </div>
        <br /><br />
            <footer style="background-color: black">
        <hr />
        <div class="text-center">
            <div class="Redes_sociales" style="color: antiquewhite">
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

</asp:Content>


