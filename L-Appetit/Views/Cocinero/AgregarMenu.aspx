<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.AgregarMenuModel>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Cocinero/AgregarMenu.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
     div.ui-datepicker{
        font-size:11px;
    }
     </style>
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
                    monthNamesShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
                    dateFormat: "dd-mm-yy",
                    onSelect: function (dateText, inst) {
                        var theForm = document.forms['form1'];
                        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                            document.getElementById("__DATE").value = dateText;
                            theForm.submit();
                        }
                    }
                })
                $("#date-picker").datepicker("setDate", '<%: ViewBag.Fecha %>');
                $("#date-picker").datepicker("option", "changeMonth", true);
                $("#date-picker").datepicker("option", "changeYear", true);
            });
        });

        function horario_change(){
            var theForm = document.forms['form1'];
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                document.getElementById("__DATE").value = "<% Response.Write(ViewBag.Fecha); %>";
                theForm.submit();
            }
        }

        function agregar_item(form) {
            //var theForm = 
        }
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Agregar Menu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<% L_Appetit.Models.AgregarMenuModel modelo = ViewData.Model; %> 
    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Agregar Menu
        </div>
    </h2>

<!--<h2>AgregarMenu</h2>-->

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
               <input type="hidden" name="__DATE" id="Hidden1" value="<%: ViewBag.Fecha %>" />
               <input type="hidden" name="__HORARIO" id="Hidden4" value="<%: ViewBag.Horario %>" />
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
                    </div>
                    <div class="boton_agregar">
                        <input id="Submit1" type="submit" name="btn_submit" value="Agregar" />
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
               <input type="hidden" name="__DATE" id="Hidden2" value="<%: ViewBag.Fecha %>" />
               <input type="hidden" name="__HORARIO" id="Hidden5" value="<%: ViewBag.Horario %>" />
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
                    </div>
                    <div class="boton_agregar">
                        <input id="Submit2" type="submit" name="btn_submit" value="Agregar" />
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
               <input type="hidden" name="__DATE" id="Hidden3" value="<%: ViewBag.Fecha %>" />
               <input type="hidden" name="__HORARIO" id="Hidden6" value="<%: ViewBag.Horario %>" />
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
                    </div>
                    <div class="boton_agregar">
                        <input id="Submit3" type="submit" name="btn_submit" value="Agregar" />
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
            <div class="content" style="overflow: scroll">
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
    <form id="form1" method="post" runat="server">
        <input type="hidden" name="__DATE" id="__DATE" value="" />
    <% L_Appetit.Models.AgregarMenuModel modelo = ViewData.Model; %> 
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
        </form>
    </div>


</asp:Content>
