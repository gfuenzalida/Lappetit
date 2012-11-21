<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AgregarMenu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>AgregarMenu</h2>

<!------------------------------------------------------>
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
       <label for="tab-3">Postre</label>
       <div class="content">el contenido de la pestaña 3</div>
   </div>
   <div class="tab">
       <input type="radio" id="tab-4" name="tab-group-1">
       <label for="tab-4">Bebestible</label>
       <div class="content">el contenido de la pestaña 4</div>
   </div>
</div>
<br>
<div class="tabs">
   <div class="tab">
       <input type="radio" id="tab5" name="tab-group-1">
       <label for="tab-5">Menu Actual</label>
       <div class="content"> el contenido de la pestaña 1 </div>
   </div>
</div>

</asp:Content>
