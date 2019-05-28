<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="EPIC.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="server">
    <link href="../../styles/styles.css" rel="stylesheet" type="text/css" media="all">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    
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
                  <li class="active"><a href="Index.aspx">Inicio</a></li>
                  <li><a class="drop" href="#">Solicitar</a>
                      <ul>
                          <li><a href="Alquiler.aspx">Alquiler de espacio</a></li>
                      </ul>
                  </li>
                  <li><a href="Comprobante.aspx">Subir comprobante</a></li>
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
        <div class="bgded overlay" style="background-image:url('../../images/logo.png');">
            <div id="pageintro" class="hoc clear"> 
            </div>
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
