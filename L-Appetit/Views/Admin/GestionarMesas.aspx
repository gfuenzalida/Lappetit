<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Mesas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestionar Mesas</h2>
    <div  ID= "mesas" style="display: inline-block; vertical-align: top">
        <fieldset>
            <legend>Mesas</legend>
            <div>
                <!--div reservado para poner las mesas-->
            </div>
        </fieldset>
    </div>
    <div style="display: inline-block; vertical-align: top; width: 190px">
        <fieldset style="width: 190px">
        <legend>Opciones</legend>
        <div>
            <input id="Button1" type="button" value="Agregar Mesa" />
        </div>
        <div>
            <!--div reservado para el calendario-->
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Horario"></asp:Label>
        </div>
        <div>
            <select id="Select1">
                <option>Almuerzo</option>
                <option>Cena</option>
            </select>
        </div>
        </fieldset>
    </div>


</asp:Content>
