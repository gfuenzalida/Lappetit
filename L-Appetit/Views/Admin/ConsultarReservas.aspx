<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Admin/ConsultarReservas.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Reservas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Consultar Reservas
        </div>
    </h2>

<!------------------------------------------------------>
    <div  ID= "mesas" style="display: inline-block; vertical-align: top">
        <fieldset>
            <legend>Mesas</legend>
            <div>
                <!--div reservado para poner las mesas-->
            </div>
        </fieldset>
    </div>
    <div style="display: inline-block; vertical-align: top; width: 190px">
        <div>
            <fieldset>
                <legend>Busqueda</legend>
                <div  ID= "busqueda" class="tabs">
                    <div class="tab">
                        <input type="radio" id="tab-1" name="tab-group-1" checked>
                        <label for="tab-1">Nombre</label>
                        <div class="content">
                            <div>
                                <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
                            </div>
                            <div>
                                <input class="IngBusqueda" id="Text1" type="text" />
                            </div>
                            <div>
                                <input id="Button1" type="button" value="Buscar" />
                            </div>
                        </div>
                    </div>
                    <div class="tab">
                        <input type="radio" id="tab-2" name="tab-group-1">
                        <label for="tab-2">RUN</label>
                        <div class="content">
                            <div>
                                <asp:Label ID="Label2" runat="server" Text="RUN"></asp:Label>
                            </div>
                            <div>
                                <input class="IngBusqueda" id="Text2" type="text" />
                            </div>
                            <div>
                                <input id="Button2" type="button" value="Buscar" />
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
<!----------------------------------------------------------------------->

</asp:Content>
