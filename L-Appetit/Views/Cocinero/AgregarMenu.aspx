<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.AgregarMenuModel>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Cocinero/AgregarMenu.css" rel="stylesheet" type="text/css" />
    <link href="../../jquery-ui-1.9.1.custom/css/smoothness/jquery-ui-1.9.1.custom.css"
        rel="stylesheet" type="text/css" />
    <script src="../../jquery-ui-1.9.1.custom/js/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="../../jquery-ui-1.9.1.custom/js/jquery-ui-1.9.1.custom.js" type="text/javascript"></script>
    <script src="../../jquery-ui-1.9.1.custom/js/jquery-ui-1.9.1.custom.min.js" type="text/javascript"></script>
    
    <% L_Appetit.Models.AgregarMenuModel modelo = ViewData.Model; %> 
    
    <script type="text/javascript">
        jQuery(function ($) {
            //all jQuery code which uses $ needs to be inside here
            $(document).ready(function () {
                $("#date-picker").datepicker({
                    showAnim: "fold",
                    beforeShowDay: $.datepicker.noWeekends,
                    dayNames: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sabado"],
                    monthNames: ["Enero","Febrero", "Marzo", "Abril", "Mayo", "Junio",
                    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
                    dayNamesMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
                    dateFormat: "dd-mm-yy",
                    onSelect: function (dateText, inst) {
                        var theForm = document.forms['form1'];
                        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                            document.getElementById("__DATE").value = dateText;
                            theForm.submit();
                        }
                    }
                }).datepicker("setDate", '<%: ViewBag.Fecha %>');
            });
        });

        function horario_change(){
            var theForm = document.forms['form1'];
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                document.getElementById("__DATE").value = "<%: ViewBag.Fecha %>";
                theForm.submit();
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AgregarMenu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<form id="form1" method="post" runat="server">
    <input type="hidden" name="__DATE" id="__DATE" value="" />
</form>
<% L_Appetit.Models.AgregarMenuModel modelo = ViewData.Model; %> 

<h2>AgregarMenu</h2>

<!------------------------------------------------------>
<div style="vertical-align: top; display:inline-block;margin-left:10%">
    <fieldset style="100%">
    <legend>Tipo Platos</legend>
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab-1" name="tab-group-1" checked>
            <label for="tab-1">Entrada</label>
            <div class="content">
            <% using (Html.BeginForm("AgregarMenu", "Cocinero", FormMethod.Post, new { @id = "form2" }))
               { %>
                <div style="width:100%">
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.LabelFor(m => m.selected_entrada, "Entrada")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.DropDownListFor(
                        x => x.selected_entrada,
                        new SelectList(Model.ListaEntrada, "Value", "Text")
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
                        new { @class = "input_cant" }
                    )%>
                    </div>
                    <div class="boton_agregar">
                        <input id="Submit1" type="submit" value="Agregar" />
                    </div>
                </div>
            <% } %>
            </div><!---->
        </div>
        <div class="tab">
            <input type="radio" id="tab-2" name="tab-group-1">
            <label for="tab-2">Plato de Fondo</label>
            <div class="content">
            <% using (Html.BeginForm())
               { %>
                <div style="width:100%">
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.LabelFor(m => m.selected_fondo, "Plato de Fondo")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.DropDownListFor(
                        x => x.selected_fondo,
                        new SelectList(Model.ListaFondo, "Value", "Text")
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
                        new { @class = "input_cant" }
                    )%>
                    </div>
                    <div class="boton_agregar">
                        <input id="Submit2" type="submit" value="Agregar" />
                    </div>
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
                <div style="width:100%">
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.LabelFor(m => m.selected_postre, "Postre")%>
                    </div>
                    <div style="vertical-align: middle; display:inline-block">
                        <%= Html.DropDownListFor(
                        x => x.selected_postre,
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
                    </div>
                    <div class="boton_agregar">
                        <input id="Submit3" type="submit" value="Agregar" />
                    </div>
                </div>
            <% } %>
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
                    <% for (int i = 0; i < modelo.ListaMenu.Count; i++ )
                       {%>
                    <div id="<%: modelo.ListaMenu[i].Value %>">
                        <li><%: modelo.ListaMenu[i].Text%> x [<%: modelo.cantidades[i].ToString()%>]</li>
                    </div>
                    <% }%>
                </div>
            </div>
         </div>
     </div>
     </fieldset>
</div>
<div style="display: inline-block; clip: rect(auto, auto, auto, auto); vertical-align: top; margin-left: 7%">
    <fieldset style="width:100%">
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

</asp:Content>
