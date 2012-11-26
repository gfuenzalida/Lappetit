<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Garzon.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Editar Perfil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar Perfil</h2>
    <div>
        <fieldset>
            <legend>Datos a Editar</Legend>
            <div>
                <div style="vertical-align: top; display:inline-block; width:27%">
                    <asp:Label ID="Label11" runat="server" Text="Nombres"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <input id="Text11" type="text" />
                </div>
            </div>
            <div>
                <div style="vertical-align: top; display:inline-block; width:27%">
                    <asp:Label ID="Label1" runat="server" Text="Apellido Paterno"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <input id="Text1" type="text" />
                </div>
            </div>
            <div>
                <div style="vertical-align: top; display:inline-block; width:27%">
                    <asp:Label ID="Label2" runat="server" Text="Apellido Materno"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <input id="Text2" type="text" />
                </div>
            </div>
            <div>
                <div style="vertical-align: top; display:inline-block; width:27%">
                    <asp:Label ID="Label3" runat="server" Text="Contraseña"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <input id="Text3" type="text" />
                </div>
            </div>
            <div>
                <div style="vertical-align: top; display:inline-block; width:27%">
                    <asp:Label ID="Label4" runat="server" Text="Sexo"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <select id="Select1">
                        <option>Masculino</option>
                        <option>Femenino</option>
                    </select>
                </div>
            </div>
            <div>
                <div style="vertical-align: top; display:inline-block; width:27%">
                    <asp:Label ID="Label5" runat="server" Text="RUN"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <input id="Text5" type="text" />
                </div>
            </div>
            <div>
                <div style="vertical-align: top; display:inline-block; width:27%">
                    <asp:Label ID="Label6" runat="server" Text="Correo"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <input id="Text6" type="text" />
                </div>
            </div>
            <div>
                <div style="vertical-align: top; display:inline-block; width:27%">
                    <asp:Label ID="Label7" runat="server" Text="Telefono"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <input id="Text7" type="text" />
                </div>
            </div>
            <div>
                <input id="Button1" type="button" value="Confirmar" />
            </div>
        </fieldset>
    </div>

</asp:Content>
