<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.MesasModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ver Pedidos
</asp:Content>

<asp:Content ID= "Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Cocinero/VerPedidos.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        <% var serializer = new System.Web.Script.Serialization.JavaScriptSerializer(); %>
        var mesasArray = <%= serializer.Serialize(Model.lista_mesas) %>;
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

    <script type="text/javascript">
        $(document).ready(function () {
            $(window).resize(function () {
                centerPopup();
            });
            $('#ok_button').button();
            $('#cancel_button').button();

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
        });

        function verMesa(id) {
            var j=-1;
            for (var i = 0; i < mesasArray.length; i++) {
                if (mesasArray[i].id_mesa == id) {
                    j = i;
                    break;
                }
            }
            if (mesasArray[i].id_reserva == 0) {
                alert('Esta mesa no posee una reserva asociada');
            }
            else if (mesasArray[i].estado == -1) {
                alert('No se ha tomado el pedido para esta mesa');
            }
            else{
                var pedidos = mesasArray[i].lista_pedido;
                clearTable();
                $("#form_reserva_id").val(mesasArray[i].id_reserva);
                $("#label_num_com").text(mesasArray[i].num_comensales);
                $("#label_garzon").text(mesasArray[i].nombre_garzon);
                if (mesasArray[i].estado == -1)
                    $("#label_estado").text('No atendido');
                else if (mesasArray[i].estado == 0)
                    $("#label_estado").text('Pendiente');
                else if (mesasArray[i].estado == 1)
                    $("#label_estado").text('Preparado');

                for (var j = 0; j < pedidos.length; j++) {
                    var item = pedidos[j].nom_item;
                    var cant = pedidos[j].cantidad;
                    var obs = pedidos[j].observacion;
                    $("table#pedidos_tabla tr:last").
                    after('<tr class="row_item" onclick=\'setObservacion(' + i + ',' + j + ')\'><td>' + cant +
                    '</td><td>'+item+'</td></tr>');
                }
                centerPopup();
                loadPopup();
                
                if (mesasArray[i].estado == 1){
                    $('#ok_button').button("disable");    
                }
            }
        }

        function setObservacion(i, j) {
            var obs = mesasArray[i].lista_pedido[j].observacion;
            $('#text_obs').text(obs);
        }

        function clearTable() {
            var tableRef = document.getElementById('pedidos_tabla');
            while (tableRef.rows.length > 1) {
                tableRef.deleteRow(1);
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
        Ver Pedidos
        </div>
    </h2>
    <!--<h2>Ver Pedidos</h2>-->
    <div style="vertical-align: top; display:inline-block; width: 40%">
        <div style="text-align:justify; ">
            <fieldset>
                <legend>Atencion!!!</legend>
                    Siga atentamente las especificaciones que le entregó su profesor antes de iniciar la actividad. Recuerde, su desempeño se está evaluando como profesional ante comensales auténticos.
            </fieldset>

        </div>
        <%: TempData["Resp"] %>
    </div>
    <div style="vertical-align: top; display:inline-block;width:40%; margin-left:5%">
        <fieldset style="width:100%">
        <legend>Mesas</legend>
        <div style="width:100%; text-align:justify">
            Seleccione la mesa con su garzon que le corresponda para ver el pedido
        </div>
        <div class="content_mesas_coc">
        <% foreach (var mesa in Model.lista_mesas)
           {
               %>
            <div onclick="verMesa(<%: mesa.id_mesa.ToString() %>)" id="<%: mesa.id_mesa.ToString() %>" class="mesa_coc" >
                Mesa <%: mesa.id_mesa.ToString() %> - 
                <% if (!String.IsNullOrEmpty(mesa.nombre_garzon))
                   { %>
                   <%: mesa.nombre_garzon %>
                   <%} %>
                   <% else { %>
                        No se ha atendido
                   <%} %>
            </div>
        <%} %>
        </div>
        </fielset>
    </div>
    <div id="prompt" class="Popup">
            <a id="popupClose">x</a> 
            <form id="form_pedido" method="post" action="VerPedidos">
                <input type="hidden" id="form_reserva_id" name="id_reserva" />
                <h2>Mesa: <label id="clicked_mesa"></label></h2>
                <div>Numero de comensales: <label id="label_num_com" /></div>
                <div>Atendido por: <label id="label_garzon" /></div>
                <div>Estado: <label id="label_estado" /></div>
                <table id="pedidos_tabla" style="width: 100%;">
                    <tr id="categoria" style="background-color:#d0d6db">
                        <td>
                            Cantidad&nbsp;
                        </td>
                        <td>
                            Item&nbsp;
                        </td>
                    </tr>
                </table>
                <div>Observación:</div> <textarea id="text_obs" disabled="disabled" cols="5" rows="3" name="obs"></textarea>
                <div>
                    <button type="submit" id="ok_button"> Realizado </button>
                    <button type="button" id="cancel_button"> Cancelar </button>
                </div>
            </form>
        </div>

    <div id="bgPopup"></div>

</asp:Content>
