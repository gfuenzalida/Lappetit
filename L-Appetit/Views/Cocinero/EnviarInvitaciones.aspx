<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    EnviarInvitaciones
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>EnviarInvitaciones</h2>
    <div style="vertical-align: top; display:inline-block; width: 462px; text-align:justify" >
        L'Appétit permite que un Cocinero pueda invitar a otras personas a comer al restaurant. Para ello puede emitir uno o más tickets asignándolos a un RUN de un cliente registrado. Cada uno de estos ticket le servirá al cliente para hacer una reserve y comer en el restaurant. 
        ¡Recuerde use sus tickets prudentemente ya que son limitados!
    </div>
    <div style="vertical-align: top; display:inline-block; height: 179px; width: 276px; margin-left:5%">
        <fieldset>
            <legend>Enviar Invitaciones</legend>
            <div>
                <asp:Label ID="Label1" runat="server" Text="RUN"></asp:Label>
            </div>
            
            <div>
                <input id="Text1" type="text" />
            </div>
            <br>
            <div>
                <div style="vertical-align: top; display:inline-block">
                    <asp:Label ID="Label2" runat="server" Text="Invitaciones"></asp:Label>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <select id="Select1">
                        <option></option>
                    </select>
                </div>
            </div>
            <br>
            <div>
                <input id="Submit1" type="submit" value="Enviar" />
            </div>
        </fieldset>
        


    </div>


</asp:Content>
