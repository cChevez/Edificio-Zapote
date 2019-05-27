<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="VerCursosCliente.aspx.cs" Inherits="EPIC.View.UserViews.VerCursosCliente" %>
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
                <h2>Cursos disponibles</h2>
                <br />
                <div>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCursos">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                            <asp:TemplateField HeaderText="Detalles">
                                <ItemTemplate>
                                    <asp:HyperLink ID="descarga" runat="server" NavigateUrl='<%# Eval("id", "~/View/UserViews/DetalleCursos.aspx?id={0}") %>' Text="Ver más">
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
                    <asp:SqlDataSource ID="SqlCursos" runat="server" ConnectionString="<%$ ConnectionStrings:ePICsqlConnection %>" SelectCommand="SELECT [id], [nombre] FROM [Cursos]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDocumentos" runat="server" ConnectionString="<%$ ConnectionStrings:ePICsqlConnection %>" SelectCommand="SELECT [id], [nombre], [size] FROM [Archivos]"></asp:SqlDataSource>
                </div>
                <br />
                <br />
            </main>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    </body>

</asp:Content>
