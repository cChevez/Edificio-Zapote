<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Comprobante.aspx.cs" Inherits="EPIC.Comprobante" %>
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
                <li><i class="fa fa-phone"></i> +506 25509160</li>
                <li><i class="fa fa-envelope-o"></i> sagomez@itcr.ac.cr</li>
                    </ul>
                </div>
                <div class="fl_right">
                    <ul>
                        <li><a href="Index.aspx"><i class="fa fa-lg fa-home"></i></a></li>
                        <li><a href="Login.aspx">Ingresar</a></li>
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
                          <li><a href="">Préstamo de espacio</a></li>
                      </ul>
                  </li>
                  <li class="active"><a href="Comprobante.aspx">Subir comprobante</a></li>
                  <li><a href="Login.aspx">Opciones administrativas</a></li>
                  <li><a class="drop" href="#">Información Adicional</a>
                      <ul>
                          <li><a href="VerDocumentosCliente.aspx">Protocolos de emergencia</a></li>
                          <li><a href="VerCursosCliente.aspx">Cursos disponibles</a></li>
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
                <!-- main body -->
                <!-- ################################################################################################ -->
                <div class="content">
                    <h2>Subir comprobante de pago</h2>
                    <hr />
                    <asp:Label class="titulo" ID="Label1" runat="server" Text="Ingrese el número de reservación"></asp:Label>
                    <br />
                    <br />
                    <asp:TextBox ID="numeroReservacion" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="numeroReservacion" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Button class="button" ID="verificarReservacion" runat="server" Text="Verificar" OnClick="verificarReservacion_Click"/>
                    <br />
                </div>
                <br />
                <hr />
                <br />
                <div class="one_third first encierroCentral">
                    <asp:Label class="etiquetas" ID="Label2" runat="server" Text="¿Desea factura electrónica?"></asp:Label>
                    <asp:CheckBox ID="factura" runat="server" OnCheckedChanged="factura_CheckedChanged" AutoPostBack="True" />
                </div>
                <br />
                <br />
                <br />
                <hr />
                <br />
                <div id="formFactura">
                    <asp:Label class="titulo" ID="Label4" runat="server" Text="Datos para la factura electrónica"></asp:Label>
                    <br />
                    <br />
                    <asp:Label class="etiquetas" ID="Label3" runat="server" Text="Nombre completo"></asp:Label>
                    <asp:TextBox ID="nombre" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="nombre" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label class="etiquetas" ID="Label5" runat="server" Text="Cédula"></asp:Label>
                    <asp:TextBox ID="cedula" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="cedula" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label class="etiquetas" ID="Label6" runat="server" Text="Teléfono"></asp:Label>
                    <asp:TextBox ID="telefono" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="telefono" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label class="etiquetas" ID="Label7" runat="server" Text="Correo electrónico"></asp:Label>
                    <asp:TextBox ID="correo" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="correo" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label class="etiquetas" ID="Label8" runat="server" Text="Dirección"></asp:Label>
                    <asp:TextBox ID="direccion" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="direccion" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                </div>
                <br />
                <br />
                <hr />
                <br />
                <br />
                <div>
                    <asp:FileUpload ID="fuArchivo" runat="server" />
                    <br />
                    <br />
                </div>
                <br />
                <br />
                <hr />
                <br />
                <br />
                <asp:Button class="button" ID="enviar" runat="server" Text="Enviar" OnClick="enviar_Click"/>
            </main>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    </body>

</asp:Content>