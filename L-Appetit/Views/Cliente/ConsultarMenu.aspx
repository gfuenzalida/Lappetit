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

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server" enableviewstate="True">
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

    </form>
</asp:Content>
