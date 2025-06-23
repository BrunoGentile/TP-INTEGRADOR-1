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
            width: 279px;
        }
        .auto-style4 {
            height: 23px;
            width: 279px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 279px;
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
            width: 106px;
        }
        .auto-style11 {
            height: 23px;
            width: 106px;
        }
        .auto-style12 {
            height: 26px;
            width: 106px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2" colspan="2">
                    <asp:Label ID="lbl_AltaPaciente" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Alta de Medico"></asp:Label>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style11"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4"></td>
                <td class="auto-style8"></td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style11"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">Nombre</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TB_Nombre" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="TB_Nombre"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Apellido:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TB_Apellido" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="TB_Apellido"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">DNI</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TB_DNI" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">Sexo</td>
                <td class="auto-style7">
&nbsp;<asp:CheckBoxList ID="CheckBoxList1" runat="server">
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                    </asp:CheckBoxList>
                    <br />
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">Nacionalidad</td>
                <td>
                    <asp:TextBox ID="TB_Nacionalidad" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Fecha de Nacimiento</td>
                <td class="auto-style5" colspan="3">
                    <input type="date" name="fechaNacimiento" id="Input_FDN" runat="server" />
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4">Direccion</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TB_Direccio" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
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
                <td class="auto-style12">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DDL_Provincias">Seleccione una Pronvincia</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style12">Ciudad</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DDL_Ciudades" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">Correo Elctronico</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TB_Correo" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">Telefono</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TB_Telefono" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">Especialidad</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="DDL_Especialidad" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Dias </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TB_Dias" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style12"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4">Horario Inicio</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TB_HS_Inicio" runat="server" TextMode="Time"></asp:TextBox>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style11"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">Horario Fin</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TB_HS_Fin" runat="server" TextMode="Time"></asp:TextBox>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4">Contraseña</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TB_Password" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style11"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4"></td>
                <td class="auto-style8"></td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style11">
                    <asp:Button ID="BTN_Enviar" runat="server" OnClick="BTN_Enviar_Click" Text="Enviar" />
                </td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4"></td>
                <td class="auto-style8"></td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style11"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>