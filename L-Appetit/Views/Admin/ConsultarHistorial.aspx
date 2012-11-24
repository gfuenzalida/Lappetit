<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Admin/ConsultarHistorial.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Historial
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Consultar Historial</h2>
<!------------------------------------------------------>
<div style="width:70%; vertical-align: top; display:inline-block">
    <fieldset style="100%">
    <legend>Historiales</legend>
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab-1" name="tab-group-1" checked>
            <label for="tab-1">Consulta Historial Reservas</label>
            <div class="content">
                <div class="informacion">
                    <!-----div para poner fecha y horario, ver prototipo----->
                </div>
                <div style="width:100%">
                    <table style="width: 100%;">
                        <tr  style="background-color:#d0d6db">
                            <td>
                                Cliente&nbsp;
                            </td>
                            <td style="width:20%">
                                Comensales&nbsp;
                            </td>
                            <td>
                                Garzon&nbsp;
                            </td>
                            <td>
                                Cocinero&nbsp;
                            </td>
                        </tr>
                    </table>
                    
                </div>
            </div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-2" name="tab-group-1">
            <label for="tab-2">Consulta Historial Pedidos</label>
            <div class="content">
                <div class="informacion">
                    <!-----div para poner fecha y horario, ver prototipo----->
                </div>
                <div style="width:100%">
                    <table style="width: 100%;">
                        <tr  style="background-color:#d0d6db">
                            <td style="width:35%">
                                Fecha de Reserva&nbsp;
                            </td>
                            <td>
                                Horario&nbsp;
                            </td>
                            <td >
                                Comensales&nbsp;
                            </td>
                        </tr>
                    </table>
                    
                </div>
            </div>
        </div>
    </div>
    </fieldset>
</div>

<div style="vertical-align: top; display:inline-block; margin-left:2%; width:27%">
    <fieldset>
        <legend> Busqueda de Reservas</legend>
        
    </fielset>
</div>
<!----------------------------------------------------------------------->
</asp:Content>
