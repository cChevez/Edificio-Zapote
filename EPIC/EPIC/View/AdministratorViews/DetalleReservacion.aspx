<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="DetalleReservacion.aspx.cs" Inherits="EPIC.View.AdministratorViews.DetalleReservacion" %>
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
                    <h1><a href="IndexAdministrativo.aspx">Reservaciones ePIC</a></h1>
                </div>
                <nav id="mainav" class="fl_right">
                    <ul class="clear">
                        <li><a href="IndexAdministrativo.aspx">Inicio</a></li>
                        <li class="active"><a href="Reservaciones.aspx">Control de reservaciones</a></li>
                        <li><a class="drop" href="#">Agregar</a>
                            <ul>
                                <li><a href="RegistrarAdministradores.aspx">Administradores</a></li>
                                <li><a href="RegistrarEstudiantes.aspx">Estudiantes</a></li>
                                <li><a href="RegistrarProtocolos.aspx">Protocolos de emergencia</a></li>
                                <li><a href="RegistrarCursos.aspx">Cursos disponibles</a></li>
                            </ul>
                        </li>
                        <li><a class="drop" href="#">Ver</a>
                            <ul>
                                <li><a href="VerAdministradores.aspx">Administradores</a></li>
                                <li><a href="VerEstudiantes.aspx">Estudiantes</a></li>
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
                <!-- main body -->
                <!-- ################################################################################################ -->
                <div class="content">
                    <h2>Detalle de reservación</h2>
                    <br />
                    <asp:Label class="titulo" ID="Label1" runat="server" Text="Datos del solicitante"></asp:Label>
                    <br />
                    <br />
                    <div class="one_half first">
                        <asp:Label class="etiquetas" ID="Label2" runat="server" Text="Nombre del solicitante"></asp:Label>
                        <asp:TextBox ID="nombre" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="nombre" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                    </div>
                    <div class="one_half">
                        <asp:Label class="etiquetas" ID="Label3" runat="server" Text="Empresa solicitante"></asp:Label>
                        <asp:TextBox ID="empresa" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="empresa" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                    </div>
                    <div class="one_half first">
                        <asp:Label class="etiquetas" ID="Label4" runat="server" Text="Cédula jurídica o física"></asp:Label>
                        <asp:TextBox ID="cedula" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="cedula" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="cedula" class="etiquetas" ValidationExpression="\d{9,12}" Text="* Solo números sin guiones" ForeColor="Red"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                    </div>
                    <div class="one_half">
                        <asp:Label class="etiquetas" ID="Label5" runat="server" Text="Correo electrónico"></asp:Label>
                        <asp:TextBox ID="correo" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="correo" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="correo" class="etiquetas" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="* ejemplo@ejemplo.com" ForeColor="Red"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                    </div>
                    <div class="one_half first">
                        <asp:Label class="etiquetas" ID="Label6" runat="server" Text="Número de teléfono"></asp:Label>
                        <asp:TextBox ID="telefono" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="telefono" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="telefono" class="etiquetas" ValidationExpression="\d{8}" Text="* Formato esperado 88888888" ForeColor="Red"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <hr />
                    <br />
                    <br />
                    <asp:Label class="titulo" ID="Label7" runat="server" Text="Datos de la actividad"></asp:Label>
                    <br />
                    <br />
                    <div class="one_half first">
                        <asp:Label class="etiquetas" ID="Label16" runat="server" Text="Nombre de la actividad"></asp:Label>
                        <asp:TextBox ID="nombreActividad" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="nombreActividad" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                    </div>
                    <div class="one_third first">
                        <asp:Label class="etiquetas" ID="Label17" runat="server" Text="Fecha de la actividad:"></asp:Label>
                        <br />
                    </div>
                    <div class="one_quarter first">
                        <asp:Label class="etiquetas" ID="Label18" runat="server" Text="Del:"></asp:Label>
                        <asp:TextBox class="fecha" ID="fechaInicio" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="fechaInicio" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" class="etiquetas" runat="server" ControlToValidate="fechaInicio" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\-)(((0)[0-9])|((1)[0-2]))(\-)\d{4}$" Text="* Formato 01-12-2019" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="one_quarter">
                        <asp:Label class="etiquetas" ID="Label19" runat="server" Text="hasta:"></asp:Label>
                        <asp:TextBox class="fecha" ID="fechaFinal" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="* Campo necesario" ControlToValidate="fechaFinal" ForeColor="Red" class="etiquetas"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" class="etiquetas" runat="server" ControlToValidate="fechaFinal" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\-)(((0)[0-9])|((1)[0-2]))(\-)\d{4}$" Text="* Formato 01-12-2019" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="one_half first">
                        <br />
                        <asp:Label class="etiquetas" ID="Label20" runat="server" Text="Horario solicitado:"></asp:Label>
                    </div>
                    <div>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlHorarioReservacion">
                            <Columns>
                                <asp:BoundField DataField="dia" HeaderText="D&#237;a" SortExpression="dia" DataFormatString="{0:dd, MMM yyyy}" />
                                <asp:BoundField DataField="horaInicio" HeaderText="Hora de inicio" SortExpression="horaInicio" DataFormatString="{0:HH:mm}"  />
                                <asp:BoundField DataField="horaFinal" HeaderText="Hora de finalizaci&#243;n" SortExpression="horaFinal" DataFormatString="{0:HH:mm}"  />
                                <asp:BoundField DataField="FKAula" HeaderText="N&#250;mero de aula" SortExpression="FKAula" />
                                <asp:BoundField DataField="FKLaboratorio" HeaderText="N&#250;mero de laboratorio" SortExpression="FKLaboratorio" />
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
                        <asp:SqlDataSource runat="server" ID="SqlHorarioReservacion" ConnectionString='<%$ ConnectionStrings:ePICsqlConnection %>' SelectCommand="SELECT [dia], [horaInicio], [horaFinal], [FKAula], [FKLaboratorio] FROM [HorarioReservado] WHERE ([FKReservacion] = @FKReservacion)">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="id" Name="FKReservacion" Type="Int32"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <br />
                    <hr />
                    <br />
                    <br />
                    <div>
                        <div class="one_half first">
                            <asp:Label class="titulo" ID="Label24" runat="server" Text="Observaciones"></asp:Label>
                            <br />
                            <asp:TextBox class="observaciones" ID="observaciones" runat="server" Enabled="false"></asp:TextBox>
                            <br />
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <div>
                        <div class="one_half first">
                            <asp:Label class="titulo" ID="Label27" runat="server" Text="Costos"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label28" runat="server" Text="Total:"></asp:Label>
                            <asp:Label ID="Total" runat="server"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </div>
                    <br />
                    <hr />
                    <div class="one_third first">
                        <br />
                    </div>
                </div>
            </main>
        </div>
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    </body>

</asp:Content>
