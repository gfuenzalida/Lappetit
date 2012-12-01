<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.MesasModel>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Mesas
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Admin/GestionarMesas.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/GestionarMesas.js" type="text/javascript"></script>
<style type="text/css">
#div1 {width:350px;height:70px;padding:10px;border:1px solid #aaaaaa;}
</style>
    
<% L_Appetit.Models.MesasModel modelo = ViewData.Model; %> 

<script type="text/javascript">
<% var serializer = new System.Web.Script.Serialization.JavaScriptSerializer(); %>
var mesasArray = <%= serializer.Serialize(modelo.lista_mesas) %>;
</script>

<script type="text/javascript">
    jQuery(function ($) {
        $(".item").draggable({
            
            containment: 'document',

            //snap: '#mesas_container',

            helper: 'clone'
        });

        $(".mesas_cont").droppable({
            drop: handleDropEvent
        });
    });
</script>

<script type="text/javascript">
    jQuery(function ($) {
        var i = 0;
        for (i = 0; i < mesasArray.length; i++) {
            $('#mesas_container').append('<img id="mesa_' + mesasArray[i].id_mesa +
            '" name="' + mesasArray[i].id_mesa + '-' + mesasArray[i].cant_maxima + '" class="item" src="../../img/mesa-4.png" />');
            $("#mesa_" + mesasArray[i].id_mesa).draggable({

                containment: '#mesas_container',

                start: function (event, ui) {
                    $(this).data("startPosition", $(this).offset());
                },

                stop: function (event, ui) {
                    var draggable = ui.helper;
                    var id_dropped = draggable.attr('name').split('-')[0];
                    var cant_max = draggable.attr('name').split('-')[1];
                    alert(id_dropped + ',' + cant_max);
                    Startpos = $(this).data("startPosition");
                    alert(Startpos.left+','+Startpos.top);
                    if (entreMesas(id_dropped, Math.floor(draggable.offset().left), Math.floor(draggable.offset().top), cant_max)) {
                        if (confirm('¿Está seguro que desea mover de posición esta mesa?')) {
                            $('#form_op').attr('value', 'mv');
                            $('#form_mesa_x').attr('value', Math.floor(draggable.offset().left));
                            $('#form_mesa_y').attr('value', Math.floor(draggable.offset().top));
                            $('#form1').submit();
                        }
                        else {
                            $(this).css({ "left": Math.floor(Startpos.left), "top": Math.floor(Startpos.top) });
                        }
                    }
                    else {
                        alert('No puede poner dos mesas en la misma posición');
                        $(this).css({ "left": Math.floor(Startpos.left), "top": Math.floor(Startpos.top) });
                    }
                }

                //snap: '#mesas_container'
            });

            $("#mesa_" + mesasArray[i].id_mesa).css({ "position": 'absolute', "left": mesasArray[i].pos_x, "top": mesasArray[i].pos_y });
        }
    });
</script>

<script type="text/javascript">
    function handleDropEvent(event, ui) {
        var draggable = ui.helper;
        var id_dropped = ui.draggable.attr('id');
        if (id_dropped == 'mesa-4' || id_dropped == 'mesa-6') {
            if ( entreMesas('',Math.floor(draggable.offset().left), Math.floor(draggable.offset().top), id_dropped.split('-')[1] ) ) {
                if (confirm('¿Está seguro que desea agregar una mesa?')) {
                    $('#form_op').attr('value', 'add');
                    $('#form_mesa_x').attr('value', Math.floor(draggable.offset().left));
                    $('#form_mesa_y').attr('value', Math.floor(draggable.offset().top));
                    $('#form_mesa_max').attr('value', '4');
                    $('#form1').submit();
                }
            }
            else {
                alert('No puede poner dos mesas en la misma posición');
            }
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
        Gestionar Mesas
        </div>
    </h2>
    <!--<h2>Gestionar Mesas</h2>-->
    <div  id= "mesas" class="mesas">
        <fieldset>
            <legend>Mesas</legend>
            <div id="mesas_container" class="mesas_cont">
                <!--div reservado para poner las mesas-->
            </div>
        </fieldset>
    </div>
    <div id="menu_der" class="menu_derecha">
        <fieldset>
            <legend>Opciones</legend>
            <div id="add_mesa"><img id="mesa-4" alt="Mesa-4" class="item" src="../../img/mesa-4.png" /></div>
            <div id="drop_mesa"></div>
        </fieldset>
    </div>

<div id="container">
    <% using (Html.BeginForm("GestionarMesas", "Admin", FormMethod.Post, new { @id = "form1" }))
       { %>
       <input type="hidden" id="form_op" name="op" />
       <input type="hidden" id="form_mesa_id" name="id_mesa" />
       <input type="hidden" id="form_mesa_x" name="x_mesa" />
       <input type="hidden" id="form_mesa_y" name="y_mesa" />
       <input type="hidden" id="form_mesa_max" name="max_mesa" />
    <%} %>
</div>

</asp:Content>
