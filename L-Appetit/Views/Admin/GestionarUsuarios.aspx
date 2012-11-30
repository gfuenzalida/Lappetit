<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Admin/GestionarUsuarios.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestionar Usuarios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <div style="vertical-align: middle; display:inline-block;">
        <img alt="" src="../../img/logo.png" style="height: 70px; width: 70px" />
        </div>
        <div style="vertical-align: middle; display:inline-block;">
        Gestionar Usuarios
        </div>
    </h2>
<!--<h2>Gestionar Usuarios</h2>-->

<!------------------------------------------------------>
<div style="height:450px" >
    <div class="tabs" style="width: 100%; height:80%">
        <div class="tab">
            <input type="radio" id="tab-1" name="tab-group-1" checked>
            <label for="tab-1">Gestionar Alumnos</label>
            <div class="content" >
                <div style="vertical-align: top; display:inline-block; height:100%; width:40%">
                    <div style="min-height:50%">
                        <fieldset>
                        <legend>Gestionar Alumnos</legend>
                        <div style="text-align:justify;width:100%">
                            <!-- div de texto-->
                           L'Appétit permite al administrador gestionar las cuentas de los distintos usuarios que interactúan en el Restaurant. El administrador puede gestionar a los alumnos que pueden ser Cocineros o Garzones, los cuales tienen distintas atribuciones.
                        </div>
                        </fieldset>
                    </div>
                    <div style="min-height:50%">
                        <fieldset>
                        <legend>Consultar Alumno</legend>
                        <div style="margin-top:5%">
                            <div style="vertical-align: top; display:inline-block; width:12%; ">
                                <asp:Label ID="Label3" runat="server" Text="RUN"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text1" type="text" />
                            </div>
                        </div>
                        <div style="text-align:right; margin-right:27%">
                            <input id="Button1" type="button" value="Buscar" />
                        </div>
                        </fieldset>
                    </div>
                </div>
                <div style="vertical-align: top; display:inline-block; width:55%; margin-left:2%">
                    <fieldset>
                        <legend>Crear Alumno</legend>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label11" runat="server" Text="Nombres"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text11" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label12" runat="server" Text="Apellido Paterno"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text12" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label13" runat="server" Text="Apellido Materno"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text13" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label14" runat="server" Text="Sexo"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text14" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block;; width:27%">
                                <asp:Label ID="Label15" runat="server" Text="RUN"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text15" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block;; width:27%">
                                <asp:Label ID="Label18" runat="server" Text="Carrera"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <select id="Select1">
                                    <option>Hoteleria</option>
                                    <option>Gastronomia</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label16" runat="server" Text="Correo"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text16" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label17" runat="server" Text="Telefono"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text17" type="text" />
                            </div>
                        </div>
                        <div style="text-align:right; margin-right:25%">
                            <input id="Button5" type="button" value="Crear" />
                        </div>
                   </fieldset>   
                </div>    
            </div><!---->
         </div>
        <div class="tab">
            <input type="radio" id="tab-2" name="tab-group-1">
            <label for="tab-2">Gestionar Funcionarios</label>
            <div class="content">
                <div style="vertical-align: top; display:inline-block; height:100%; width:40%">
                    <div style="min-height:50%">
                        <fieldset>
                        <legend>Gestionar Funcionario</legend>
                        <div style="text-align:justify;width:100%">
                            <!-- div de texto-->
                            L'Appétit permite al administrador gestionar las cuentas de los distintos usuarios que interactúan en el Restaurant. El administrador puede gestionar a los funcionarios, los cuales tienen al tarea de servir de contacto para los clientes y enviarles invitaciones.
                        </div>
                        </fieldset>
                    </div>
                    <div style="min-height:50%">
                        <fieldset>
                        <legend>Consultar Funcionario</legend>
                        <div style="margin-top:5%">
                            <div style="vertical-align: top; display:inline-block; width:12%; ">
                                <asp:Label ID="Label1" runat="server" Text="RUN"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text2" type="text" />
                            </div>
                        </div>
                        <div style="text-align:right; margin-right:27%">
                            <input id="Button2" type="button" value="Buscar" />
                        </div>
                        </fieldset>
                    </div>
                </div>
                <div style="vertical-align: top; display:inline-block; width:55%; margin-left:2%">
                    <fieldset>
                        <legend>Crear Funcionario</legend>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label19" runat="server" Text="Nombres"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text18" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label20" runat="server" Text="Apellido Paterno"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text19" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label21" runat="server" Text="Apellido Materno"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text20" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label22" runat="server" Text="Sexo"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text21" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block;; width:27%">
                                <asp:Label ID="Label23" runat="server" Text="RUN"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text22" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label24" runat="server" Text="Correo"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text23" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label25" runat="server" Text="Telefono"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text24" type="text" />
                            </div>
                        </div>
                        <div style="text-align:right; margin-right:25%">
                            <input id="Button6" type="button" value="Crear" />
                        </div>
                   </fieldset>   
                </div>    
            </div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-3" name="tab-group-1">
            <label for="tab-3">Gestionar Administradores</label>
            <div class="content">
                <div style="vertical-align: top; display:inline-block; height:100%; width:40%">
                    <div style="min-height:50%">
                        <fieldset>
                        <legend>Gestionar Administradores</legend>
                        <div style="text-align:justify;width:100%">
                            <!-- div de texto-->
                           L'Appétit permite al administrador gestionar las cuentas de los distintos usuarios que interactúan en el Restaurant. El administrador puede gestionar a otros administradores, los cuales son encargados de gestionar a Alumnos y Funcionarios y hacer consultas de los pedidos y reservas.
                        </div>
                        </fieldset>
                    </div>
                    <div style="min-height:50%">
                        <fieldset>
                        <legend>Consultar Administradores</legend>
                        <div style="margin-top:5%">
                            <div style="vertical-align: top; display:inline-block; width:12%; ">
                                <asp:Label ID="Label2" runat="server" Text="RUN"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text3" type="text" />
                            </div>
                        </div>
                        <div style="text-align:right; margin-right:27%">
                            <input id="Button3" type="button" value="Buscar" />
                        </div>
                        </fieldset>
                    </div>
                </div>
                <div style="vertical-align: top; display:inline-block; width:55%; margin-left:2%">
                   <fieldset>
                        <legend>Crear Administrador</legend>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label4" runat="server" Text="Nombres"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text4" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label5" runat="server" Text="Apellido Paterno"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text5" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label6" runat="server" Text="Apellido Materno"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text6" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label7" runat="server" Text="Sexo"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text7" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block;; width:27%">
                                <asp:Label ID="Label8" runat="server" Text="RUN"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text8" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label9" runat="server" Text="Correo"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text9" type="text" />
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <asp:Label ID="Label10" runat="server" Text="Telefono"></asp:Label>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <input id="Text10" type="text" />
                            </div>
                        </div>
                        <div style="text-align:right; margin-right:25%">
                            <input id="Button4" type="button" value="Crear" />
                        </div>
                   </fieldset>
                </div>    
            </div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-4" name="tab-group-1">
            <label for="tab-4">Importar Alumnos</label>
            <div class="content">
                <div style="vertical-align: top; display:inline-block" >
                    <fieldset>
                        <legend>Importar desde Planilla</legend>
                        <div style="text-align:justify">
                            Usted como administrador puede importar los alumnos nuevos que ingresan cada semestre, desde un archivo del tipo Microsoft Excel.<br>
                            Para esto tan solo debe seleccionar el archivo donde se encuentra la planilla que contiene los alumnos nuevos.
                        </div>
                    </fieldset>
                </div>
                <div style="vertical-align: top; display:inline-block">
                    <fieldset>
                        <legend>Seleccion de Archivo</legend>
                        <div>
                        <input id="File1" type="file" />
                        </div>
                    </fieldset>
                </div>
            </div>
            
        </div>
   
    </div>
</div>
<!----------------------------------------------------------------------->

</asp:Content>
