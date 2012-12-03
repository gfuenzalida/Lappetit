<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Registro</h2>
        Ingrese la su informacion personal para crear su cuenta.</br> 

        La contraseña requiere un minimo de  <%: Membership.MinRequiredPasswordLength %> caracteres de largo.


    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "La creación de la cuenta no se pudo realizar. Por favor resuelva los errores.") %>
        <div>
            <fieldset>
                <legend>Informacion del Cliente</legend>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Nombre) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Nombre) %>
                    <%: Html.ValidationMessageFor(m => m.Nombre) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(m => m.ApellidoPaterno) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.ApellidoPaterno) %>
                    <%: Html.ValidationMessageFor(m => m.ApellidoPaterno) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(m => m.ApellidoMaterno) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.ApellidoMaterno) %>
                    <%: Html.ValidationMessageFor(m => m.ApellidoMaterno) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Generos,"Sexo") %>
                </div>
                <div class="editor-field">
                    <%= Html.DropDownListFor(
                    x => x.Sexo,
                    new SelectList(Model.Generos, "Value", "Text")
                    ) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(m => m.UserName) %>
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
                    <%: Html.LabelFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Email) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Email) %>
                    <%: Html.ValidationMessageFor(m => m.Email) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Telefono) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Telefono) %>
                    <%: Html.ValidationMessageFor(m => m.Telefono) %>
                </div>
                
                
                
                <p>
                    <input type="submit" value="Registrar" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
