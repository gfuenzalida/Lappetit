<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Garzon.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.MesasModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consultar Reserva
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Garzon/ConsultarReserva.css" rel="stylesheet" type="text/css" />
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

                if (mesasArray[i].cant_maxima == 4) {
                    $('#mesas_container').append('<img id="mesa_' + mesasArray[i].id_mesa +
            '" name="' + mesasArray[i].id_mesa + '-' + mesasArray[i].cant_maxima + '" class="item" src="../../img/mesa-4.png" />');
                }
                else if (mesasArray[i].cant_maxima == 6) {
                    $('#mesas_container').append('<img id="mesa_' + mesasArray[i].id_mesa +
                '" name="' + mesasArray[i].id_mesa + '-' + mesasArray[i].cant_maxima + '" class="item" src="../../img/mesa-6.png" />');
                }

                $("#mesa_" + mesasArray[i].id_mesa).css({ "cursor": 'pointer', "position": 'absolute', "left": mesasArray[i].pos_x, "top": mesasArray[i].pos_y });
                $("#mesa_" + mesasArray[i].id_mesa).data("id_mesa",mesasArray[i].id_mesa);
                $("#mesa_" + mesasArray[i].id_mesa).data("id_reserva",mesasArray[i].id_reserva);
                $("#mesa_" + mesasArray[i].id_mesa).data("cant_maxima",mesasArray[i].cant_maxima);
                $("#mesa_" + mesasArray[i].id_mesa).data("num_comensales",mesasArray[i].num_comensales);
                $("#mesa_" + mesasArray[i].id_mesa).data("cliente",mesasArray[i].nombre_cliente);
                $("#mesa_" + mesasArray[i].id_mesa).data("garzon",mesasArray[i].nombre_garzon);
                $("#mesa_" + mesasArray[i].id_mesa).data("estado",mesasArray[i].estado);
                $("#mesa_" + mesasArray[i].id_mesa).data("observacion",mesasArray[i].observacion);

                if (mesasArray[i].id_reserva != 0) {
                    $("#mesa_" + mesasArray[i].id_mesa).bind("click", function () {
                        $("#form_mesa_id").val($(this).data("id_mesa"));
                        $("#clicked_mesa").text($(this).data("id_mesa"));
                        $("#label_num_com").text($(this).data("num_comensales"));
                        $("#label_cliente").text($(this).data("cliente"));
                        $("#label_garzon").text($(this).data("garzon"));
                        if ($(this).data("estado") == -1)
                            $("#label_estado").text('No atendido');
                        else if ($(this).data("estado") == 0)
                            $("#label_estado").text('Pendiente');
                        else if ($(this).data("estado") == 1)
                            $("#label_estado").text('Preparado');
                        $("#text_obs").text($(this).data("observacion"));
                        centerPopup();
                        loadPopup();
                    });
                }
                else {
                    $("#mesa_" + mesasArray[i].id_mesa).bind("click", function () {
                        alert('Esta mesa no tiene una reserva asociada');
                    });
                }
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
                    minDate: new Date,
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

                $("#bgPopup").data("state", 0);

                $("#popupClose").click(function () {
                    disablePopup();
                });
                $('#bgPopup').click(function (e) {
                    disablePopup();
                });
                $('#cancel_button').click(function (e) {
                    disablePopup();
                });

                $('#ok_button').click(function (e) {

                });
            });
        });

        //Recenter the popup on resize - Thanks @Dan Harvey [http://www.danharvey.com.au/]  
        $(window).resize(function () {
            centerPopup();
        });

        // Al cambiar de horario
        function horario_change() {
            var theForm = document.forms['form1'];
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                document.getElementById("__DATE").value = "<%: ViewBag.Fecha %>";
                theForm.submit();
            }
        }
    </script>

    <script type="text/javascript">
        function loadPopup() {
            //loads popup only if it is disabled  
            if ($("#bgPopup").data("state") == 0) {
                $("#bgPopup").css({
                    "opacity": "0.7"
                });
                $("#bgPopup").fadeIn("medium");
                $(".Popup").fadeIn("medium");
                $("#bgPopup").data("state", 1);
            }
        }

        function disablePopup() {
            if ($("#bgPopup").data("state") == 1) {
                $("#bgPopup").fadeOut("medium");
                $(".Popup").fadeOut("medium");
                $("#bgPopup").data("state", 0);
            }
        }

        function centerPopup() {
            var winw = $(window).width();
            var winh = $(window).height();
            var popw = $('.Popup').width();
            var poph = $('.Popup').height();
            $(".Popup").css({
                "position": "absolute",
                "top": winh / 2 - poph / 2,
                "left": winw / 2 - popw / 2
            });
            //IE6  
            $("#bgPopup").css({
                "height": winh
            });
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Consultar Reserva
        </div>
        </h2>
    
    <!--<h2>Consultar Reserva</h2>-->
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

        <% using (Html.BeginForm("ConsultarReserva", "Garzon", FormMethod.Post, new { @id = "form1" }))
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
            <% if (ViewBag.RESP != null){%>
                   <%: ViewBag.RESP %>
                <%}%>
            <input type="hidden" id="__DATE" name="__DATE" value="" />
        <%} %>
    </div>
        <div id="prompt" class="Popup">
            <a id="popupClose">x</a> 
            <form id="form_pedido" method="post" action="TomarPedido">
                <input type="hidden" id="form_mesa_id" name="id_mesa" />
                <h2>Mesa: <label id="clicked_mesa"></label></h2>
                <div>Numero de comensales: <label id="label_num_com" /></div>
                <div>Reserva a: <label id="label_cliente" /></div>
                <div>Atendido por: <label id="label_garzon" /></div>
                <div>Estado: <label id="label_estado" /></div>
                <div>Observación:</div> <textarea id="text_obs" disabled="disabled" cols="5" rows="3" name="obs"></textarea>
                <div>
                    <button type="submit" id="ok_button"> OK </button>
                    <button type="button" id="cancel_button"> Cancel </button>
                </div>
            </form>
        </div>
        <div id="container">
            <!--<input type="hidden" id="form_op" name="op" />-->
            <!--<input type="hidden" id="form_num_comen" name="num_comen" />-->
            <!--<input type="hidden" id="form_obs" name="obs" />-->
        </div>

        <div id="bgPopup"></div>
</asp:Content>
