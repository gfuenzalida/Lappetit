<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Garzon.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.PedidoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Tomar Pedido
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Garzon/TomarPedido.css" rel="stylesheet" type="text/css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Tomar Pedido
        </div>
    </h2>
<!--<h2>Tomar Pedido</h2>-->
<!------------------------------------------------------>
<div><%: TempData["Resp"] %></div>
<div class="content_tabs">
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab-1" name="tab-group-1" checked>
            <label for="tab-1">Entrada</label>
            <div class="content">
            <% using (Html.BeginForm("TomarPedido", "Garzon", FormMethod.Post, new { @id = "form2" }))
               { %>
               <%: Html.Hidden("id_pedido", Model.id_pedido)%>
                <div style="width:100%;">
                    <div style="vertical-align: middle; display:inline-block;">
                        <%= Html.LabelFor(m => m.selected_item, "Entrada")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block; max-width:62%">
                        <%= Html.DropDownListFor(
                        x => x.selected_item,
                        new SelectList(Model.ListaEntrada, "Value", "Text")
                    )%>
                    </div>
                </div>
                <div style="width:100%; margin-top:5%">
                    <div style="vertical-align: middle; display:inline-block;">
                        <%= Html.LabelFor(m => m.selected_cant, "Cant. Disponible")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.TextBoxFor(
                        x => x.selected_cant,
                        new { @class = "input_cant" }
                    )%>
                    <%: Html.ValidationMessageFor(x => x.selected_cant) %>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <%= Html.LabelFor(m => m.observacion, "Observaciones")%>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <%= Html.TextAreaFor(
                        x => x.observacion,
                        new {@class = "text_obs"}                        
                        )%>
                    </div>
                    <div class="boton_agregar">
                        <input id="Submit1" type="submit" name="btn_submit" value="Agregar" />
                    </div>
                </div>                          
            </div><!---->
        </div>
        <% } %>
        <div class="tab">
            <input type="radio" id="tab-2" name="tab-group-1">
            <label for="tab-2">Plato de Fondo</label>
            <div class="content">
            <% using (Html.BeginForm())
               { %>
               <%: Html.Hidden("id_pedido", Model.id_pedido)%>
                <div style="width:100%">
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.LabelFor(m => m.selected_item, "Plato de Fondo")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block; max-width:44%">
                        <%= Html.DropDownListFor(
                        x => x.selected_item,
                        new SelectList(Model.ListaFondo, "Value", "Text")
                    )%>
                    </div>
                </div>
                <div style="width:100%; margin-top:5%">
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.LabelFor(m => m.selected_cant, "Cant. Disponible")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block; ">
                        <%= Html.TextBoxFor(
                        x => x.selected_cant,
                        new { @class = "input_cant" }
                    )%>
                    <%: Html.ValidationMessageFor(x => x.selected_cant) %>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <%= Html.LabelFor(m => m.observacion, "Observaciones")%>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <%= Html.TextAreaFor(
                        x => x.observacion,
                        new {@class = "text_obs"}                        
                        )%>
                    </div>
                </div>                
                <div class="boton_agregar">
                    <input id="Submit2" type="submit" name="btn_submit" value="Agregar" />
                </div>
            <% } %>
            </div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-3" name="tab-group-1">
            <label for="tab-3">Postre</label>
            <div class="content">
            <% using (Html.BeginForm())
               { %>
               <%: Html.Hidden("id_pedido", Model.id_pedido)%>
                <div style="width:100%">
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.LabelFor(m => m.selected_item, "Postre")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block;max-width: 65%">
                        <%= Html.DropDownListFor(
                        x => x.selected_item,
                        new SelectList(Model.ListaPostre, "Value", "Text")
                    )%>
                    </div>
                </div>
                <div style="width:100%; margin-top:5%">
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.LabelFor(m => m.selected_cant, "Cant. Disponible")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.TextBoxFor(
                        x => x.selected_cant,
                        new {@class = "input_cant"}
                    )%>
                    <%: Html.ValidationMessageFor(x => x.selected_cant) %>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <%= Html.LabelFor(m => m.observacion, "Observaciones")%>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <%= Html.TextAreaFor(
                        x => x.observacion,
                        new {@class = "text_obs"}                        
                        )%>
                    </div>
                </div>
                <div class="boton_agregar">
                        <input id="Submit3" type="submit" name="btn_submit" value="Agregar" />
                </div>
            <% } %>
            </div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-4" name="tab-group-1">
            <label for="tab-4">Bebestibles</label>
            <div class="content">
            <% using (Html.BeginForm())
               { %>
               <%: Html.Hidden("id_pedido", Model.id_pedido)%>
                <div style="width:100%">
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.LabelFor(m => m.selected_item, "Postre")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block;max-width: 65%">
                        <%= Html.DropDownListFor(
                        x => x.selected_item,
                        new SelectList(Model.ListaBebestible, "Value", "Text")
                    )%>
                    </div>
                </div>
                <div style="width:100%; margin-top:5%">
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.LabelFor(m => m.selected_cant, "Cant. Disponible")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.TextBoxFor(
                        x => x.selected_cant,
                        new {@class = "input_cant"}
                    )%>
                    <%: Html.ValidationMessageFor(x => x.selected_cant) %>
                    </div>
                </div>
                <div style="width:100%">
                    <div style="vertical-align: top; display:inline-block; width:15%">
                        <%= Html.LabelFor(m => m.observacion, "Observaciones")%>
                    </div>
                    <div style="vertical-align: top; display:inline-block">
                        <%= Html.TextAreaFor(
                        x => x.observacion,
                        new {@class = "text_obs"}                        
                        )%>
                    </div>
                </div>
                <div class="boton_agregar">
                        <input id="Submit4" type="submit" name="btn_submit" value="Agregar" />
                </div>
            <% } %>
            </div>
        </div>
    </div>
</div>

<div class="content_tabs">
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab-5" name="tab-group-2" checked>
            <label for="tab-5">Pedido Actual</label>
            <div  class= "content" style="overflow: scroll">
                <div style="width:100%; height:90%">
                    <% for (int i = 0; i < Model.ListaPedido.Count; i++ )
                       {%>
                    <div id="<%: Model.ListaPedido[i].cod_item.ToString() %>">
                        <li><%: Model.ListaPedido[i].nom_item%> x [<%: Model.ListaPedido[i].cantidad.ToString() %>]</li>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
    </div>
</div>
<!----------------------------------------------------------------------->

</asp:Content>
