using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Entidades;
using Negocio;

namespace TP_INTEGRADOR_15
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        private void LimpiarCampos()
        {
            TB_UserName.Text = string.Empty;
            TB_Password.Text = string.Empty;
        }

        // VALIDACIÓN DE DATOS INGRESADOS ( LOGUEO ADMIN & DOCTOR )
        protected void BTN_Enviar_Click(object sender, EventArgs e)
        {

            LBL_Error.Text = string.Empty;

            NegocioLogin NegLogin = new NegocioLogin();
            int Respuesta = NegLogin.ValidarLogin(TB_UserName.Text, TB_Password.Text);

            if (Respuesta == 1) {
                DIV_Login.Visible = false;
                DIV_InterfazAdmin.Visible = true;
            }
            else if (Respuesta == 2){
                DIV_Login.Visible = false;
                DIV_InterfazMedico.Visible = true;
            }
            else
            {
                LBL_Error.Text = "Usuario o contraseña incorrectos.";
            }

            LimpiarCampos();

        }
    }
}