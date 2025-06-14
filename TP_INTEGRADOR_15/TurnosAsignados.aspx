<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TurnosAsignados.aspx.cs" Inherits="TP_INTEGRADOR_15.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 371px;
        }
        .auto-style4 {
            width: 146px;
        }
        .auto-style5 {
            width: 143px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario: Lionel Messi"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblModificarMedico" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Turnos Asignados"></asp:Label>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblFiltrar" runat="server" Font-Size="Large" Text="Filtrar por paciente:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtFiltrado" runat="server" Width="283px"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" Width="91px" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="367px">
                            <Columns>
                                <asp:TemplateField HeaderText="Paciente"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Especialidad"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Medico"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Dia"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Horario"></asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
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
