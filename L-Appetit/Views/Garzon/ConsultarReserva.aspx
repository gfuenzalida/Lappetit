<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Garzon.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Reserva
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Consultar Reserva</h2>
    <div style="vertical-align: top; display:inline-block; width:64%">
        <fieldset>
            <legend>Mesas</legend>
        </fieldset>
    </div>
    <div style="vertical-align: top; display:inline-block;width: 33%; margin-left: 2%">
        <div>
            <fieldset>
                <legend>Buscar Mesa</legend>
                <div style="height: 33%; margin-top: 7%">
                    <input id="Text1" type="text" />
                </div>
                <div style="height: 33%;">
                    <input id="Button1" type="button" value="Buscar" />
                </div>
                <div style="height: 33%">
                    <asp:Label ID="Label1" runat="server" Text="Mesa:"></asp:Label>
                </div>
            </fieldset>
        </div>
        <div>
            <fieldset>
                <legend>Seleccionar Fecha</legend>
                <div>
                    <asp:Label ID="Label2" runat="server" Text="Seleccione Horario"></asp:Label>
                </div>
                <div>
                    <select id="Select1">
                        <option>Almuerzo</option>
                        <option>Cena</option>
                    </select>
                </div>
                <div>
                    <!-- div reservado para el calendario-->
                </div>
            </fieldset>
        </div>
    </div>

</asp:Content>
