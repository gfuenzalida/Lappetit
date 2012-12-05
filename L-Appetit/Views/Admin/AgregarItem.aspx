<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.AgregarItemModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Agregar Item
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<% L_Appetit.Models.AgregarItemModel modelo = ViewData.Model; %> 

<script type="text/javascript">
<% if (ViewBag.Error != null && ViewBag.Error == true){ %>
    jQuery(function ($) {
            //all jQuery code which uses $ needs to be inside here
            $(document).ready(function () {
                var alert_text = 'No ha sido posible crear el ítem. Revise los errores';
                aler(alert_text);
                });
            });
<%} %>
</script>
    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Agregar Item
        </div>
    </h2>
<!--<h2>AgregarItem</h2>-->
<%: Html.ValidationSummary(true, "No ha sido posible crear el ítem. Revise los errores")%>
    <li><%: Html.ValidationMessageFor(m => m.nombre_item) %></li>
<!------------------------------------------------------>

<div class="tabs">
   <div class="tab">
       <input type="radio" id="tab-1" name="tab-group-1" checked>
       <label for="tab-1">Datos del Item</label>
       <div class="content"> 
       <% using (Html.BeginForm())
            { %>
            <div style="width:100%" >
                <div style="vertical-align: top; display:inline-block; width: 50%;">
                    <div style="margin-bottom: 3px;">
                        <%= Html.LabelFor(m => m.tipo_item, "Tipo de ítem")%>
                    </div>
                    <div>
                        <%= Html.DropDownListFor(
                        x => x.tipo_item,
                        new SelectList(Model.Tipos, "Value", "Text")
                    )%>
                    </div>
                </div>
                <div style="vertical-align: top; display:inline-block; width: 40%">
                    <div style="margin-bottom: 3px;">
                        <%= Html.LabelFor(m => m.nombre_item, "Nombre")%>
                    </div>
                    <div>
                        <%= Html.TextBoxFor(
                        m => m.nombre_item
                    )%>
                    </div>
                </div>
            </div>
            
            <div style="width:100%">
                <div style="vertical-align: top; display:inline-block; width: 50% ">
                    <div style="margin-bottom:3px; margin-top: 3px">
                        <%= Html.LabelFor(m => m.descripcion_item, "Descripcion")%>
                    </div>
                    <div>
                        <%= Html.TextBoxFor(
                        m => m.descripcion_item
                    )%>
                    </div>
                </div>
                <div style=" width: 40%">
                    <input id="Submit1" type="submit" value="Ingresar" />
                </div>
            </div>
        <% } %>
        </div>
   </div>
   <div class="tab">
       <input type="radio" id="tab-2" name="tab-group-1">
       <label for="tab-2">Consultar Item</label>
       <div class="content">
             <div style="vertical-align: top; display:inline-block">
                <div>
                    <asp:Label ID="Label4" runat="server" Text="Tipo de Item"></asp:Label>
                </div>
                <div>
                    <select id="Select2">
                        <option>Fondo</option>
                    </select>
                </div>
             </div>
             <div style="vertical-align: top; display:inline-block">
                <div>
                    <asp:Label ID="Label5" runat="server" Text="Nombre del Item"></asp:Label>
                </div>
                <div>
                    <select id="Select3">
                        <option>Papas Duquesas</option> <!---solo como ejemplo para ver la vista--->
                    </select>
                </div>
             </div>
             <div>
                <div style="margin-top:3%">
                    <asp:Label ID="Label6" runat="server" Text="Descripcion del Item:"></asp:Label>
                </div>
                <div>
                    <!--div para la salida de texto-->
                </div>
             </div>
             <div style="width:100%">
                <div style="margin-top:3%; width:100%" >
                    <input id="Button1" type="button" value="Eliminar" />
                </div>
             </div>
       </div>
   </div>
</div>
<!----------------------------------------------------------------------->

</asp:Content>
