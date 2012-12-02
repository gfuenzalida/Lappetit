<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Bonjour <strong><%: Page.User.Identity.Name %></strong>!
        [ <%: Html.ActionLink("Cerrar Sesión", "LogOff", "Account") %> ]
        <p>Sesión iniciada como <%: Roles.GetRolesForUser(Page.User.Identity.Name)[0]%></p>
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Iniciar Sesión", "LogOn", "Account") %> ]
<%
    }
%>
