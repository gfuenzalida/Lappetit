<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Garzon.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Reserva
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Consultar Reserva</h2>
    <div  ID="mesas" style="vertical-align: top; display:inline-block;">
        <fieldset>
            <legend>Mesas</legend>
        </fieldset>
    </div>
    <div style="vertical-align: top; display:inline-block; width: 190px">
        <div style="width: 190px">
            <fieldset >
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
        <div >
            <fieldset style="width: 190px">
                <legend>Seleccionar Fecha</legend>
                <div>
                   
                    
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
