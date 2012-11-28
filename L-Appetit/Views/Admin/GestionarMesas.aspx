﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Mesas
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">

<style type="text/css">
#div1 {width:350px;height:70px;padding:10px;border:1px solid #aaaaaa;}
</style>
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
    <div  ID= "mesas" style="display: inline-block; vertical-align: top">
        <fieldset>
            <legend>Mesas</legend>
            <div>
                <!--div reservado para poner las mesas-->
            </div>
        </fieldset>
    </div>
    <div style="display: inline-block; vertical-align: top; width: 190px">
        <fieldset style="width: 190px">
        <legend>Opciones</legend>
        <div>
            <input id="Button1" type="button" value="Agregar Mesa" />
        </div>
        <div>
            <!--div reservado para el calendario-->
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Horario"></asp:Label>
        </div>
        <div>
            <select id="Select1">
                <option>Almuerzo</option>
                <option>Cena</option>
            </select>
        </div>
        </fieldset>
    </div>


<script type="text/javascript">
    jQuery(function ($) {
        $(".item").draggable({

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
    });
</script>

<div id="container">
    <label id="Label1" class="item">Drag1</label>
    <label id="Label2" class="item">Drag2</label>
    <label id="Label3" class="item">Drag3</label>
</div>

<div id="start">Waiting for dragging the image get started...</div>
<div id="stop">Waiting image getting dropped...</div>

</asp:Content>
