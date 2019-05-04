<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Reservaciones.aspx.cs" Inherits="EPIC.View.Reservaciones" %>
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
                <li><a href="Index.aspx">Home</a></li>
                <li><a class="drop" href="#">Solicitar</a>
                  <ul>
                    <li><a href="Alquiler.aspx">Alquiler de espacio</a></li>
                    <li><a href="">Préstamo de espacio</a></li>
                  </ul>
                </li>
                <li><a href="Comprobante.aspx">Subir comprobante</a></li>
                <li class="active"><a class="drop" href="#">Opciones administrativas</a>
                    <ul>
                        <li class="active"><a href="Reservaciones.aspx">Control de reservaciones</a></li>
                        <li><a href="#">Level 2</a></li>
                    </ul>
                </li>
                <li><a href="#">Link Text</a></li>
              </ul>
            </nav>
            <!-- ################################################################################################ -->
          </header>
        </div>
        <div>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    </body>

</asp:Content>
