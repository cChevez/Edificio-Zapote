<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="DetallesEstudiante.aspx.cs" Inherits="EPIC.View.AdministratorViews.DetallesEstudiante" %>
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
                <h2>Detalle estudiante</h2>
                <br />
                <br />
                <div class="one_half first">
                    <asp:Label class="etiquetas" ID="Label2" runat="server" Text="Nombre"></asp:Label>
                    <asp:TextBox ID="nombre" runat="server" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="nombre" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                </div>
                <div class="one_half">
                    <asp:Label class="etiquetas" ID="Label3" runat="server" Text="Apellido"></asp:Label>
                    <asp:TextBox ID="apellido" runat="server" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="apellido" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                </div>
                <div class="one_half first">
                    <asp:Label class="etiquetas" ID="Label1" runat="server" Text="Correo electrónico"></asp:Label>
                    <asp:TextBox ID="correo" runat="server" TextMode="Email" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="correo" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="correo" class="etiquetas" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="* ejemplo@ejemplo.com" ForeColor="Red"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                </div>
                <br />
                <br />
                <hr />
                <br />
                <br />
                <div>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlHorarioEstudiante">
                        <Columns>
                            <asp:BoundField DataField="dia" HeaderText="Día" SortExpression="dia" />
                            <asp:BoundField DataField="horaInicio" DataFormatString="{0:HH:mm}" HeaderText="Hora de entrada" SortExpression="horaInicio" />
                            <asp:BoundField DataField="horaFinal" DataFormatString="{0:HH:mm}" HeaderText="Hora de salida" SortExpression="horaFinal" />
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
                    <asp:SqlDataSource ID="SqlHorarioEstudiante" runat="server" ConnectionString="<%$ ConnectionStrings:ePICsqlConnection %>" SelectCommand="SELECT [dia], [horaInicio], [horaFinal] FROM [HorarioEstudiante] WHERE ([FKHorarioEstudiante] = @FKHorarioEstudiante)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="FKHorarioEstudiante" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <br />
                <br />
                <asp:Button ID="btnVolver" runat="server" Text="Atrás" OnClick="btnVolver_Click" />
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
