<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Cocinero.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ver Menu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Ver Menu</h2>
<div class="tabs">
   <div class="tab">
       <input type="radio" id="tab-1" name="tab-group-1" checked>
       <label for="tab-1">Entrada</label>
       <div class="content" >
            <div style="text-aling:center; width:100%">
                <textarea id="TextArea1" cols="8" rows="8" disabled="disabled" style="width:100%" ></textarea>
            </div>
       </div>
   </div>
   <div class="tab">
       <input type="radio" id="tab-2" name="tab-group-1">
       <label for="tab-2">Plato de Fondo</label>
       <div class="content">
            <div style="text-aling:center; width:100%">
                <textarea id="TextArea2" cols="8" rows="8" disabled="disabled" style="width:100%" ></textarea>
           </div>
        </div>
    </div>
   <div class="tab">
       <input type="radio" id="tab-3" name="tab-group-1">
       <label for="tab-3">Postre</label>
       <div class="content">
            <div style="text-aling:center; width:100%">
                <textarea id="TextArea3" cols="8" rows="8" disabled="disabled" style="width:100%" ></textarea>
           </div>
        </div>
    </div>
    <div class="tab">
       <input type="radio" id="tab-4" name="tab-group-1">
       <label for="tab-4">Bebestibles</label>
       <div class="content">
            <div style="text-aling:center; width:100%">
                <textarea id="TextArea4" cols="8" rows="8" disabled="disabled" style="width:100%" ></textarea>
            </div>
        </div>
    </div>
   
</div>

    </div>
</asp:Content>
