<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="comprobante.aspx.cs" Inherits="EPIC.View.comprobante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reservaciones EPIc | Subir comprobante de pago</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="../styles/styles.css" rel="stylesheet" type="text/css" media="all">
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <script type="text/javascript" src="https://cdn.emailjs.com/sdk/2.3.2/email.min.js"></script>
    <script type="text/javascript">
       (function(){
          emailjs.init("user_1ye0i1bKUum6x3k7qtaE6");
       })();
    </script>
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
            <div class="one_third first encierroCentral">
                <br />
                <label>Solicitud de factura electrónica</label>
                <input type="checkbox" id="factura" onclick="solicitudFactura()"/>
                <br />
            </div>
            <br />
            <br />
            <form id="myform">
<label>ced</label>
<input type="text" name="ced" />
<label>name</label>
<input type="text" name="name" />
<label>tel</label>
<input type="text" name="tel" />
<label>email</label>
<input type="text" name="email" />
<label>dir</label>
<input type="text" name="dir" />
<br><br>
<button>
Send
</button>
</form>
        </div>
      </main>
    </div>
    <script src="../comprobanteFunctions.js"></script>
</body>
</html>
