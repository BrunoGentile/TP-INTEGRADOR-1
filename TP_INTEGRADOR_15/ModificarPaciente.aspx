<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarPaciente.aspx.cs" Inherits="TP_INTEGRADOR_15.ModificarPaciente" %>

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
            width: 10px;
        }
        .auto-style4 {
            width: 10px;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            width: 10px;
            height: 26px;
        }
        .auto-style9 {
            height: 26px;
        }
        .auto-style10 {
            height: 23px;
            width: 201px;
        }
        .auto-style11 {
            height: 26px;
            width: 201px;
        }
        .auto-style12 {
            width: 201px;
        }
        .auto-style13 {
            height: 23px;
            width: 75px;
        }
        .auto-style14 {
            height: 26px;
            width: 75px;
        }
        .auto-style15 {
            width: 75px;
        }
        .auto-style16 {
            width: 10px;
            height: 150px;
        }
        .auto-style17 {
            height: 150px;
        }
        .auto-style18 {
            height: 23px;
            width: 215px;
        }
        .auto-style19 {
            height: 26px;
            width: 215px;
        }
        .auto-style20 {
            width: 215px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style18"></td>
                    <td class="auto-style10"></td>
                    <td class="auto-style13"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style19">Buscar Paciente por Nombre:</td>
                    <td class="auto-style11">
                        <asp:TextBox ID="TextBox1" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td class="auto-style14">
                        <asp:Button ID="Button1" runat="server" Text="Buscar" />
                    </td>
                    <td class="auto-style9"></td>
                    <td class="auto-style9"></td>
                    <td class="auto-style9"></td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style16"></td>
                    <td class="auto-style17" colspan="6">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True">
                            <Columns>
                                <asp:TemplateField HeaderText="DNI"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Sexo"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha de Nacimiento"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Correo"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Teléfono"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Direccion"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Ciudad"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Provincia"></asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td class="auto-style17"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
