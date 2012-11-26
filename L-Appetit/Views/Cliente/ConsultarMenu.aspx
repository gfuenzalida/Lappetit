<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cliente.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.Cliente.MenuModel>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Menu
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../jquery-ui-1.9.1.custom/css/smoothness/jquery-ui-1.9.1.custom.css"
        rel="stylesheet" type="text/css" />
    <link href="../../Content/Cliente/ConsultarMenu.css" rel="stylesheet" type="text/css" />
    <script src="../../jquery-ui-1.9.1.custom/js/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="../../jquery-ui-1.9.1.custom/js/jquery-ui-1.9.1.custom.js" type="text/javascript"></script>
    <script src="../../jquery-ui-1.9.1.custom/js/jquery-ui-1.9.1.custom.min.js" type="text/javascript"></script>
  
  <% L_Appetit.Models.Cliente.MenuModel modelo = ViewData.Model; %> 
    <script type="text/javascript">
        jQuery(function ($) {
            //all jQuery code which uses $ needs to be inside here
            $(document).ready(function () {
                $("#date-picker").datepicker({
                    showAnim: "fold",
                    beforeShowDay: $.datepicker.noWeekends,
                    dayNames: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sabado"],
                    monthNames: ["Enero","Febrero", "Marzo", "Abril", "Mayo", "Junio",
                    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
                    dayNamesMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
                    dateFormat: "dd/mm/yy",
                    onSelect: function (dateText, inst) {
                        var theForm = document.forms['form1'];
                        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                            document.getElementById("__DATE").value = dateText;
                            theForm.submit();
                        }
                    }
                }).datepicker("setDate", <% Response.Write(ViewBag.Fecha); %>);
            });
        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
   
 <form id="form1" method="post" runat="server">
    <input type="hidden" name="__DATE" id="__DATE" value="" />

<% L_Appetit.Models.Cliente.MenuModel modelo = ViewData.Model; %> 
<h1>Consultar Menu</h1>
    <div class= "supercontenedor">
        <div class= "contenedormenu">
            <div class= "subcontenedormenu">
            <h5>Entrada</h5>
            <% foreach (string item1 in modelo.ListaEntrada)
                {%>
                    <li style="font-family: 'Palatino Linotype'"><%: Html.Label(item1) %></li>
            <% }%>
            </div>
            <div class= "subcontenedormenu">
            <h5>Plato de Fondo</h5>
            <% foreach (string item2 in modelo.ListaFondo)
                {%>
                    <li><%: Html.Label(item2) %></li>
            <% }%>
            </div>
        </div>
        <div class= "contenedormenu">
            
            <div class= "subcontenedormenu">
            <h5>Postre</h5>
            <% foreach (string item3 in modelo.ListaPostre)
                {%>
                    <li><%: Html.Label(item3) %></li>
            <% }%>
            </div>

         </div>
         <div class= "contenedormenu">
            <h5>Bebestible</h5>
            <% foreach (string item4 in modelo.ListaBebestible)
                {%>
                    <li><%: Html.Label(item4) %></li>
            <% }%>
         </div> 
        
    </div>
    <div style="display: inline-block; clip: rect(auto, auto, auto, auto); vertical-align: top; width: 210px; height: 310px;">
        <div id="date-picker"></div>
    </div>

    </form>
</asp:Content>
