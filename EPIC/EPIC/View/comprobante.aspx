﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="comprobante.aspx.cs" Inherits="EPIC.View.comprobante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reservaciones EPIc | Subir comprobante de pago</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="../styles/styles.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
    <div class="wrapper row0">
      <div id="topbar" class="hoc clear"> 
        <!-- ################################################################################################ -->
        <div class="fl_left">
          <ul>
            <li><i class="fa fa-phone"></i> +00 (123) 456 7890</li>
            <li><i class="fa fa-envelope-o"></i> info@domain.com</li>
          </ul>
        </div>
        <div class="fl_right">
          <ul>
            <li><a href="#"><i class="fa fa-lg fa-home"></i></a></li>
            <li><a href="#">Login</a></li>
            <li><a href="#">Register</a></li>
          </ul>
        </div>
        <!-- ################################################################################################ -->
      </div>
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="wrapper row1">
      <header id="header" class="hoc clear"> 
        <!-- ################################################################################################ -->
        <div id="logo" class="fl_left">
          <h1><a href="index.aspx">Reservaciones EPIC</a></h1>
        </div>
        <nav id="mainav" class="fl_right">
          <ul class="clear">
            <li><a href="index.aspx">Home</a></li>
            <li><a class="drop" href="#">Solicitar</a>
              <ul>
                <li><a href="alquiler.aspx">Alquiler de espacio</a></li>
                <li><a href="">Préstamo de espacio</a></li>
              </ul>
            </li>
            <li class="active"><a href="comprobante.aspx">Subir comprobante</a></li>
            <li><a class="drop" href="#">Dropdown</a>
              <ul>
                <li><a href="#">Level 2</a></li>
                <li><a class="drop" href="#">Level 2 + Drop</a>
                  <ul>
                    <li><a href="#">Level 3</a></li>
                    <li><a href="#">Level 3</a></li>
                    <li><a href="#">Level 3</a></li>
                  </ul>
                </li>
                <li><a href="#">Level 2</a></li>
              </ul>
            </li>
            <li><a href="#">Link Text</a></li>
          </ul>
        </nav>
        <!-- ################################################################################################ -->
      </header>
    </div>
    <div class="wrapper row2">
      <div id="breadcrumb" class="hoc clear"> 
      </div>
    </div>
    <div class="wrapper row3">
      <main class="hoc container clear"> 
        <!-- main body -->
        <!-- ################################################################################################ -->
        <div class="content">
            <h1>Subir comprobante de pago</h1>
            <hr />
            <label>Ingrese el número de reservación</label>
            <input type="text" id="codigo" required />
            <br />
            <input type="button" value="Verificar" />
            <br />
            <hr />
            <br />
            <input type="file" id="fileUploader" accept="image/" onchange="showImage()" />
            <br />
            <img id="image" />
            <br />
            <br />
            <input type="checkbox" id="factura" onclick="solicitudFactura()"/>Solicitud de factura electrónica
            <br />
            <br />

            <form action="#" method="get">
                <div class="one_half first" id="cedulaFactura" style="display: none" >
                    <label>Cédula</label>
                    <input class="entradas" type="text" name="cedulaFactura" required />
                    <br />
                </div>
                <div class="one_half" id="nombreFactura" style="display: none">
                    <label>Nombre completo</label>
                    <input class="entradas" type="text" name="nombreFactura"required />
                    <br />
                </div>
                <div class="one_half first" id="telefonoFactura" style="display: none" >
                    <label>Teléfono</label>
                    <input class="entradas" type="text" name="telefonoFactura"required />
                    <br />
                </div>
                <div class="one_half" id="correoFactura" style="display: none" >
                    <label>Correo electrónico</label>
                    <input class="entradas" type="email" name="correoFactura" required />
                    <br />
                </div>
                <div class="one_half first" id="direccionFactura" style="display: none" >
                    <label>Dirección</label>
                    <input class="entradas" type="tel" name="direccionFactura" required />
                    <br />
                </div>
            </form>
            <div class="one_half first">
                <input type="button" value="Enviar comprobante" />
            </div>
        </div>
      </main>
    </div>
    <script src="../comprobanteFunctions.js"></script>
    <script type="text/javascript" src="https://cdn.emailjs.com/sdk/2.3.2/email.min.js"></script>
</body>
</html>