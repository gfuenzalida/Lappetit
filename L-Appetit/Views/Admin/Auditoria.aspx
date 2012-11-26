<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Auditoria
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Auditoria</h2>
    <div>
        <table style="width: 100%;">
            <tr style="background-color:#d0d6db">
                <td  style="width: 15%;">
                    Registrar&nbsp;
                </td>
                <td>
                    Tabla&nbsp;
                </td>
                <td style="width: 15%;">
                    SELECT&nbsp;
                </td>
                <td style="width: 15%;">
                    INSERT&nbsp;
                </td>
                <td style="width: 15%;">
                    UPDATE&nbsp;
                </td>
                <td style="width: 15%;">
                    DELETE&nbsp;
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
