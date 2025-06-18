<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarMedico.aspx.cs" Inherits="TP_INTEGRADOR_15.WebForm2" %>

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
            width: 177px;
        }
        .auto-style3 {
            width: 316px;
        }
        .auto-style4 {
            width: 97px;
        }
        .auto-style5 {
            width: 177px;
            margin-left: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario: "></asp:Label>
                        <asp:Label ID="nombreUsuario" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblModificarMedico" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Modificar Medico"></asp:Label>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblFiltrar" runat="server" Font-Size="Large" Text="Filtrar por legajo:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtFiltrado" runat="server" Width="283px"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" Width="84px" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True">
                            <Columns>
                                <asp:TemplateField HeaderText="Legajo"></asp:TemplateField>
                                <asp:TemplateField HeaderText="DNI"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Medico"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Especialidad"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Correo"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Telefono"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Sexo"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Nacimiento"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Nacionalidad"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Provincia"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Ciudad"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Direccion"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Dias de atencion"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Jornada"></asp:TemplateField>
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
                    <td class="auto-style2">&nbsp;</td>
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
