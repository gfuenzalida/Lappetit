<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.MenuModel>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Menu
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Cliente/ConsultarMenu.css" rel="stylesheet" type="text/css" />
    <link href="../../jquery-ui-1.9.1.custom/css/smoothness/jquery-ui-1.9.1.custom.css"
        rel="stylesheet" type="text/css" />
     <style type="text/css">
     div.ui-datepicker{
        font-size:11px;
    }
     </style>
  <% L_Appetit.Models.MenuModel modelo = ViewData.Model; %> 
    <script type="text/javascript">
        jQuery(function ($) {
            //all jQuery code which uses $ needs to be inside here
            $(document).ready(function () {
                $("#date-picker").datepicker({
                    showAnim: "fold",
                    beforeShowDay: $.datepicker.noWeekends,
                    dayNames: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sabado"],
                    monthNames: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
                    dayNamesMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
                    monthNamesShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
                    dateFormat: "dd-mm-yy",
                    onSelect: function (dateText, inst) {
                        var theForm = document.forms['form1'];
                        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                            document.getElementById("__DATE").value = dateText;
                            theForm.submit();
                        }
                    }
                })
                $("#date-picker").datepicker("setDate", '<%: ViewBag.Fecha %>');
                $("#date-picker").datepicker("option", "changeMonth", true);
                $("#date-picker").datepicker("option", "changeYear", true);
            });
        });

        function horario_change() {
            var theForm = document.forms['form1'];
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                document.getElementById("__DATE").value = "<%: ViewBag.Fecha %>";
                theForm.submit();
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
   
 <form id="form1" method="post" runat="server">
    <input type="hidden" name="__DATE" id="__DATE" value="" />

<% L_Appetit.Models.MenuModel modelo = ViewData.Model; %> 
    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Consultar Menu
        </div>
    </h2>
<!--<h1>Consultar Menu</h1>-->
    <div class= "supercontenedor">
        <div class= "contenedormenu">
            <div class= "subcontenedormenu">
            <h5>Entrada</h5>
                <div style= "padding-left: 10px;">
                <% foreach (string item1 in modelo.ListaEntrada)
                    {%>
                        <li><%: Html.Label(item1) %></li>
                <% }%>
                </div>
            </div>
            <div class= "subcontenedormenu">
            <h5>Plato de Fondo</h5>
                <div style= "padding-left: 10px;">
                <% foreach (string item2 in modelo.ListaFondo)
                    {%>
                        <li><%: Html.Label(item2) %></li>
                <% }%>
                </div>
            </div>
        </div>
        <div class= "contenedormenu">
            
            <div class= "subcontenedormenu">
            <h5>Postre</h5>
                <div style= "padding-left: 10px;">
                <% foreach (string item3 in modelo.ListaPostre)
                    {%>
                        <li><%: Html.Label(item3) %></li>
                <% }%>
                </div>
            </div>

         </div>
         <div class= "contenedormenu">
            <h5>Bebestible</h5>
                <div style= "padding-left: 10px;">
                <% foreach (string item4 in modelo.ListaBebestible)
                    {%>
                        <li><%: Html.Label(item4) %></li>
                <% }%>
                </div>
         </div> 
        
    </div>
    <div style="display: inline-block; clip: rect(auto, auto, auto, auto); vertical-align: top;">
        <fieldset>
            <legend>Fecha</legend>
            <div id="date-picker"></div>
            <legend>Horario</legend>
            <%: Html.DropDownListFor(
            x => x.horario,
            new SelectList(modelo.Horarios, "Value", "Text"),
            new { @onchange = "horario_change()"}
            )
            %>
        </fielset>
    </div>

    </form>
</asp:Content>
