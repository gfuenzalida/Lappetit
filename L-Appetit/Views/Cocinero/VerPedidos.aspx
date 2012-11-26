<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    VerPedidos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>VerPedidos</h2>
    <div style="vertical-align: top; display:inline-block; width: 40%">
        <div style="text-align:justify; ">
            <fieldset>
                <legend>Atencion!!!</legend>
                    Siga atentamente las especificaciones que le entrego su profesor antes de iniciar la actividad. Recuerde, su desempeño se esta evaluando como profesional ante comensales autenticos.
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
