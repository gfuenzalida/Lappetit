<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Admin/GestionarUsuarios.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Usuarios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Gestionar Usuarios</h2>

<!------------------------------------------------------>
<div >
    <div class="tabs" style="width: 100%">
        <div class="tab">
            <input type="radio" id="tab-1" name="tab-group-1" checked>
            <label for="tab-1">Gestionar Alumnos</label>
            <div class="content" >
                    
            </div>
         </div>
        <div class="tab">
            <input type="radio" id="tab-2" name="tab-group-1">
            <label for="tab-2">Gestionar Funcionarios</label>
            <div class="content">el contenido de la pestaña 2</div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-3" name="tab-group-1">
            <label for="tab-3">Gestionar Administradores</label>
            <div class="content">
            
            </div>
        </div>
   
    </div>
</div>
<!----------------------------------------------------------------------->

</asp:Content>
