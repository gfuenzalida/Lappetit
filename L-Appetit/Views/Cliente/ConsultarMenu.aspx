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

    <form id="form1" runat="server">

<h2>Consultar Menu</h2>
    <div style="height: 321px">
        <div style="display: inline-block; height: 296px; width: 447px;">
        
        <% L_Appetit.Models.Cliente.MenuModel modelo = ViewData.Model; %>

        <% foreach (string item in modelo.ListaEntrada)
           {%>
              <li><%: Html.Label(item) %></li>
          <% }%>
        </div>
        <div style="display: inline-block; clip: rect(auto, auto, auto, auto); vertical-align: top; width: 210px; height: 310px;">
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        </div>
    </div>
    </form>

</asp:Content>
