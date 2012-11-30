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

            snap: '#mesas_container',

            helper: 'clone',
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
            '" name="' + mesasArray[i].id_mesa + 'class="item" src="../../img/mesa-4.png" />');
            $("#mesa_" + mesasArray[i].id_mesa).draggable({

                containment: '#mesas_container',

                snap: '#mesas_container'
            });

            $("#mesa_" + mesasArray[i].id_mesa).css({ "position": 'absolute', "left": mesasArray[i].pos_x, "top": mesasArray[i].pos_y });
        }
    });
</script>

<script type="text/javascript">
    function handleDropEvent(event, ui) {
        var draggable = ui.helper;
        var id_dropped = ui.draggable.attr('id');
        if (id_dropped == 'mesa-4')
        {
            if (confirm('¿Está seguro que desea agregar una mesa?')) {
                alert('The square with ID "' + draggable.attr('id') + '" was dropped onto me! at ('
            + draggable.offset().left + ',' + draggable.offset().top + ')');
            }
        }
    }
</script>

<script type="text/javascript">
    function allowDrop(ev) {
        ev.preventDefault();
    }

    function drag(ev) {
        ev.dataTransfer.setData("Text", ev.target.id);
    }

    function drop(ev) {
        ev.preventDefault();
        var data = ev.dataTransfer.getData("Text");
        ev.target.appendChild(document.getElementById(data));
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
    <% using (Html.BeginForm("GestionarMesas", "Admin", FormMethod.Post, new { @id = "form2" }))
       { %>
       <input type="hidden" name="id_mesa" />
       <input type="hidden" name="x_mesa" />
       <input type="hidden" name="y_mesa" />
       <input type="hidden" name="max_mesa" />
    <%} %>
</div>

</asp:Content>
