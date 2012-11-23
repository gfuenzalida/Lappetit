<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Cocinero/AgregarMenu.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AgregarMenu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>AgregarMenu</h2>

<!------------------------------------------------------>
<div style="width:50%">
    <fieldset style="100%">
    <legend>Tipo Platos</legend>
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab-1" name="tab-group-1" checked>
            <label for="tab-1">Entrada</label>
            <div class="content">
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block;width:25%">
                        <asp:Label ID="Label1" runat="server" Text="Seleccione Entrada"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block;">
                        <select id="Select1">
                            <option>Entrada 1</option>
                        </select>
                    </div>
                </div>
                <div style="width:100%; margin-top:5%">
                    <div style="vertical-align: top; display:inline-block; width:25%">
                        <asp:Label ID="Label2" runat="server" Text="Cant. Disponible"></asp:Label>
                    </div>
                    <div  style="vertical-align: top; display:inline-block;width:15%">
                        <select id="Select2">
                            <option>8</option>
                        </select>
                    </div>
                    <div>
                        <input id="Submit1" type="submit" value="Agregar" />
                    </div>
                </div>
            </div><!---->
        </div>
        <div class="tab">
            <input type="radio" id="tab-2" name="tab-group-1">
            <label for="tab-2">Plato de Fondo</label>
            <div class="content">
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block;width:25%">
                        <asp:Label ID="Label3" runat="server" Text="Seleccione Entrada"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block;">
                        <select id="Select3">
                            <option>Plato de Fondo 1</option>
                        </select>
                    </div>
                </div>
                <div style="width:100%; margin-top:5%">
                    <div style="vertical-align: top; display:inline-block; width:25%">
                        <asp:Label ID="Label4" runat="server" Text="Cant. Disponible"></asp:Label>
                    </div>
                    <div  style="vertical-align: top; display:inline-block;width:15%">
                        <select id="Select4">
                            <option>8</option>
                        </select>
                    </div>
                    <div>
                        <input id="Submit2" type="submit" value="Agregar" />
                    </div>
                </div>
            </div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-3" name="tab-group-1">
            <label for="tab-3">Postre</label>
            <div class="content">
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block;width:25%">
                        <asp:Label ID="Label5" runat="server" Text="Seleccione Entrada"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block;">
                        <select id="Select5">
                            <option>Postre 1</option>
                        </select>
                    </div>
                </div>
                <div style="width:100%; margin-top:5%">
                    <div style="vertical-align: top; display:inline-block; width:25%">
                        <asp:Label ID="Label6" runat="server" Text="Cant. Disponible"></asp:Label>
                    </div>
                    <div  style="vertical-align: top; display:inline-block;width:15%">
                        <select id="Select6">
                            <option>8</option>
                        </select>
                    </div>
                    <div>
                        <input id="Submit3" type="submit" value="Agregar" />
                    </div>
                </div>
            </div>
            </div>
        <div class="tab">
            <input type="radio" id="tab-4" name="tab-group-1">
            <label for="tab-4">Bebestible</label>
            <div class="content">
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block;width:25%">
                        <asp:Label ID="Label7" runat="server" Text="Seleccione Entrada"></asp:Label>
                    </div>
                    <div style="vertical-align: top; display:inline-block;">
                        <select id="Select7">
                            <option>Bebestible 1</option>
                        </select>
                    </div>
                </div>
                <div style="width:100%; margin-top:5%">
                    <div style="vertical-align: top; display:inline-block; width:25%">
                        <asp:Label ID="Label8" runat="server" Text="Cant. Disponible"></asp:Label>
                    </div>
                    <div  style="vertical-align: top; display:inline-block;width:15%">
                        <select id="Select8">
                            <option>8</option>
                        </select>
                    </div>
                    <div>
                        <input id="Submit4" type="submit" value="Agregar" />
                    </div>
                </div>
            </div>
            </div>
    </div>
        <br>
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab5" name="tab-group-2" checked>
            <label for="tab-5">Menu Actual</label>
            <div class="content">
                <div style="width:100%; heigth:90%">
                    <textarea id="TextArea1" disabled= "disabled" style="min-width: 100%;max-width: 100%; min-height: 100%; max-height: 100%;"></textarea>
                </div>
                <div>
                    <input id="Button1" type="button" value="Confirmar" />
                </div>
            </div>
         </div>
     </div>
     </fieldset>
</div>

</asp:Content>
