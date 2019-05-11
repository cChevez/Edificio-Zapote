<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EPIC.View.Login" %>
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
                <li><a href="Index.aspx">Inicio</a></li>
                <li><a class="drop" href="#">Solicitar</a>
                  <ul>
                    <li><a href="Alquiler.aspx">Alquiler de espacio</a></li>
                    <li><a href="">Préstamo de espacio</a></li>
                  </ul>
                </li>
                <li><a href="Comprobante.aspx">Subir comprobante</a></li>
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
                <div class="content">
                    <h2>Ingresar</h2>
                    <br />
                    <div class="one_half first">
                        <asp:Label class="etiquetas" ID="Label2" runat="server" Text="Correo electrónico"></asp:Label>
                        <asp:TextBox ID="correo" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="correo" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                    </div>
                    <div class="one_half">
                        <asp:Label class="etiquetas" ID="Label4" runat="server" Text="Contraseña"></asp:Label>
                        <asp:TextBox ID="contrasena" runat="server" TextMode="Password" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="contrasena" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                    </div>
                    <div class="one_half first">
                        <asp:Button ID="btnLogIn" runat="server" Text="Iniciar sesión" OnClick="btnLogIn_Click"/>
                    </div>
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
