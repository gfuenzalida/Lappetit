<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>  
<%
        if (System.DateTime.Now.Hour < 12)
        {
%>
            Bonjour 
<%      
        }
        else
        {
%>
            Bonsoir
<%
        } 
%>
        <strong><%: Membership.GetUser(Page.User.Identity.Name).Comment%></strong>!
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
