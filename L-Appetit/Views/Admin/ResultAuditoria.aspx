<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Resultado Auditoria
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Resultado Auditoria</h2>
    <div>
        
        <fieldset>
        <legend>Busqueda</legend>
        <div>
        
        <div style="vertical-align: top; display:inline-block; width: 33%">
            <div style="width: 100%">
                <div style="vertical-align: top; display:inline-block; width: 23% ">
                    <asp:Label ID="Label3" runat="server" Text="Tabla"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block; max-width: 50%">
                    <select id="Select1">
                        <option></option>
                    </select>
                </div>
            </div>
            <div style="width: 100%">
                <div style="vertical-align: top; display:inline-block; width: 23%">
                    <asp:Label ID="Label4" runat="server" Text="Operacion"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block; max-width: 50%">
                    <select id="Select2">
                        <option></option>
                    </select>
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
        </div>
        <div style=" vertical-align: top; display:inline-block; text-align: right;width:100%">
            <div style=" vertical-align: top; display:inline-block; text-align: right;">
                <input id="Button1" type="button" value="Buscar" />
            </div>
            <div style=" vertical-align: top; display:inline-block; text-align:right">
                <input id="Button2" type="button" value="Configurar" />
            </div>
        </div>
        </fieldset>
    </div>
    <div>
        <table style="width: 100%; background-color:#d0d6db">
            <tr>
                <td style="width:25%">
                    Fecha&nbsp;
                </td>
                <td style="width:25%">
                    Hora&nbsp;
                </td>
                <td style="width:25%">
                    Tabla&nbsp;
                </td>
                <td style="width:25%">
                    Operacion&nbsp;
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
