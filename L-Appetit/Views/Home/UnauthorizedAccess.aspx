<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    UnauthorizedAccess
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Acceso denegado</h2>
    <p>
            Ha intentado acceder a una página a la cual no está autorizado a ver.
    </p>
    <p>
            Por favor, inicie sesión con una cuenta autorizada.
    </p>
</asp:Content>
