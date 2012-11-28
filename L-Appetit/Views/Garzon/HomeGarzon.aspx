<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Garzon.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Tomar Pedido
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Tomar Pedido</h2>
<!------------------------------------------------------>
<div style="vertical-align: top; display:inline-block; margin-left:20%">
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab-1" name="tab-group-1" checked>
            <label for="tab-1">Entrada</label>
            <div class="content">
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label1" runat="server" Text="Opcion"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <select id="Select1">
                            <option>Entrada 1</option> <!--opcion ejemplo-->
                        </select>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label2" runat="server" Text="Cantidad"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <select id="Select2">
                            <option>2</option> <!--Cantidad ejemplo, ver limitacion de platos por mesa-->
                        </select>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label3" runat="server" Text="Observacion"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <input id="Text1" type="text" />
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block">
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <input id="Button1" type="button" value="Agregar" />
                    </div>
                    
                </div>
            </div><!----->
        </div>
        <div class="tab">
            <input type="radio" id="tab-2" name="tab-group-1">
            <label for="tab-2">Plato de Fondo</label>
            <div class="content">
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label4" runat="server" Text="Opcion"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <select id="Select3">
                            <option>Fondo 1</option> <!--opcion ejemplo-->
                        </select>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label5" runat="server" Text="Cantidad"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <select id="Select4">
                            <option>2</option> <!--Cantidad ejemplo, ver limitacion de platos por mesa-->
                        </select>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label6" runat="server" Text="Observacion"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <input id="Text2" type="text" />
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block">
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <input id="Button2" type="button" value="Agregar" />
                    </div>
                    
                </div>
            </div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-3" name="tab-group-1">
            <label for="tab-3">Postre</label>
            <div class="content">
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label10" runat="server" Text="Opcion"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <select id="Select7">
                            <option>Postre 1</option> <!--opcion ejemplo-->
                        </select>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label11" runat="server" Text="Cantidad"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <select id="Select8">
                            <option>2</option> <!--Cantidad ejemplo, ver limitacion de platos por mesa-->
                        </select>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label12" runat="server" Text="Observacion"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <input id="Text4" type="text" />
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block">
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <input id="Button4" type="button" value="Agregar" />
                    </div>
                    
                </div>
            </div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-4" name="tab-group-1">
            <label for="tab-4">Bebestibles</label>
            <div class="content">
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label7" runat="server" Text="Opcion"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <select id="Select5">
                            <option>Bebestible 1</option> <!--opcion ejemplo-->
                        </select>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label8" runat="server" Text="Cantidad"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <select id="Select6">
                            <option>2</option> <!--Cantidad ejemplo, ver limitacion de platos por mesa-->
                        </select>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <asp:Label ID="Label9" runat="server" Text="Observacion"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <input id="Text3" type="text" />
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block">
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <input id="Button3" type="button" value="Agregar" />
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>

<div style="vertical-align: top; display:inline-block; margin-left:20%">
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab-5" name="tab-group-2" checked>
            <label for="tab-5">Pedido Actual</label>
            <div  class= "content">
                <div style=" text-aling: center; width:100%">
                    <!-- area para mostrar el pedido actual-->
                </div>
            </div>
        </div>
    </div>

</div>
<!----------------------------------------------------------------------->

</asp:Content>
