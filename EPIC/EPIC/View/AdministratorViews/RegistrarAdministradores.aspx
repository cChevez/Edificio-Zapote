<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="RegistrarAdministradores.aspx.cs" Inherits="EPIC.View.RegistrarAdministradores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../styles/styles.css" rel="stylesheet" type="text/css" media="all">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body>
        <div class="wrapper row0">
            <div id="topbar" class="hoc clear">
                <!-- ################################################################################################ -->
                <div class="fl_left">
                    <ul>
                        <li><i class="fa fa-phone"></i>+506 25509160</li>
                        <li><i class="fa fa-envelope-o"></i>sagomez@itcr.ac.cr</li>
                    </ul>
                </div>
                <div class="fl_right">
                    <ul>
                        <li><asp:Label ID="lblNombreUsuario" runat="server"></asp:Label></li>
                        <li><a href="IndexAdministrativo.aspx"><i class="fa fa-lg fa-home"></i></a></li>
                        <li><a href="../UserViews/Login.aspx">Salir</a></li>
                    </ul>
                </div>
                <!-- ################################################################################################ -->
            </div>
        </div>
        <div class="wrapper row1">
            <header id="header" class="hoc clear">
                <!-- ################################################################################################ -->
                <div id="logo" class="fl_left">
                    <h1><a href="IndexAdministrativo.aspx">Reservaciones ePIC</a></h1>
                </div>
                <nav id="mainav" class="fl_right">
                <ul class="clear">
                    <li><a href="IndexAdministrativo.aspx">Inicio</a></li>
                    <li><a href="Reservaciones.aspx">Control de reservaciones</a></li>
                    <li class="active"><a class="drop" href="#">Agregar</a>
                            <ul>
                                <li class="active"><a href="RegistrarAdministradores.aspx">Administradores</a></li>
                                <li><a href="RegistrarEstudiantes.aspx">Estudiantes</a></li>
                                <li><a href="RegistrarProtocolos.aspx">Protocolos de emergencia</a></li>
                                <li><a href="RegistrarCursos.aspx">Cursos disponibles</a></li>
                            </ul>
                        </li>
                        <li><a class="drop" href="#">Ver</a>
                            <ul>
                                <li><a href="VerAdministradores.aspx">Administradores</a></li>
                                <li><a href="VerEstudiantes.aspx">Estudiantes</a></li>
                                <li><a href="VerProtocolos.aspx">Protocolos de emergencia</a></li>
                                <li><a href="VerCursos.aspx">Cursos disponibles</a></li>
                            </ul>
                        </li>
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
                <h2>Registrar administradores</h2>
                <br />
                <br />
                <div class="one_half first">
                    <asp:Label class="etiquetas" ID="Label2" runat="server" Text="Nombre"></asp:Label>
                    <asp:TextBox ID="nombre" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="nombre" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                </div>
                <div class="one_half">
                    <asp:Label class="etiquetas" ID="Label3" runat="server" Text="Apellido"></asp:Label>
                    <asp:TextBox ID="apellido" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="apellido" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                </div>
                <div class="one_half first">
                    <asp:Label class="etiquetas" ID="Label1" runat="server" Text="Correo electrónico"></asp:Label>
                    <asp:TextBox ID="correo" runat="server" TextMode="Email" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="correo" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="correo" class="etiquetas" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="* ejemplo@ejemplo.com" ForeColor="Red"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                </div>
                <div class="one_half">
                    <asp:Label class="etiquetas" ID="Label4" runat="server" Text="Contraseña"></asp:Label>
                    <asp:TextBox ID="contrasena" runat="server" TextMode="Password" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="contrasena" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="contrasena" class="etiquetas" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,15}$" Text="* Debe tener entre 5 y 15 caracteres, además, mayúsculas, minúsculas y números" ForeColor="Red"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                </div>
                <div>
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click"/>
                </div>
            </main>
        </div>
        <div class="wrapper row5">
            <div id="copyright" class="hoc clear">
                <!-- ################################################################################################ -->
                <p class="fl_left">Copyright &copy; 2019 - Todos los derechos reservados - </p>
                <p class="fl_right">Escuela de Ingeniería en Computación</p>
                <!-- ################################################################################################ -->
            </div>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    </body>

</asp:Content>
