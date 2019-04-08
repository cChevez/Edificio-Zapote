<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Alquiler.aspx.cs" Inherits="EPIC.Alquiler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/styles.css" rel="stylesheet" type="text/css" media="all">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <body>
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
                <li><a href="#">Ingresar</a></li>
                <li><a href="#">Registrarse</a></li>
              </ul>
            </div>
            <!-- ################################################################################################ -->
          </div>
        </div>
        <div class="wrapper row1">
          <header id="header" class="hoc clear"> 
            <!-- ################################################################################################ -->
            <div id="logo" class="fl_left">
                <h1><a href="Index.aspx">Reservaciones ePIC</a></h1>
            </div>
            <nav id="mainav" class="fl_right">
              <ul class="clear">
                <li><a href="Index.aspx">Home</a></li>
                <li class="active"><a class="drop" href="#">Solicitar</a>
                  <ul>
                    <li><a href="Alquiler.aspx">Alquiler de espacio</a></li>
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
                <h2>Alquiler de espacios</h2>
                <br />
                <asp:Label class="titulo" ID="Label1" runat="server" Text="Datos del solicitante"></asp:Label>
                <br />
                <br />
                <div class="one_half first">
                    <asp:Label class="etiquetas" ID="Label2" runat="server" Text="Nombre del solicitante"></asp:Label>
                    <asp:TextBox ID="nombre" runat="server" ></asp:TextBox>
                    <br />
                </div>
                <div class="one_half">
                    <asp:Label class="etiquetas" ID="Label3" runat="server" Text="Empresa solicitante"></asp:Label>
                    <asp:TextBox ID="empresa" runat="server" ></asp:TextBox>
                    <br />
                </div>
                <div class="one_half first">
                    <asp:Label class="etiquetas" ID="Label4" runat="server" Text="Cédula jurídica"></asp:Label>
                    <asp:TextBox ID="cedula" runat="server" ></asp:TextBox>
                    <br />
                </div>
                <div class="one_half">
                    <asp:Label class="etiquetas" ID="Label5" runat="server" Text="Correo electrónico"></asp:Label>
                    <asp:TextBox ID="correo" runat="server" ></asp:TextBox>
                    <br />
                </div>
                <div class="one_half first">
                    <asp:Label class="etiquetas" ID="Label6" runat="server" Text="Número de teléfono"></asp:Label>
                    <asp:TextBox ID="telefono" runat="server" ></asp:TextBox>
                    <br />
                </div>
                <br />
                <br />
                <br />
                <br />
                <hr />
                <br />
                <asp:Label class="titulo" ID="Label7" runat="server" Text="Datos del espacio a reservar"></asp:Label>
                <br />
                <br />
                <div class="one_half first">
                    <asp:Label class="etiquetas" ID="Label8" runat="server" Text="Cantidad de aulas"></asp:Label>
                    <asp:DropDownList ID="listAulas" runat="server" OnSelectedIndexChanged="listAulas_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Selected="True">0</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="one_half">
                    <asp:Label class="etiquetas" ID="Label9" runat="server" Text="Cantidad o tipo de laboratorio"></asp:Label>
                    <asp:DropDownList ID="listLabs" runat="server" OnSelectedIndexChanged="listLabs_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Selected="True">0</asp:ListItem>
                        <asp:ListItem>B1</asp:ListItem>
                        <asp:ListItem>B2</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="one_half first">
                    <br />
                    <asp:Label class="etiquetas" ID="Label10" runat="server" Text="Aula 1 (capacidad 25 personas)" Visible="false"></asp:Label>
                    <asp:TextBox ID="aula1" runat="server" Visible="false"></asp:TextBox>
                </div>
                <div class="one_half">
                    <br />
                    <asp:Label class="etiquetas" ID="Label11" runat="server" Text="Laboratorio B1 (capacidad 18 personas)" Visible="false"></asp:Label>
                    <asp:TextBox ID="lab1" runat="server" Visible="false"></asp:TextBox>
                </div>
                
                <div class="one_half first">
                    <br />
                    <asp:Label class="etiquetas" ID="Label12" runat="server" Text="Aula 2 (capacidad 25 personas)" Visible="false"></asp:Label>
                    <asp:TextBox ID="aula2" runat="server" Visible="false"></asp:TextBox>
                </div>
                <div class="one_half">
                    <br />
                    <asp:Label class="etiquetas" ID="Label13" runat="server" Text="Laboratorio B2 (capacidad 20 personas)" Visible="false"></asp:Label>
                    <asp:TextBox ID="lab2" runat="server" Visible="false"></asp:TextBox>
                </div>
                <div class="one_half first">
                    <br />
                    <asp:Label class="etiquetas" ID="Label14" runat="server" Text="Aula 3 (capacidad 25 personas)" Visible="false"></asp:Label>
                    <asp:TextBox ID="aula3" runat="server" Visible="false"></asp:TextBox>
                </div>
                <br />
                <br />
                <hr />
                <br />
                <br />
                <asp:Label class="titulo" ID="Label15" runat="server" Text="Datos de la activdad a realizar"></asp:Label>
                <br />
                <br />
                <div class="one_half first">
                    <asp:Label class="etiquetas" ID="Label16" runat="server" Text="Nombre de la actividad"></asp:Label>
                    <asp:TextBox ID="nombreActividad" runat="server" ></asp:TextBox>
                    <br />
                </div>
                <div class="one_third first">
                    <asp:Label class="etiquetas" ID="Label17" runat="server" Text="Fecha de la actividad:"></asp:Label>
                    <br />
                </div>
                <div class="one_quarter first">
                    <asp:Label class="etiquetas" ID="Label18" runat="server" Text="Del:" ></asp:Label> 
                    <asp:TextBox class="fecha" TextMode="Date" ID="fechaInicio" runat="server"></asp:TextBox>
                </div>
                <div class="one_quarter">
                    <asp:Label class="etiquetas" ID="Label19" runat="server" Text="hasta:"></asp:Label> 
                    <asp:TextBox class="fecha" TextMode="Date" ID="fechaFinal" runat="server"></asp:TextBox>
                </div>
                <div class="one_half first">
                    <br />
                    <asp:Label class="etiquetas" ID="Label20" runat="server" Text="Horario requerido:"></asp:Label> 
                </div>
                <div class="one_quarter first">
                    <asp:Label class="etiquetas" ID="Label21" runat="server" Text="Día" ></asp:Label> 
                    <asp:TextBox class="fecha" TextMode="Date" ID="diaReserva" runat="server" ></asp:TextBox>
                </div>
                <div class="one_quarter">
                    <asp:Label class="etiquetas" ID="Label22" runat="server" Text="Hora de inicio" ></asp:Label> 
                    <asp:TextBox class="fecha" TextMode="Time" ID="horaInicio" runat="server"></asp:TextBox>
                </div>
                <div class="one_quarter">
                    <asp:Label class="etiquetas" ID="Label23" runat="server" Text="Hora de finalización" ></asp:Label> 
                    <asp:TextBox class="fecha" TextMode="Time" ID="horaFinal" runat="server"></asp:TextBox>
                </div>
                <div class="one_quarter">
                    <br />
                    <asp:Button class="button" ID="agregarHorario" runat="server" Text="Agregar" OnClick="agregarHorario_Click"/> 
                    <br />
                    <br />
                </div>
                <div>
                    <asp:Table ID="tablaHorario" runat="server" GridLines="Horizontal">
                        <asp:TableRow runat="server">
                            <asp:TableHeaderCell runat="server">Día</asp:TableHeaderCell>
                            <asp:TableHeaderCell runat="server">Hora de inicio</asp:TableHeaderCell>
                            <asp:TableHeaderCell runat="server">Hora de finalización</asp:TableHeaderCell>
                            
                        </asp:TableRow>
                    </asp:Table>
                </div>
                <div>
                    
                </div>
            </div>
          </main>
        </div>
    </body>

</asp:Content>
