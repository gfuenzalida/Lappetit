<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Funcionario.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.EnviarInvitacionModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Enviar Invitacion
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Enviar Invitacion
        </div>
    </h2>
    <!--<h2>Enviar Invitacion</h2>-->
    <div style="vertical-align: top; display:inline-block; width: 462px; text-align:justify" >
        L'Appétit permite que un funcionario pueda invitar a otras personas a comer al restaurant. Para ello puede emitir uno o más tickets asignándolos a un RUN de un cliente registrado. Cada uno de estos ticket le servirá al cliente para hacer una reserve y comer en el restaurant. 
        ¡Recuerde use sus tickets prudentemente ya que son limitados!
    </div>
    <div style="vertical-align: top; display:inline-block; height: 179px; width: 276px; margin-left:5%">
        <fieldset>
            <legend>Enviar Invitaciones</legend>
            
                <% using (Html.BeginForm())
                   { %>
            <div>
                <%: Html.LabelFor(m=>m.rutCliente,"RUT")%>
            </div>
            
            <div>
                <%: Html.TextBoxFor(m => m.rutCliente) %>
                <%: Html.ValidationMessageFor(m=>m.rutCliente) %>
            </div>
            <br>
            <div>
                <div style="vertical-align: top; display:inline-block">
                    <%: Html.LabelFor(m=>m.cantidad,"Cantidad") %>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <%: Html.TextBoxFor(m => m.cantidad) %>
                    <%: Html.ValidationMessageFor(m=>m.cantidad) %>
                </div>
            </div>

            <br>
            <div>
                <input id="Submit1" type="submit" value="Enviar" />
            </div>
            <%} %>
        </fieldset>
        <%: TempData["Resp"] %>      


    </div>
</asp:Content>
