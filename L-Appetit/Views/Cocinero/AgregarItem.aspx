<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AgregarItem
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>AgregarItem</h2>
<!------------------------------------------------------>
<div class="tabs">
   <div class="tab">
       <input type="radio" id="tab-1" name="tab-group-1" checked>
       <label for="tab-1">Datos del Item</label>
       <div class="content"> 
           <div style="vertical-align: top; display:inline-block; height: 39px;">
                <div>
                    <div>
                    <asp:Label ID="Label1" runat="server" Text="Tipo de Plato"></asp:Label>
                    </div>
                    <div>
                    <select id="Select1">
                        <option>Entrada</option>
                        <option>Fondo</option>
                        <option>Postre</option>
                        <option>Bebestible</option>
                    </select>
                    </div>
                </div>
                <div>
                    <asp:Label ID="Label2" runat="server" Text="Descripcion"></asp:Label>
                    <input id="Text1" type="text" />
                </div>
            </div>
            <div style= "vertical-align: top; display:inline-block; height: 93px;">
                <div>
                    <asp:Label ID="Label3" runat="server" Text="Nombre del Item"></asp:Label>
                    <input id="Text2" type="text" />
                </div>
                <div style="height: 46px">
                    <br>
                    <input id="Button1" type="button" value="Confirmar" />
                </div>
            </div>
       </div>
   </div>
   <div class="tab">
       <input type="radio" id="tab-2" name="tab-group-1">
       <label for="tab-2">Consultar Item</label>
       <div class="content">
            
       </div>
   </div>
</div>
<!----------------------------------------------------------------------->

</asp:Content>
