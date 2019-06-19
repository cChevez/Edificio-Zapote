<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="VerComprobante.aspx.cs" Inherits="EPIC.View.AdministratorViews.VerComprobante" %>
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
                        <li>
                            <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label></li>
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
                        <li class="active"><a href="Reservaciones.aspx">Control de reservaciones</a></li>
                        <li><a class="drop" href="#">Agregar</a>
                            <ul>
                                <li><a href="RegistrarAdministradores.aspx">Administradores</a></li>
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
                <h2>Comprobante de reservación</h2>
                <br />
                <br />
                <hr />
                <div class="first">
                    <asp:Label class="etiquetas" ID="reservacion" runat="server"></asp:Label>
                </div>
                <div class="first">
                    <asp:Image ID="Image" runat="server" />
                </div>
                <br />
                <br />
                <asp:Button ID="btnVolver" runat="server" Text="Atrás" OnClick="btnVolver_Click" />
            </main>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    </body>

</asp:Content>
