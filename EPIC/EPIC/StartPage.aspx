<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="EPIC.StartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/styles.css" rel="stylesheet" type="text/css" media="all">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body>
        
        <div>
            <br />
            <br />
            <br />
            <br />
        </div>
        <div class="wrapper row3">
            <main class="hoc container clear">
                <div class="content">
                    <h2 class="center">Iniciar como:</h2>
                    <br />
                    <hr /> 
                    <br />
                    <br />
                    <div class="one_third first"><br /></div>
                    <div class="one_third">
                        
                        <asp:Button class="titulo bold" ID="btnUser" runat="server" Text="Usuario" BorderStyle="Double" Width="300px" Font-Size="18" OnClick="btnUser_Click"/>
                        <br />
                        <br />

                    </div>
                    <div class="one_third"><br /></div>
                    <div class="one_third first"><br /></div>
                    <div class="one_third">
                        
                        <asp:Button class="titulo bold" ID="btnAdmin" runat="server" Text="Administrador" BorderStyle="Double" Width="300px" Font-Size="18" OnClick="btnAdmin_Click"/>
                        <br />
                        <br />

                    </div>
                    <div class="one_third"><br /></div>
                </div>
            </main>
        </div>
        <div class="wrapper row2">
            <div id="breadcrumb2" class="hoc clear">
            </div>
        </div>
    </body>

</asp:Content>
