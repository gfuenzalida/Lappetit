<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cliente.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.MesasModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reservar
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
<link href="../../jquery-ui-1.9.1.custom/css/smoothness/jquery-ui-1.9.1.custom.css"
        rel="stylesheet" type="text/css" />
    <link href="../../Content/Cliente/HacerReserva.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
     div.ui-datepicker{
        font-size:11px;
    }
     </style>

     <% L_Appetit.Models.MesasModel modelo = ViewData.Model; %>

     <script type="text/javascript">
    <% var serializer = new System.Web.Script.Serialization.JavaScriptSerializer(); %>
    var mesasArray = <%= serializer.Serialize(modelo.lista_mesas) %>;
    </script>

    <script type="text/javascript">
        jQuery(function ($) {
            var i = 0;
            for (i = 0; i < mesasArray.length; i++) {
                
                if (mesasArray[i].id_reserva == 0) {
                    if (mesasArray[i].cant_maxima == 4) {
                        $('#mesas_container').append('<img id="mesa_' + mesasArray[i].id_mesa +
                '" name="' + mesasArray[i].id_mesa + '-' + mesasArray[i].cant_maxima + '" class="item" src="../../img/mesa-4.png" />');
                    }
                    else if (mesasArray[i].cant_maxima == 6) {
                        $('#mesas_container').append('<img id="mesa_' + mesasArray[i].id_mesa +
                    '" name="' + mesasArray[i].id_mesa + '-' + mesasArray[i].cant_maxima + '" class="item" src="../../img/mesa-6.png" />');
                    }
                }
                else {
                    if (mesasArray[i].cant_maxima == 4) {
                        $('#mesas_container').append('<img id="mesa_' + mesasArray[i].id_mesa +
                '" name="' + mesasArray[i].id_mesa + '-' + mesasArray[i].cant_maxima + '" class="item" src="../../img/mesa-4-ocupada.png" />');
                    }
                    else if (mesasArray[i].cant_maxima == 6) {
                        $('#mesas_container').append('<img id="mesa_' + mesasArray[i].id_mesa +
                    '" name="' + mesasArray[i].id_mesa + '-' + mesasArray[i].cant_maxima + '" class="item" src="../../img/mesa-6-ocupada.png" />');
                    }
                }
                $("#mesa_" + mesasArray[i].id_mesa).css({ "position": 'absolute', "left": mesasArray[i].pos_x, "top": mesasArray[i].pos_y });
            }
        });
    </script>

    <script type="text/javascript">
        jQuery(function ($) {
            //all jQuery code which uses $ needs to be inside here
            $(document).ready(function () {
                $("#date-picker").datepicker({
                    showAnim: "fold",
                    beforeShowDay: $.datepicker.noWeekends,
                    dayNames: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sabado"],
                    monthNames: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
                    dayNamesMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
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

        function horario_change() {
            var theForm = document.forms['form1'];
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                document.getElementById("__DATE").value = "<%: ViewBag.Fecha %>";
                theForm.submit();
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Reservar
        </div>
    </h2>
    <div  id= "mesas" class="mesas">
        <fieldset>
            <legend>Mesas</legend>
            <div id="mesas_container" class="mesas_cont">
                <!--div reservado para poner las mesas-->
            </div>
        </fieldset>
    </div>
    <div id="menu_der" class="menu_derecha">
    <% L_Appetit.Models.MesasModel modelo = ViewData.Model; %>

    <% using (Html.BeginForm("HacerReserva", "Cliente", FormMethod.Post, new { @id = "form1" }))
       { %>
        <fieldset style="width: 100%">
            <legend>Seleccionar Fecha</legend>
            <div id="date-picker"></div>
        </fieldset>
        <div>
            <fieldset style="width: 100%">
            <legend>Seleccionar Horario</legend>
                <%: Html.DropDownListFor(
                x => x.horario,
                new SelectList(modelo.Horarios, "Value", "Text"),
                new { @onchange = "horario_change()"}
                )
            %>
            </fieldset>
        </div>
    </div>
    <div id="container">
        <input type="hidden" id="form_op" name="op" />
        <input type="hidden" id="form_mesa_id" name="id_mesa" />
        <input type="hidden" id="form_num_comen" name="num_comen" />
        <input type="hidden" id="form_mesa_max" name="max_mesa" />
        <input type="hidden" id="__DATE" name="__DATE" value="" />
    </div>
    <%} %>
</asp:Content>
