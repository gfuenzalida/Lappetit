<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cliente.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Reservas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Consultar Reservas
        </div>
    </h2>

    <div style="vertical-align: top; display:inline-block; width:50%">
        <div style=" width:80%;">
            <div style="width:100%; text-align:justify">
                L'Appétit permite que un cliente pueda hacer reservas para comer en el restaurant, a través de los tickets otorgados por su contacto. Cada reserva sirve hasta 6 personas en uno de los dos horarios disponibles por día.
                ¡Gestione sus reservas y disfrute de las mejores comidas de forma gratuita!
            </div>
            <div>
                <!-- OJO cambiar el boton-->
                <br>
                <form id="Form1" method="get" action="HacerReserva">
                <input id="Button1" type="submit" value="Reservar" />
                </form>
            </div>
        </div>
        <div style=" width:80%;">
            <div style="width:100%; text-align:justify">
            <br>
            Si no está seguro de que fecha elegir para comer en el restaurant, porque no sabe lo que comerá, L'Appétit le permite consultar los menús disponibles para cada día.
            ¡Consulte el menú y facilite la planificación de su reserva!
            </div>
            <div>
            <br />
                <!--Ojo cambiar el boton-->
                <form id="Form2" method="get" action="ConsultarMenu">
                <input id="Button2" type="submit" value="Consultar Menú"/>
                </form>
            <br />
            </div>
        </div>
    </div>
    <div style="vertical-align: top; display:inline-block; width:49%;">
            <fieldset>
                <legend>Consultar Reservas</legend>
                <% L_Appetit.Models.ConsultarReservaModel modelo = ViewData.Model; %> 
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
                            Número de mesa&nbsp;
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
                    <% foreach (var item in modelo.ListaReservas) { %>
                    <%string horario = "Almuerzo"; %>
                    <tr  style="background-color:white">
                        <td>
                            <%= Html.Encode(item.fecha.ToShortDateString()) %>
                        </td>
                        <td>
                        <%if (item.horario) { horario = "Cena"; }%>
                            <%= Html.Encode(horario) %>
                        </td>
                        <td>
                            <%= Html.Encode(item.mesa) %>
                        </td>
                        <td>
                            <%= Html.Encode(item.comensales) %>
                        </td>
                        <td>
                            <%= Html.Encode(item.observaciones) %>
                        </td>
                        <td>
                            <input id="Checkbox2" type="checkbox" />&nbsp;
                        </td>
                    </tr>
                    <% } %> 
                </table>
                </div>
                <div>
                    <input id="Submit1" type="submit" value="Eliminar" />
                </div>
            </fieldset>
    </div>
</asp:Content>
