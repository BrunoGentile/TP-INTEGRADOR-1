<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TurnosAsignados.aspx.cs" Inherits="TP_INTEGRADOR_15.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style7 {
            width: 400px;
            height: 23px;
        }
        .auto-style8 {
            width: 146px;
            height: 23px;
        }
        .auto-style9 {
            height: 23px;
        }
        .auto-style3 {
            width: 400px;
        }
        .auto-style4 {
            width: 146px;
        }
        .auto-style10 {
            width: 223px;
            height: 23px;
        }
        .auto-style11 {
            width: 223px;
        }
        .auto-style12 {
            width: 223px;
            height: 137px;
        }
        .auto-style13 {
            width: 400px;
            height: 137px;
        }
        .auto-style14 {
            width: 146px;
            height: 137px;
        }
        .auto-style15 {
            height: 137px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
                    &nbsp;<asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style7"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style9"></td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblModificarMedico" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Turnos Asignados"></asp:Label>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">
                        <asp:Label ID="lblFiltrar" runat="server" Font-Size="Large" Text="Filtrar por paciente:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtFiltrado" runat="server" Width="283px"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" Width="91px" OnClick="btnFiltrar_Click" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:RequiredFieldValidator ID="rfvPacienteVacio" runat="server" ControlToValidate="txtFiltrado">Ingrese un paciente</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style13">
                        <asp:GridView ID="gvTurnos" runat="server" AutoGenerateColumns="False" Width="538px" Height="106px">
                            <Columns>
                                <asp:TemplateField HeaderText="DNI Paciente">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_It_Paciente" runat="server" Text='<%# Bind("DNIPaciente_Turnos") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Turno">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_It_Turno" runat="server" Text='<%# Bind("Cod_Turno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Especialidad">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_It_Especialidad" runat="server" Text='<%# Bind("CodEspecialidad_Medico") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Legajo Medico">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_It_Medico" runat="server" Text='<%# Bind("LegajoMedico_Turnos") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dia">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_It_Dia" runat="server" Text='<%# Bind("Dia_Turnos") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Horario">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_It_Horario" runat="server" Text='<%# Bind("Horarios_Turnos") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style15"></td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
