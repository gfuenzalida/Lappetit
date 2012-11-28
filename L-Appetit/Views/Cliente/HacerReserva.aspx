<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cliente.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Hacer Reserva
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Hacer Reserva
        </div>
    </h2>
    <div ID="mesas" style="vertical-align: top; display:inline-block;">
        <fieldset>
            <legend>Mesas</legend>
        </fieldset>
    </div>
    <div style="vertical-align: top; display:inline-block; width: 190px">
        <fieldset style="width: 100%">
            <legend>Seleccionar Fecha</legend>
        </fieldset>
        <div>
            <fieldset style="width: 100%">
            <legend>Seleccionar Horario</legend>
                <select id="Select1">
                    <option>Almuerzo</option>
                    <option>Cena</option>
                </select>
            </fieldset>
        </div>
    </div>

    

</asp:Content>
