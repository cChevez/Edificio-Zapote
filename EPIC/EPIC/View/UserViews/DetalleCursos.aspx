<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="DetalleCursos.aspx.cs" Inherits="EPIC.View.UserViews.DetalleCursos" %>
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
                    <h1><a href="Index.aspx">Reservaciones ePIC</a></h1>
                </div>
                <nav id="mainav" class="fl_right">
                    <ul class="clear">
                        <li><a href="Index.aspx">Inicio</a></li>
                        <li><a class="drop" href="#">Solicitar</a>
                            <ul>
                                <li><a href="Alquiler.aspx">Alquiler de espacio</a></li>
                                <li><a href="#">Préstamo de espacio</a></li>
                            </ul>
                        </li>
                        <li><a href="Comprobante.aspx">Subir comprobante</a></li>
                        <li><a href="Login.aspx">Opciones administrativas</a></li>
                        <li class="active"><a class="drop" href="#">Información Adicional</a>
                            <ul>
                                <li><a href="VerDocumentosCliente.aspx">Protocolos de emergencia</a></li>
                                <li class="active"><a href="VerCursosCliente.aspx">Cursos disponibles</a></li>
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
                <h2>Detalles de curso</h2>
                <br />
                <br />
                <hr />
                <div class="first">
                    <asp:Label class="etiquetas" ID="Label2" runat="server" Text="Nombre"></asp:Label>
                    <asp:TextBox ID="nombre" runat="server" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="nombre" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                </div>
                <div class="first">
                    <asp:Image ID="Image" runat="server" />
                </div>
                <div class="first">
                    <asp:Label class="etiquetas" ID="Label3" runat="server" Text="Descripción"></asp:Label>
                    <asp:TextBox ID="descripcion" TextMode="MultiLine" runat="server" Columns="100" Rows="10" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="descripcion" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                </div>
                <br />
                <asp:Button ID="btnVolver" runat="server" Text="Atrás" OnClick="btnVolver_Click" />
            </main>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    </body>

</asp:Content>
