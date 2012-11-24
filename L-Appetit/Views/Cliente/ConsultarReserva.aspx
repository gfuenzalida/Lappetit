<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cliente.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    HomeCliente
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Consultar Reserva</h2>
<% L_Appetit.Models.Cliente.ReservaModel modelo = ViewData.Model; %>
<%: Html.Label(modelo.ListaReservas.Count.ToString()) %>
    <div style="vertical-align: top; display:inline-block; width:50%">
        <div style=" width:80%;">
            <div style="width:100%; text-align:justify">
                L'Appétit permite que un cliente pueda hacer reservas para comer en el restaurant, a través de los tickets otorgados por su contacto. Cada reserva sirve hasta 6 personas en uno de los dos horarios disponibles por día.
                ¡Gestione sus reservas y disfrute de las mejores comidas de forma gratuita!
            </div>
            <div>
                <!-- OJO cambiar el boton-->
                <br>
                <input id="Button1" type="button" value="Hacer Reservas" />
            </div>
        </div>
        <div style=" width:80%;">
            <div style="width:100%; text-align:justify">
            <br>
            Si no está seguro de que fecha elegir para comer en el restaurant, porque no sabe lo que comerá, L'Appétit le permite consultar los menús disponibles para cada día.
            ¡Consulte el menú y facilite la planificación de su reserva!
            </div>
            <div>
                <!--Ojo cambiar el boton-->
                <br>
                <input id="Button2" type="button" value="Consultar Menu" />
                <br>
            </div>
        </div>
    </div>
    <div style="vertical-align: top; display:inline-block; width:49%;">
            <fieldset>
                <legend>Consultar Reservas</legend>
                <div>
                <table style="width: 100%;">
                    <tr  style="background-color:#d0d6db">
                        <td>
                            Fecha de Reserva&nbsp;
                        </td>
                        <td>
                            Horario&nbsp;
                        </td>
                        <td>
                            Comensales&nbsp;
                        </td>
                        <td>
                            Observaciones&nbsp;
                        </td>
                        <td>
                            <input id="Checkbox1" type="checkbox" />&nbsp;
                        </td>
                    </tr>
                </table>
                </div>
                <div>
                    <input id="Submit1" type="submit" value="Eliminar" />
                </div>
            </fieldset>
    </div>
</asp:Content>
