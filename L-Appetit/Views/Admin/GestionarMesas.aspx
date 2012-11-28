<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Mesas
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Admin/GestionarMesas.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#div1 {width:350px;height:70px;padding:10px;border:1px solid #aaaaaa;}
</style>
<script type="text/javascript">
    function handleDropEvent(event, ui) {
        var draggable = ui.helper;
        alert('The square with ID "' + draggable.attr('id') + '" was dropped onto me! at ('
        + draggable.position().left + ',' + draggable.position().left + ')');
        $('#mesas_container').append('<label class="item">Mesa</label>');
    }
</script>


<script type="text/javascript">
    jQuery(function ($) {
        $(".item").draggable({
            
            containment: 'document',

            snap: '#mesas_container',

            helper: 'clone',

            // Find original position of dragged image.
            start: function (event, ui) {

                // Show start dragged position of image.
                var Startpos = $(this).position();
                $("div#start").text("START: \nLeft: " + Startpos.left + "\nTop: " + Startpos.top);
            },

            // Find position where image is dropped.
            stop: function (event, ui) {

                // Show dropped position.
                var Stoppos = $(this).position();
                $("div#stop").text("STOP: \nLeft: " + Stoppos.left + "\nTop: " + Stoppos.top);
            }
        });

        $(".mesas_cont").droppable({
            drop: handleDropEvent
        });
    });
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
            <div id="add_mesa"><label id="Label2" class="item">Mesa</label></div>
            <div id="drop_mesa"></div>
        </fieldset>
    </div>
<div id="container">
    <!--<label id="Label1" class="item">Mesa</label>-->
</div>

<div id="start">Waiting for dragging the image get started...</div>
<div id="stop">Waiting image getting dropped...</div>

</asp:Content>
