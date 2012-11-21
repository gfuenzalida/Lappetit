<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/GarzonSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Tomar Pedido
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Tomar Pedido</h2>
<!------------------------------------------------------>
<div style="vertical-align: top; display:inline-block">
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab-1" name="tab-group-1" checked>
            <label for="tab-1">Entrada</label>
            <div class="content"> el contenido de la pestaña 1 </div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-2" name="tab-group-1">
            <label for="tab-2">Plato de Fondo</label>
            <div class="content">el contenido de la pestaña 2</div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-3" name="tab-group-1">
            <label for="tab-3">Bebestible</label>
            <div class="content">el contenido de la pestaña 3</div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-4" name="tab-group-1">
            <label for="tab-4">Postre</label>
            <div class="content">el contenido de la pestaña 4</div>
        </div>
    </div>
</div>
<div style="vertical-align: top; display:inline-block">
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab-5" name="tab-group-1">
            <label for="tab-5">Pedido Actual</label>
            <div class="content"> el contenido de la pestaña 5 </div>
        </div>
    </div>

</div>
<!----------------------------------------------------------------------->

</asp:Content>
