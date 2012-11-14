<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.LogOnModel>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Iniciar Sesion
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server" style="margin-left: 5px">
    
    <h2>Iniciar Sesion</h2>
    <div style="height: 323px; width: 556px; vertical-align: top; display:inline-block">
    <div style="width: 259px; height: 313px; vertical-align: top; display:inline-block">
    <p>
        L'Appétit es un sistema de gestión de restaurantes que permite manejar las distintas operaciones que se realizan en la cotidianidad del servicio al cliente en un restaurant.</br>
        Si usted conoce a alguien que trabaje en el área de docencia o administración, o que sea un alumno cursando las carreras de Hoteles y Restaurant o Gastronomía Internacional, puede ser cliente del restaurant e ir a comer en él de forma gratuita con invitaciones enviadas por esa persona que conozca. ¡Regístrese <%: Html.ActionLink("Aqui", "Register") %> y disfrute los beneficios de ser cliente!
    </p>
    </div>
    <div style="vertical-align: top; display:inline-block; width: 293px; height: 310px;">
        <img alt="" src="../../img/logo.png" style="height: 243px; width: 284px" /></div>
    </div>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Login was unsuccessful. Please correct the errors and try again.") %>
        <div style="margin-left: 3px; width: 268px; vertical-align: top; display:inline-block; height: 424px;">
            <fieldset>
                <legend>Informacion de la Cuenta</legend>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.UserName)%>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.CheckBoxFor(m => m.RememberMe) %>
                    <%: Html.LabelFor(m => m.RememberMe) %>
                    
                    
                    
                </div>
                <div>
                </br>
                <asp:Label ID="Label1" runat="server" Text="Tipo de Usuario"></asp:Label>
                <select id="Select2">
                    
                    <option>Cliente</option>
                    <option>Alumno Hoteleria</option>
                    <option>Alumno Gastronomia</option>
                    <option>Administrador</option>
                    <option>Funcionario</option>
                </select>
                </div>
                
                <p>
                    <input type="submit" value="Iniciar Sesion" />
                </p>
            </fieldset>
        </div>
    <% } %>
    </form>
</asp:Content>
