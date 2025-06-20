<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaPaciente.aspx.cs" Inherits="TP_INTEGRADOR_15.AltaPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 816px;
        }
        .auto-style3 {
        }
        .auto-style5 {
            width: 81px;
            height: 36px;
        }
        .auto-style16 {
            height: 36px;
            width: 82px;
        }
        .auto-style17 {
            width: 81px;
        }
        .auto-style18 {
            width: 82px;
        }
        .auto-style19 {
            width: 116px;
            height: 36px;
        }
        .auto-style20 {
        }
        .auto-style21 {
            width: 227px;
            height: 36px;
        }
        .auto-style22 {
            width: 227px;
        }
        .auto-style23 {
            width: 100px;
            height: 36px;
        }
        .auto-style24 {
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style21"></td>
                    <td class="auto-style19"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style23"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style16"></td>
                    <td class="auto-style16"></td>
                    <td class="auto-style16"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style3" colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="XX-Large" Text="Alta de Paciente"></asp:Label>
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style3" colspan="2">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">Nombre:</td>
                    <td class="auto-style20">
                        <asp:TextBox ID="txt_nombrePaciente" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">Apellido:</td>
                    <td class="auto-style20">
                        <asp:TextBox ID="txt_apellidoPaciente" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">DNI:</td>
                    <td class="auto-style20">
                        <asp:TextBox ID="txt_DniPaciente" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">Sexo:</td>
                    <td class="auto-style20">
                        <asp:RadioButton ID="rb_pacienteFem" runat="server" Text="Femenino" CausesValidation="True" GroupName="sexo_Paciente" />
                        <br />
                        <asp:RadioButton ID="rb_pacienteMasc" runat="server" Text="Masculino" CausesValidation="True" GroupName="sexo_Paciente" />
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">Nacionalidad:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="txt_nacPaciente" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">Fecha de Nacimiento:</td>
                    <td class="auto-style20">
                        <input type="date" id="txt_FechaNacPaciente" runat="server"/> 
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">Dirección:</td>
                    <td class="auto-style20">
                        <asp:TextBox ID="txt_direccionPaciente" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">Provincia:</td>
                    <td class="auto-style20">
                        <asp:DropDownList ID="ddl_ProvPaciente" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_ProvPaciente_SelectedIndexChanged" Width="125px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">Localidad:</td>
                    <td class="auto-style17">
                        <asp:DropDownList ID="ddl_LocPaciente" runat="server" Height="18px" Width="125px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">Correo Electronico:</td>
                    <td class="auto-style20">
                        <asp:TextBox ID="txt_correoPaciente" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">Teléfono</td>
                    <td class="auto-style20">
                        <asp:TextBox ID="txt_telefonoPaciente" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">&nbsp;</td>
                    <td class="auto-style20">
                        <asp:Label ID="lbl_fechaNac" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">&nbsp;</td>
                    <td class="auto-style20" colspan="3">
                        <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" Width="145px" OnClick="btn_Aceptar_Click" />
                    </td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style22">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

