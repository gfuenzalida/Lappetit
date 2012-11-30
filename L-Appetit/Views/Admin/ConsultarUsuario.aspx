<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Admin/ConsultarUsuarios.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Usuario
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Consultar Usuario
        </div>
    </h2>
    <div class="contenedorInfo">
        <fieldset>
            <legend>Datos del Usuario</legend>
            <div class= "etiquetaInfo">
                <div  style="vertical-align:top; display:inline-block;">
                    <asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label>
                </div>
                <div style="vertical-align:top; display:inline-block;">
                    <!-- div para la salida de informacion-->
                </div>
            </div>
            <div class= "etiquetaInfo">
                <div style="vertical-align:top; display:inline-block;">
                    <asp:Label ID="Label2" runat="server" Text="Apellido Paterno: "></asp:Label>
                </div>
                <div style="vertical-align:top; display:inline-block;">
                    <!-- div para la salida de informacion-->
                </div>
            </div>
            <div class= "etiquetaInfo">
                <div style="vertical-align:top; display:inline-block;">
                    <asp:Label ID="Label3" runat="server" Text="Apellido Materno: "></asp:Label>
                </div>
                <div style="vertical-align:top; display:inline-block;">
                    <!--div para la salida de informacion-->
                </div>
            </div>
            <div class= "etiquetaInfo">
                <div style="vertical-align:top; display:inline-block;">
                    <asp:Label ID="Label4" runat="server" Text="Sexo: "></asp:Label>
                </div>
                <div style="vertical-align:top; display:inline-block;">
                    <!--div para la salida de informacion-->
                </div>
            </div>
            <div class= "etiquetaInfo">
                <div style="vertical-align:top; display:inline-block;">
                    <asp:Label ID="Label5" runat="server" Text="RUN: "></asp:Label>
                </div>
                <div style="vertical-align:top; display:inline-block;">
                    <!--div para la salida de informacion-->
                </div>
            </div>
            <div class= "etiquetaInfo">
                <div style="vertical-align:top; display:inline-block;">
                    <asp:Label ID="Label8" runat="server" Text="Carrera: "></asp:Label>
                </div>
                <div style="vertical-align:top; display:inline-block;">
                    <!-- div para la salida de la informacion-->
                </div>
            </div>
            <div class= "etiquetaInfo">
                <div style="vertical-align:top; display:inline-block;">
                    <asp:Label ID="Label6" runat="server" Text="Correo: "></asp:Label>
                </div>
                <div style="vertical-align:top; display:inline-block;">
                    <!-- div para la salida de la informacion-->
                </div>
            </div>
            <div class= "etiquetaInfo">
                <div style="vertical-align:top; display:inline-block;">
                    <asp:Label ID="Label7" runat="server" Text="Telefono: "></asp:Label>
                </div>
                <div style="vertical-align:top; display:inline-block;">
                    <!-- div para la salida de informacion-->
                </div>
            </div>
            <div class= "etiquetaInfo">
                <div style="vertical-align: top; display:inline-block">
                    <input id="Button1" type="button" value="Eliminar" />
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <input id="Button2" type="button" value="Volver" />
                </div>
            </div>
        </fieldset>
    </div>
    

</asp:Content>


