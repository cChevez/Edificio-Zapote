﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="VerEstudiantes.aspx.cs" Inherits="EPIC.View.VerEstudiantes" %>
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
                        <li><a class="drop" href="#">Agregar</a>
                            <ul>
                                <li><a href="RegistrarAdministradores.aspx">Administradores</a></li>
                                <li><a href="RegistrarEstudiantes.aspx">Estudiantes</a></li>
                                <li><a href="RegistrarProtocolos.aspx">Protocolos de emergencia</a></li>
                                <li><a href="RegistrarCursos.aspx">Cursos disponibles</a></li>
                            </ul>
                        </li>
                        <li class="active"><a class="drop" href="#">Ver</a>
                            <ul>
                                <li><a href="VerAdministradores.aspx">Administradores</a></li>
                                <li class="active"><a href="VerEstudiantes.aspx">Estudiantes</a></li>
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
                <h2>Estudiantes</h2>
                <br />
                <br />
                <br />
                <div>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlMostrarEstudiantes">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                            <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                            <asp:TemplateField HeaderText="Detalles">
                                <ItemTemplate>
                                    <asp:HyperLink ID="detalle" runat="server" NavigateUrl='<%# Eval("id", "~/View/AdministratorViews/DetallesEstudiante.aspx?id={0}") %>' Text="Ver detalles">
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
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
                    <asp:SqlDataSource ID="SqlMostrarEstudiantes" runat="server" ConnectionString="<%$ ConnectionStrings:ePICsqlConnection %>" SelectCommand="SELECT id, nombre, apellido FROM Estudiante"></asp:SqlDataSource>
                </div>
                <br />
                <br />
                <div class="one_third first">
                    <asp:Label class="etiquetas" ID="Label2" runat="server" Text="ID del estudiante"></asp:Label>
                    <asp:DropDownList ID="idEstudiante" runat="server" DataSourceID="SqlMostrarEstudiantes" DataTextField="id" DataValueField="id"></asp:DropDownList>
                    <br />
                    <br />
                </div>
                <div class="one_third">
                    <br />
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar estudiante" OnClick="btnEliminar_Click"/>
                </div>
            </main>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    </body>

</asp:Content>
