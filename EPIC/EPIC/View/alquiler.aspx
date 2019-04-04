<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alquiler.aspx.cs" Inherits="EPIC.alquiler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reservaciones EPIc | Alquiler de espacio</title>
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
            <li class="active"><a class="drop" href="#">Solicitar</a>
              <ul>
                <li><a href="pages/gallery.html">Gallery</a></li>
                <li><a href="pages/full-width.html">Full Width</a></li>
                <li><a href="pages/sidebar-left.html">Sidebar Left</a></li>
                <li><a href="pages/sidebar-right.html">Sidebar Right</a></li>
                <li><a href="pages/basic-grid.html">Basic Grid</a></li>
              </ul>
            </li>
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
            <h1>Alquiler de espacios</h1>
            <hr />
            <p>Fecha de solicitud: </p>
            <form action="#" method="get">
                <label>Nombre del solicitante</label>
                <input type="text" name="nombreSolicitante" required />
                <br/>
                <label>Empresa solicitante</label>
                <input type="text" name="empresaSolicitante" required />
                <br/>
                <label>Cédula jurídica</label>
                <input type="text" name="cedulaSolicitante" required />
                <br/>
                <label>Correo electrónico</label>
                <input type="email" name="correoSolicitante" required />
                <br/>
                <label>Número de teléfono</label>
                <input type="tel" name="telefonoSolicitante" required />
                <br/>
                <hr />
                <br />
                <label>Cantidad de aulas (Capacidad máxima 20 personas). Precio ₡9.850 colones por hora</label>
                <label>Ninguna<input type="radio" id="0aulaCheck" name="aulaChecked" onclick="show1Aula()" /></label>
                <label>1 Aula<input type="radio" id="1aulaCheck" name="aulaChecked" onclick="show1Aula()" /></label>
                <label>2 Aulas<input type="radio" id="2aulaCheck" name="aulaChecked" onclick="show1Aula()" /></label>
                <label>3 Aulas<input type="radio" id="3aulaCheck" name="aulaChecked" onclick="show1Aula()" /></label>
                <br />
                <div id="1aula" style="display: none">
                    Cantidad de personas en el aula 1
                    <input type="number" id="personas1Aula1" />
                </div>
                <br />
                <div id="2aula" style="display: none">
                    Cantidad de personas en el aula 1
                    <input type="number" id="personas2Aula1" />
                    Cantidad de personas en el aula 2
                    <input type="number" id="personas2Aula2" />
                </div>
                <br/>
                <div id="3aula" style="display: none">
                    Cantidad de personas en el aula 1
                    <input type="number" id="personas3Aula1" />
                    Cantidad de personas en el aula 2
                    <input type="number" id="personas3Aula2" />
                    Cantidad de personas en el aula 3
                    <input type="number" id="personas3Aula3" />
                </div>
                <br/>
                <label>Cantidad de laboratorios (Capacidad máxima 20 personas). Precio ₡25.000 colones por hora</label>
                <select name="cantidadLabs">
                    <option value="" selected="selected">Seleccione</option>
                    <option value="una">Uno</option>
                    <option value="dos">Dos</option>
                </select>
                <br />
            </form>
        </div>
      </main>
    </div>
    <script src="Functions.js"></script>
</body>
</html>
