<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="VerEstudiantes.aspx.cs" Inherits="EPIC.View.VerEstudiantes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/styles.css" rel="stylesheet" type="text/css" media="all">
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
                        <li><a href="IndexAdministrativo.aspx"><i class="fa fa-lg fa-home"></i></a></li>
                        <li><a href="Login.aspx">Salir</a></li>
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
                        <li><a class="drop" href="#">Agregar</a>
                            <ul>
                                <li><a href="RegistrarAdministradores.aspx">Administradores</a></li>
                                <li><a href="RegistrarEstudiantes.aspx">Estudiantes</a></li>
                                <li><a href="#">Protocolos de emergencia</a></li>
                                <li><a href="#">Eventos realizados</a></li>
                                <li><a href="#">Cursos disponibles</a></li>
                            </ul>
                        </li>
                        <li class="active"><a class="drop" href="#">Ver</a>
                            <ul>
                                <li class="active"><a href="VerAdministradores.aspx">Administradores</a></li>
                                <li><a href="#">Estudiantes</a></li>
                                <li><a href="#">Protocolos de emergencia</a></li>
                                <li><a href="#">Eventos realizados</a></li>
                                <li><a href="#">Cursos disponibles</a></li>
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
                <h2>Estudiantes</h2>
                <br />
                <div>
                    <div class="one_quarter first">
                        <asp:Label class="etiquetas" ID="Label1" runat="server" Text="Estudiante"></asp:Label>
                        <asp:DropDownList ID="ListaEstudiantes" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="Page_Load" OnTextChanged="Page_Load">
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <br />
                <div>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id">
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>                    
                </div>
                <br />
                <br />
                <div class="one_third first">
                    <asp:Label class="etiquetas" ID="Label2" runat="server" Text="ID de administrador"></asp:Label>
                    <asp:DropDownList ID="idAdministrador" runat="server"></asp:DropDownList>
                    <br />
                    <br />
                </div>
                <div class="one_third">
                    <br />
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar administrador"/>
                </div>
            </main>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    </body>

</asp:Content>
