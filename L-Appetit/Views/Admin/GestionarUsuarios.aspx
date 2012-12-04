<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<L_Appetit.Models.GestionUsuariosModel>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/Admin/GestionarUsuarios.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function changeCarrera() {
            var selected = $('#Carrera').val();
            if (selected == 'False') {
                $('#form_tipo_alumno').val('0');
            }
            else if (selected == 'True') {
                $('#form_tipo_alumno').val('1');
            }
        }

        function validarSelect(opcion) {
            if (opcion == 1) {
                var select = $('#ItemSelectEntrada option');
                if (select.length == 0) {
                    alert('No hay ítems para agregar');
                    return false;
                }
            }
            else if (opcion == 2) {
                var select = $('#ItemSelectFondo option');
                if (select.length == 0) {
                    alert('No hay ítems para agregar');
                    return false;
                }
            }
            else if (opcion == 3) {
                var select = $('#ItemSelectPostre option');
                if (select.length == 0) {
                    alert('No hay ítems para agregar');
                    return false;
                }
            }
            else if (opcion == 4) {
                var select = $('#ItemSelectBebestible option');
                if (select.length == 0) {
                    alert('No hay ítems para agregar');
                    return false;
                }
            }
            return true;
        }
    </script>
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
    <div class="tabs" style="width: 100%; height:100%">
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
                <% using (Html.BeginForm()) { %>
                    <fieldset>
                        <legend>Crear Alumno</legend>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Nombre, 
                                    "Nombres")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.Nombre
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.Nombre) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                            <%: Html.LabelFor(
                                    m => m.ApellidoPaterno, 
                                    "Apellido Paterno")
                            %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.ApellidoPaterno
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.ApellidoPaterno) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.ApellidoMaterno, 
                                    "Apellido Materno")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.ApellidoMaterno
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.ApellidoMaterno) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Sexo, 
                                    "Sexo")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.DropDownListFor(
                                    m => m.Sexo,
                                    new SelectList(Model.Generos, "Value", "Text")
                                )%>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block;; width:27%">
                                <%: Html.LabelFor(
                                    m => m.UserName, 
                                    "RUT")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(m => m.UserName) %>
                                <%: Html.ValidationMessageFor(m => m.UserName) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(m => m.Password) %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.PasswordFor(m => m.Password) %>
                                <%: Html.ValidationMessageFor(m => m.Password) %>
                            </div>
                
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(m => m.ConfirmPassword) %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                                <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Carrera, 
                                    "Carrera")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.DropDownListFor(
                                    m => m.Carrera,
                                    new SelectList(Model.Carreras, "Value", "Text"),
                                    new { @onchange = "changeCarrera()" }                                 
                                ) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Email, 
                                    "Correo")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.Email
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.Email) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Telefono, 
                                    "Telefono")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.Telefono
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.Telefono) %>
                            </div>
                        </div>
                        <div style="text-align:right; margin-right:25%">
                            <input id="ButtonAlumno" type="submit" value="Crear" />
                            <input id="form_tipo_alumno" name="tipo" value="0" type="hidden" />
                        </div>
                   </fieldset>
                   <%}%>
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
                            L'Appétit permite al administrador gestionar las cuentas de los distintos usuarios que interactúan en el Restaurant. El administrador puede gestionar a los funcionarios, los cuales tienen la tarea de servir de contacto para los clientes y enviarles invitaciones.
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
                <% using (Html.BeginForm()) { %>
                    <fieldset>
                        <legend>Crear Funcionario</legend>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Nombre, 
                                    "Nombres")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.Nombre
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.Nombre) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                            <%: Html.LabelFor(
                                    m => m.ApellidoPaterno, 
                                    "Apellido Paterno")
                            %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.ApellidoPaterno
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.ApellidoPaterno) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.ApellidoMaterno, 
                                    "Apellido Materno")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.ApellidoMaterno
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.ApellidoMaterno) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Sexo, 
                                    "Sexo")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.DropDownListFor(
                                    m => m.Sexo,
                                    new SelectList(Model.Generos, "Value", "Text")                                    
                                ) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block;; width:27%">
                                <%: Html.LabelFor(
                                    m => m.UserName, 
                                    "RUT")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.UserName
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.UserName) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(m => m.Password) %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.PasswordFor(m => m.Password) %>
                                <%: Html.ValidationMessageFor(m => m.Password) %>
                            </div>
                
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(m => m.ConfirmPassword) %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                                <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Email, 
                                    "Correo")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.Email
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.Email) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Telefono, 
                                    "Telefono")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.Telefono
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.Telefono) %>
                            </div>
                        </div>
                        <div style="text-align:right; margin-right:25%">
                            <input id="Button6" type="submit" value="Crear" />
                            <input id="form_tipo_func" name="tipo" value="2" type="hidden" />
                        </div>
                   </fieldset>
                   <% } %>
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
                <% using (Html.BeginForm())
                   { %>
                   <fieldset>
                        <legend>Crear Administrador</legend>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Nombre, 
                                    "Nombres")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.Nombre
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.Nombre) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                            <%: Html.LabelFor(
                                    m => m.ApellidoPaterno, 
                                    "Apellido Paterno")
                            %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.ApellidoPaterno
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.ApellidoPaterno) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.ApellidoMaterno, 
                                    "Apellido Materno")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.ApellidoMaterno
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.ApellidoMaterno) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Sexo, 
                                    "Sexo")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.DropDownListFor(
                                    m => m.Sexo,
                                    new SelectList(Model.Generos, "Value", "Text")                                    
                                ) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block;; width:27%">
                                <%: Html.LabelFor(
                                    m => m.UserName, 
                                    "RUT")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.UserName
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.UserName) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(m => m.Password) %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.PasswordFor(m => m.Password) %>
                                <%: Html.ValidationMessageFor(m => m.Password) %>
                            </div>
                
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(m => m.ConfirmPassword) %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                                <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Email, 
                                    "Correo")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.Email
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.Email) %>
                            </div>
                        </div>
                        <div>
                            <div style="vertical-align: top; display:inline-block; width:27%">
                                <%: Html.LabelFor(
                                    m => m.Telefono, 
                                    "Telefono")
                                %>
                            </div>
                            <div style="vertical-align: top; display:inline-block">
                                <%: Html.TextBoxFor(
                                    m => m.Telefono
                                    )
                                %>
                                <%: Html.ValidationMessageFor( m => m.Telefono) %>
                            </div>
                        </div>
                        <div style="text-align:right; margin-right:25%">
                            <input id="Button4" type="submit" value="Crear" />
                            <input id="form_tipo_adm" name="tipo" value="3" type="hidden" />
                        </div>
                   </fieldset>
                   <%} %>
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
    <%: Html.ValidationSummary(true) %>
</div>
<!----------------------------------------------------------------------->

</asp:Content>
