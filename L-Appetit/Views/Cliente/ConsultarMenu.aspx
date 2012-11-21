<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ClienteSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Menu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">

<h2>Consultar Menu</h2>
    <div style="height: 321px">
        <div style="display: inline-block; height: 296px; width: 447px;">
        </div>
        <div style="display: inline-block; clip: rect(auto, auto, auto, auto); vertical-align: top; width: 210px; height: 310px;">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                BorderColor="#3366CC" CellPadding="1" DayNameFormat="Shortest" 
                Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" 
                Width="220px" BorderWidth="1px">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" Font-Bold="True" 
                    BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
        </div>
    </div>
    </form>

</asp:Content>
