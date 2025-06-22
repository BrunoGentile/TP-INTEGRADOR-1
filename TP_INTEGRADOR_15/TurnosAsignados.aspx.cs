using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INTEGRADOR_15
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* ACORDARSE DE DESCOMENTAR CUANDO TERMINE LAS PRUEBAS
            if (Session["Usuario"] == null)
            {
                // Si el Session no contiene el usuario, redirigir a la página de inicio de sesión
                Response.Redirect("Login.aspx");
            } else
            {
                lblNombreUsuario.Text = Session["Usuario"].ToString();
            }
            */

            if (!IsPostBack)
            {
                cargarGridView();
            }
        }

        public void cargarGridView()
        {
            NegocioTurnos negocioTurnos = new NegocioTurnos();
            gvTurnos.DataSource = negocioTurnos.ObtenerTurnos();
            gvTurnos.DataBind();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            NegocioTurnos negocioTurnos = new NegocioTurnos();

            DataTable dtFiltrado = negocioTurnos.filtrarTurnosPorPaciente(txtFiltrado.Text.Trim());
            gvTurnos.DataSource = dtFiltrado;
            gvTurnos.DataBind();

            // Limpiar el textBox después de filtrar
            txtFiltrado.Text = string.Empty;
        }
    }
}