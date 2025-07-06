<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaMedico.aspx.cs" Inherits="TP_INTEGRADOR_15.AltaMedico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
        }
        .auto-style4 {
            height: 23px;
            width: 150px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 150px;
            height: 26px;
        }
        .auto-style7 {
            width: 180px;
        }
        .auto-style8 {
            height: 23px;
            width: 180px;
        }
        .auto-style9 {
            height: 26px;
            width: 180px;
        }
        .auto-style10 {
        }
        .auto-style11 {
            height: 23px;
            }
        .auto-style12 {
            height: 26px;
            }
        .auto-style13 {
            width: 10px;
        }
        .auto-style14 {
            height: 23px;
            width: 10px;
        }
        .auto-style15 {
            height: 26px;
            width: 10px;
        }
        .auto-style16 {
            margin-bottom: 0px;
        }
        .auto-style17 {
            height: 42px;
        }
        .auto-style18 {
            width: 150px;
            height: 42px;
        }
        .auto-style19 {
            width: 180px;
            height: 42px;
        }
        .auto-style20 {
            height: 42px;
        }
        .auto-style21 {
            width: 10px;
            height: 42px;
        }
        .auto-style22 {
            height: 26px;
        }
        .auto-style23 {
        }
        .auto-style24 {
            height: 23px;
        }
        .auto-style25 {
            width: 150px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3" colspan="2">Usuario:&nbsp;
                    <asp:Label ID="LBL_Usuario" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style23">
                    &nbsp;</td>
                <td class="auto-style10" colspan="2">
                    <asp:HyperLink ID="hyVolver" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2" colspan="2">
                    <asp:Label ID="lbl_AltaPaciente" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Alta de Medico"></asp:Label>
                </td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style11" colspan="2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style14"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4"></td>
                <td class="auto-style8"></td>
                <td class="auto-style24"></td>
                <td class="auto-style11" colspan="2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style14"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Nombre</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TB_Nombre" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="TB_Nombre" ValidationGroup="agregar" ForeColor="#CC0000">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                  
                    <br />
                    <asp:RegularExpressionValidator ID="REV_Nombre" runat="server" ControlToValidate="TB_Nombre" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="agregar">Ingrese un nombre válido</asp:RegularExpressionValidator>
                  
                </td>
                <td class="auto-style15"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Apellido:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TB_Apellido" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="TB_Apellido"  ValidationGroup="agregar" ForeColor="#CC0000">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="REV_Apellido" runat="server" ControlToValidate="TB_Apellido" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="agregar">Ingrese un apellido válido</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style15"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style17"></td>
                <td class="auto-style18">DNI</td>
                <td class="auto-style19">
                    <asp:TextBox ID="TB_DNI" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style20" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="TB_DNI"  ValidationGroup="agregar" ForeColor="#CC0000">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="REV_DNI" runat="server" ControlToValidate="TB_DNI" ForeColor="#CC0000" ValidationExpression="^\d{8}$" ValidationGroup="agregar">Ingrese un DNI válido</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style21"></td>
                <td class="auto-style17"></td>
                <td class="auto-style17"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style25">Sexo</td>
                <td class="auto-style7">
                    <asp:RadioButtonList ID="RBL_Sexo" runat="server">
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                </td>
                <td class="auto-style23" colspan="4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RBL_Sexo" ErrorMessage="RequiredFieldValidator" ForeColor="#CC0000" ValidationGroup="agregar">Seleccione el género</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style25">Nacionalidad</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TB_Nacionalidad" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="TB_Nacionalidad"  ValidationGroup="agregar" ForeColor="#CC0000">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="REV_Nacionalidad" runat="server" ControlToValidate="TB_Nacionalidad" ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" ValidationGroup="agregar">Ingrese una nacionalidad válida</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Fecha de Nacimiento</td>
                <td class="auto-style5" colspan="4">
                    <input type="date" name="fechaNacimiento" id="Input_FDN" runat="server" />
                </td>
                <td class="auto-style5">
                    </td>
                <td class="auto-style15"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4">Direccion</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TB_Direccio" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style24" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="TB_Direccio" ValidationGroup="agregar" ForeColor="#CC0000">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="REV_Direccion" runat="server" ControlToValidate="TB_Direccio" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ\s\.,-]+$" ValidationGroup="agregar">Ingrese una dirección válida</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style14"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Provincia</td>
                <td class="auto-style9">
                    <asp:DropDownList ID="DDL_Provincias" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_Provincias_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style22" id="rfvProvincia" colspan="2">
                    <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="DDL_Provincias" InitialValue="--Seleccione una provincia--" ForeColor="#CC0000" ValidationGroup="agregar">Seleccione una Pronvincia</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style22" id="rfvProvincia" colspan="2">
                    &nbsp;</td>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Ciudad</td>
                <td class="auto-style9">
                    <asp:DropDownList ID="DDL_Ciudades" runat="server" AutoPostBack="True">
                        <asp:ListItem>--Seleccione una ciudad--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style22" id="rfvProvincia" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvCiudad" runat="server" ControlToValidate="DDL_Ciudades" InitialValue="--Seleccione una ciudad--" ValidationGroup="agregar" ForeColor="#CC0000">Seleccione una Ciudad</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style15">
                </td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style25">Correo Elctronico</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TB_Correo" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style23" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="TB_Correo" ValidationGroup="agregar" ForeColor="#CC0000">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="REV_Correo" runat="server" ControlToValidate="TB_Correo" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="agregar">Ingrese un correo válido</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Telefono</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TB_Telefono" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5" colspan="4">
                    <asp:RequiredFieldValidator ID="RFV_Telefono" runat="server" ControlToValidate="TB_Telefono" ErrorMessage="RequiredFieldValidator" ForeColor="#CC0000" ValidationGroup="agregar">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="REV_Telefono" runat="server" ControlToValidate="TB_Telefono" ForeColor="#CC0000" ValidationExpression="^\+?[0-9]+$" ValidationGroup="agregar">Ingrese un teléfono válido</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style5"></td>
                <td class="auto-style15"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style25">Especialidad</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="DDL_Especialidad" runat="server" ValidationGroup="agregar">
                    </asp:DropDownList>
                </td>
                <td class="auto-style23" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="DDL_Especialidad" InitialValue="0" ValidationGroup="agregar" ForeColor="#CC0000">Seleccione una Especialidad</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Dias </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TB_Dias" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style22" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvDias" runat="server" ValidationGroup="agregar" ControlToValidate="TB_Dias" ForeColor="#CC0000">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="REV_Dias" runat="server" ControlToValidate="TB_Dias" ForeColor="#CC0000" ValidationExpression="^(Lunes|Martes|Miércoles|Jueves|Viernes)(,\s*(Lunes|Martes|Miércoles|Jueves|Viernes))*$" ValidationGroup="agregar">Ingrese los días separados por coma</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style5"></td>
                <td class="auto-style15"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4">Horario Inicio</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TB_HS_Inicio" runat="server" TextMode="Time"></asp:TextBox>
                </td>
                <td class="auto-style24" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvHorarioInicio" runat="server" ControlToValidate="TB_HS_Inicio" ValidationGroup="agregar" ForeColor="#CC0000">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2"></td>
                <td class="auto-style14"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">Horario Fin</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TB_HS_Fin" runat="server" TextMode="Time"></asp:TextBox>
                </td>
                <td class="auto-style24" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvHorarioFin" runat="server" ControlToValidate="TB_HS_Fin" ValidationGroup="agregar" ForeColor="#CC0000">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4">Contraseña</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TB_Password" runat="server" CssClass="auto-style16" Type="password"></asp:TextBox>
                </td>
                <td class="auto-style24" colspan="4">
                    <asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ValidationGroup="agregar" ControlToValidate="TB_Password" ForeColor="#CC0000">No puede dejar este campo vacío</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2"></td>
                <td class="auto-style14"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4"></td>
                <td class="auto-style8">
                    <asp:Button ID="BTN_Enviar" runat="server" OnClick="BTN_Enviar_Click" Text="Enviar"  ValidationGroup="agregar" />
                </td>
                <td class="auto-style24" colspan="5">
                    &nbsp;
                    <asp:Label ID="lbl_Mensaje" runat="server"></asp:Label>
                </td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style11" colspan="2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4">
                    </td>
                <td class="auto-style8"></td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style11" colspan="2"></td>
                <td class="auto-style11"></td>
                <td class="auto-style2"></td>
                <td class="auto-style14"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style11" colspan="2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>