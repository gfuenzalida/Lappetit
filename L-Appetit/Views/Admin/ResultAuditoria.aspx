<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ResultAuditoria
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ResultAuditoria</h2>
    <div>
        <fieldset>
        <legend>Busqueda</legend>
        <div style="vertical-align: top; display:inline-block; width: 33%">
            <div>
                <div style="vertical-align: top; display:inline-block">
                </div>
                <div style="vertical-align: top; display:inline-block">
                </div>
            </div>
            <div>
                <div style="vertical-align: top; display:inline-block">
                </div>
                <div style="vertical-align: top; display:inline-block">
                </div>
            </div>
        </div>
        <div style="vertical-align: top; display:inline-block; width: 33%">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Seleccione Inicio:"></asp:Label>
            </div>
            <div>
                <!--- div puesto para un calendario-->
            </div>
        </div>
        <div style="vertical-align: top; display:inline-block; width: 33%">
            <div>
                <asp:Label ID="Label2" runat="server" Text="Seleccione Termino:"></asp:Label>
            </div>
            <div>
                <!--- div puesto para un calendario-->
            </div>
        </div>
        </fieldset>
    </div>
    <div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
