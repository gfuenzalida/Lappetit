<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cliente.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.Cliente.MenuModel>" %>

<script runat="server">

    protected void Calendar1_SelectionChanged(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date.ToString("d") == DateTime.Now.ToString("d"))
        {
            e.Cell.BackColor = System.Drawing.Color.Red;
        }
            
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Menu
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../jquery-ui-1.9.1.custom/css/smoothness/jquery-ui-1.9.1.custom.css"
        rel="stylesheet" type="text/css" />
    <script src="../../jquery-ui-1.9.1.custom/js/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="../../jquery-ui-1.9.1.custom/js/jquery-ui-1.9.1.custom.js" type="text/javascript"></script>
    <script src="../../jquery-ui-1.9.1.custom/js/jquery-ui-1.9.1.custom.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        jQuery(function ($) {
            //all jQuery code which uses $ needs to be inside here
            $(document).ready(function () {
                $("#datepicker").datepicker({
                    showAnim: "fold",
                    beforeShowDay: $.datepicker.noWeekends,
                    dayNames: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sabado"],
                    dayNamesMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
                    onSelect: function (dateText, inst) {
                        alert(dateText)
                    }
                });
            });

            $(document)
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <% L_Appetit.Models.Cliente.MenuModel modelo = ViewData.Model; %>
<h1>Consultar Menu</h1>
    <div style="height: 321px; width: 70%; display: inline-block;">
        <div style="display: inline-block; width: 218px;">
            <div>
            <h2>Entrada</h2>
            <% foreach (string item1 in modelo.ListaEntrada)
                {%>
                    <li><%: Html.Label(item1) %></li>
            <% }%>
            </div>
            <div>
            <h2>Plato de Fondo</h2>
            <% foreach (string item2 in modelo.ListaFondo)
                {%>
                    <li><%: Html.Label(item2) %></li>
            <% }%>
            </div>
        </div>
        <div style="display: inline-block; vertical-align: top; width: 218px;">
            <div>
            <h2>Postre</h2>
            <% foreach (string item3 in modelo.ListaPostre)
                {%>
                    <li><%: Html.Label(item3) %></li>
            <% }%>
            </div>
         </div>
         <div style="display: inline-block; vertical-align: top; width: 218px;">
            <h2>Bebestible</h2>
            <% foreach (string item4 in modelo.ListaBebestible)
                {%>
                    <li><%: Html.Label(item4) %></li>
            <% }%>
         </div> 
        
    </div>
    <div style="display: inline-block; clip: rect(auto, auto, auto, auto); vertical-align: top; width: 210px; height: 310px;">
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    </div>

    <div id="datepicker"></div>

    </form>
</asp:Content>
