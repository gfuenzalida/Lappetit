﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ver Pedidos
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
    </div>
    <div style="vertical-align: top; display:inline-block;width:40%; margin-left:5%">
        <fieldset style="width:100%">
        <legend>Mesas</legend>
        <div style="width:100%; text-align:justify">
            Seleccione la mesa con su garzon que le corresponda para ver el pedido
        </div>
        </fielset>
    </div>

</asp:Content>
