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
                <li><i class="fa fa-phone"></i> +506 25509160</li>
                <li><i class="fa fa-envelope-o"></i> sagomez@itcr.ac.cr</li>
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
        <div class="wrapper row2">
            <div id="breadcrumb" class="hoc clear"> 
            </div>
        </div>
        <div class="wrapper row3">
            <main class="hoc container clear"> 
                <h2>Control de reservaciones</h2>
                <br />
                <div>
                    <div class="one_quarter first">
                    <asp:DropDownList ID="ListaEstados" runat="server" DataSourceID="SqlEstados" DataTextField="nombreEstado" DataValueField="id" AutoPostBack="true"
                        OnSelectedIndexChanged="Page_Load" OnTextChanged="Page_Load">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlEstados" runat="server" ConnectionString="<%$ ConnectionStrings:ePICsqlConnection %>" SelectCommand="SELECT [nombreEstado], [id] 
                        FROM [estadoReservacion]"></asp:SqlDataSource>
                    </div>
                </div>
                <br />
                <br />
                <div>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlReservaciones" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="fechaSolicitud" HeaderText="Fecha de solicitud" SortExpression="fechaSolicitud" />
                            <asp:BoundField DataField="nombreSolicitante" HeaderText="Solicitante" SortExpression="nombreSolicitante" />
                            <asp:BoundField DataField="nombreEmpresa" HeaderText="Empresa" SortExpression="nombreEmpresa" />
                            <asp:BoundField DataField="nombreActividad" HeaderText="Actividad" SortExpression="nombreActividad" />
                            <asp:BoundField DataField="email" HeaderText="Correo" SortExpression="email" />
                            <asp:BoundField DataField="numeroTelefono" HeaderText="Teléfono" SortExpression="numeroTelefono" />
                            <asp:BoundField DataField="nombreEstado" HeaderText="Estado" SortExpression="nombreEstado" />
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
                    <asp:SqlDataSource ID="SqlReservaciones" runat="server" ConnectionString="<%$ ConnectionStrings:ePICsqlConnection %>" SelectCommand="SELECT eR.nombreEstado, 
                        R.fechaSolicitud, R.nombreSolicitante, R.nombreEmpresa, R.nombreActividad, R.email, R.numeroTelefono 
                        FROM estadoReservacion AS eR INNER JOIN Reservacion AS R ON eR.id = R.FKEstadoReservacion WHERE (R.FKEstadoReservacion = @estado)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListaEstados" Name="estado" PropertyName="SelectedValue" DefaultValue="1" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <br />
                <br />
                <div class="one_third first">
                    <asp:Label class="etiquetas" ID="Label2" runat="server" Text="Número de reservación"></asp:Label>
                    <asp:DropDownList ID="codigoReservacion" runat="server" DataSourceID="SqlCodigoReservaciones" DataTextField="id" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlCodigoReservaciones" runat="server" ConnectionString="<%$ ConnectionStrings:ePICsqlConnection %>" SelectCommand="SELECT id, FKEstadoReservacion FROM Reservacion WHERE (FKEstadoReservacion = @estado)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListaEstados" Name="estado" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                </div>
                <div class="one_third">
                    <asp:Label class="etiquetas" ID="Label1" runat="server" Text="Nuevo estado"></asp:Label>
                    <asp:DropDownList ID="codigoEstado" runat="server">
                        <asp:ListItem Value="3">Aprobada</asp:ListItem>
                        <asp:ListItem Value="5">Cancelada</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="one_third">
                    <br />
                    <asp:Button ID="btnCambiarEstado" runat="server" Text="Cambiar estado" OnClick="btnCambiarEstado_Click" />
                </div>
            </main>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    </body>

</asp:Content>
