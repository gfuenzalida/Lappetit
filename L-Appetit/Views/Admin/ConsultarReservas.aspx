<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Admin/ConsultarReservas.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Reservas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



<h2>Consultar Reservas</h2>

<!------------------------------------------------------>
    <div style="width:70%; vertical-align: top; display:inline-block">
        <fieldset style="100%">
        <legend>Reservas</legend>
        <div class="tabs">
            <div class="tab">
                <input type="radio" id="tab-1" name="tab-group-1" checked>
                <label for="tab-1">Consulta Reserva por Mesa</label>
                <div class="content">
                    <div>
                        <fieldset>
                            <legend>Mesas</legend>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="tab">
                <input type="radio" id="tab-2" name="tab-group-1">
                <label for="tab-2">Consulta Reserva por Cliente</label>
                <div class="content">
                    <div class="informacion">
                    <!-----div para poner fecha y horario, ver prototipo----->
                    </div>
                    <div style="width:100%">
                        <table style="width: 100%;">
                            <tr  style="background-color:#d0d6db">
                                <td style="width:33%">
                                    Fecha&nbsp;
                                </td>
                                <td style="width:33%">
                                    Horario&nbsp;
                                </td>
                                <td style="width:33%">
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
        <legend> Busqueda</legend>
        
    </fielset>
</div>
<!----------------------------------------------------------------------->

</asp:Content>
