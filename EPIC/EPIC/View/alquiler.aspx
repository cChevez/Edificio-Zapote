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
                <li><a href="alquiler.aspx">Alquiler de espacio</a></li>
                <li><a href="">Préstamo de espacio</a></li>
              </ul>
            </li>
            <li><a href="comprobante.aspx">Subir comprobante</a></li>
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
            <h1>Alquiler de espacios</h1>
            <hr />
            <br />
            <label class="titulo">Datos del solicitante</label>
            <br />
            <div>
                <label>Fecha de solicitud</label>
                <input class="fecha" type="date" id="fechaActual" value="" readonly/>
            </div>
            <br />
            <form action="#" method="get">
                <div class="one_half first">
                    <label>Nombre del solicitante</label>
                    <input type="text" name="nombreSolicitante" required />
                    <br />
                </div>
                <div class="one_half">
                    <label>Empresa solicitante</label>
                    <input type="text" name="empresaSolicitante" required />
                    <br />
                </div>
                <div class="one_half first">
                    <label>Cédula jurídica</label>
                    <input type="text" name="cedulaSolicitante" required />
                    <br />
                </div>
                <div class="one_half">
                    <label>Correo electrónico</label>
                    <input type="email" name="correoSolicitante" required />
                    <br />
                </div>
                <div class="one_half first">
                    <label>Número de teléfono</label>
                    <input type="tel" name="telefonoSolicitante" required />
                    <br />
                </div>
                <hr />
                <br />
                <label class="titulo">Datos del espacio a reservar</label>
                <br />
                <label>Cantidad de aulas (Capacidad máxima 25 personas). Precio ₡9.850 colones por hora</label>
                <div class="one_quarter first">
                    <label>Ninguna
                        <input type="radio" id="0aulaCheck" name="aulaChecked" checked onclick="showAula()" />
                    </label>
                </div>
                <div class="one_quarter">
                    <label>1 Aula
                        <input type="radio" id="1aulaCheck" name="aulaChecked" onclick="showAula()" />
                    </label>
                </div>
                <div class="one_quarter">
                    <label>2 Aulas
                        <input type="radio" id="2aulaCheck" name="aulaChecked" onclick="showAula()" />
                    </label>
                </div>
                <div class="one_quarter">
                    <label>3 Aulas
                        <input type="radio" id="3aulaCheck" name="aulaChecked" onclick="showAula()" />
                    </label>
                </div>
                <div class="one_quarter first">
                    <br />
                </div>
                <div class="one_quarter" id="1aula" style="display: none">
                    <br />
                    Cantidad de personas en el aula 1
                    <input  type="number" id="personas1Aula1" min="0" max="25" />
                </div>
                <div class="one_quarter" id="2aula" style="display: none">
                    <br />
                    Cantidad de personas en el aula 2
                    <input type="number" id="personas2Aula1" min="0" max="25" />
                    Cantidad de personas en el aula 2
                    <input type="number" id="personas2Aula2" min="0" max="25" />
                </div>
                <div class="one_quarter" id="3aula" style="display: none">
                    <br />
                    Cantidad de personas en el aula 3
                    <input type="number" id="personas3Aula1" min="0" max="25" />
                    Cantidad de personas en el aula 2
                    <input type="number" id="personas3Aula2" min="0" max="25" />
                    Cantidad de personas en el aula 3
                    <input type="number" id="personas3Aula3" min="0" max="25" />
                    <br />
                </div>
                <br />
                <br />
                <br/>
                <br />
                <br />
                <br/>
                <br />
                <br />
                <br/>
                <br />
                <br />
                <br/>
                <br />
                <br />
                <div>
                    <label>Cantidad de laboratorios. Precio ₡25.000 colones por hora</label>
                    <div class="one_quarter first">
                        <label>Ninguno
                            <input type="radio" id="0labCheck" name="labChecked" checked onclick="showLab()" />
                        </label>
                    </div>
                    <div class="one_quarter">
                        <label>Laboratorio B1 (18 personas)
                            <input type="radio" id="B1labCheck" name="labChecked" onclick="showLab()" />
                        </label>
                    </div>
                    <div class="one_quarter">
                        <label>Laboratorio B2 (20 personas)
                            <input type="radio" id="B2labCheck" name="labChecked" onclick="showLab()" />
                        </label>
                    </div>
                    <div class="one_quarter">
                        <label>2 Laboratorios
                            <input type="radio" id="2labCheck" name="labChecked" onclick="showLab()" />
                        </label>
                    </div>
                </div>
                <br />
                <div>
                    <div class="one_quarter first">
                        <br />
                    </div>
                    <div class="one_quarter" id="B1lab" style="display: none">
                        <br />
                        Cantidad de personas en el laboratorio B1
                        <input type="number" id="personas1LabB1" min="0" max="18" />
                    </div>
                    <div class="one_quarter" id="B2lab" style="display: none">
                        <br />
                        Cantidad de personas en el laboratorio B2
                        <input type="number" id="personas1LabB2" min="0" max="20" />
                    </div>
                    <div class="one_quarter" id="2lab" style="display: none">
                        <br />
                        Cantidad de personas en el laboratorio B1
                        <input type="number" id="personas2Lab1" min="0" max="18" />
                        Cantidad de personas en el laboratorio B2
                        <input type="number" id="personas2Lab2" min="0" max="20" />
                        <br />
                    </div>
                </div>
                <br/>
                <br />
                <br />
                <br/>
                <br />
                <br />
                <hr />
                <br />
                <label class="titulo">Datos de la actividad</label>
                <br />
                <label>Nombre de la actividad</label>
                <input type="text" name="nombreActividadSolicitante" required />
                <br />
                <div class="one_quarter first">
                    <label>Fecha de inicio:</label>
                </div>
                <div class="one_quarter">
                    <input class="fecha" type="date" name="fechaInicio" required />
                </div>
                <div class="one_quarter">
                    <label>Fecha de finalización:</label>
                </div>
                <div class="one_quarter">
                    <input  class="fecha" type="date" name="fechaFinal" required />
                </div>
                <br />
                <br />
                <br />
                <label class="titulo">Añada los horarios según sea necesario</label>
                <br />
                <div class="one_quarter first">
                    <label>Día</label>
                    <input class="fecha" type="date" name="dia" required />
                </div>
                <div class="one_quarter">
                    <label>Hora de inicio</label>
                    <input class="fecha" type="time" name="horaInicioDia" min="08:00" max="20:00" step="3600" required />
                </div>
                <div class="one_quarter">
                    <label>Hora de finalización</label>
                    <input class="fecha" type="time" name="horaFinalDia" min="09:00" max="21:00" step="3600" required />
                </div>
                <div class="one_quarter"><br />
                    <input class="button" type="button" name="agregarFecha" value="Agregar" onclick="addDate()"/><br />
                </div>
                <div class="scrollable">
                    <table id="fechas">
                        <thead>
                            <tr>
                                <th>Día</th>
                                <th>Hora de inicio</th>
                                <th>Hora de finalización</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <br />
                <br />
                <br />
                <label class="titulo">Datos adicionales</label>
                <br />
                <label>Observaciones</label>
                <input class="observaciones" type="text" id="observaciones" />
                <br />
                <br />
                <label class="titulo">Información importante</label>
                <p>->La reservación se efectuará contra el pago del 50% del costo total</p>
                <p>->Este monto no es reembolsable</p>
            </form>
            <input type="button" value="Enviar" />
        </div>
      </main>
    </div>
    <script src="../Functions.js"></script>
</body>
</html>
