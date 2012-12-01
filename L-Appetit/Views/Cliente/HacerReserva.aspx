<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cliente.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.MesasModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reservar
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Cliente/HacerReserva.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
     div.ui-datepicker{
        font-size:11px;
    }
     </style>

     <% L_Appetit.Models.MesasModel modelo = ViewData.Model; %>

     <!-- Obtener Array de Mesas -->
     <script type="text/javascript">
    <% var serializer = new System.Web.Script.Serialization.JavaScriptSerializer(); %>
    var mesasArray = <%= serializer.Serialize(modelo.lista_mesas) %>;
    </script>

    <!-- Disponer Mesas en contenedor -->
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
                $("#mesa_" + mesasArray[i].id_mesa).css({ "cursor": 'pointer', "position": 'absolute', "left": mesasArray[i].pos_x, "top": mesasArray[i].pos_y });
                $("#mesa_" + mesasArray[i].id_mesa).bind("click", function () {
                    $("#form_mesa_id").val(($(this).attr('id')).split('_')[1]);                            
                
                });
            }
        });
    </script>

    <!-- Desplegar calendario en fecha correspondiente -->
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

        // Al cambiar de horario
        function horario_change() {
            var theForm = document.forms['form1'];
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                document.getElementById("__DATE").value = "<%: ViewBag.Fecha %>";
                theForm.submit();
            }
        }

        // Al clickear mesa
        function open_dialog(id) {
            $("#form_mesa_id").val(id);
        }
    </script>

    <script type="text/javascript">
        var triggers = $(".item").overlay({

            // some mask tweaks suitable for modal dialogs
            mask: {
                color: '#ebecff',
                loadSpeed: 200,
                opacity: 0.9
            },

            closeOnClick: false
        });

        $("#prompt form").submit(function (e) {
            // close the overlay
            triggers.eq(1).overlay().close();

            $('#')
        });
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
    <div id="prompt" class="modal">
        <h2>Mesa: <label id="clicked_mesa"></label></h2>
        <div>Numero de comensales: <select id="num_comen_select" name="num_comen">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select></div>
        <div>Observación: <textarea id="text_obs" cols="5" rows="3" name="obs"></textarea></div>
        <button type="submit"> OK </button>
        <button type="button" class="close"> Cancel </button>
    </div>
    <div id="container">
        <input type="hidden" id="form_op" name="op" />
        <input type="hidden" id="form_mesa_id" name="id_mesa" />
        <!--<input type="hidden" id="form_num_comen" name="num_comen" />-->
        <!--<input type="hidden" id="form_obs" name="obs" />-->
        <input type="hidden" id="__DATE" name="__DATE" value="" />
    </div>
    
    <%} %>
</asp:Content>
