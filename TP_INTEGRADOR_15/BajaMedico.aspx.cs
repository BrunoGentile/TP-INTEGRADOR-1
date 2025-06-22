using Negocio;
using System;
using System.Data;
using System.Web.UI.WebControls;

using Entidades;

namespace TP_INTEGRADOR_15
{
    public partial class BajaMedico : System.Web.UI.Page
    {
        NegocioMedicos negocio = new NegocioMedicos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarGridMedicos();
            }
        }

        private void CargarGridMedicos()
        {
            DataTable dt = negocio.ObtenerMedicos(); // trae todos los médicos activos
            gvMedico.DataSource = dt;
            gvMedico.DataBind();
        }

        protected void gvMedico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DarDeBaja")
            {
                string legajo = e.CommandArgument.ToString();
                try
                {
                    negocio.DarDeBajaMedico(legajo);
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                    lblMensaje.Text = "Médico dado de baja correctamente.";
                    CargarGridMedicos();
                }
                catch (Exception ex)
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "Error al dar de baja: " + ex.Message;
                }
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            NegocioMedicos negocioMedicos = new NegocioMedicos();

            DataTable dtFiltrado = negocioMedicos.filtrarMedicosPorLegajo(txtLegajo.Text.Trim());
            gvMedico.DataSource = dtFiltrado;
            gvMedico.DataBind();

            // Limpiar el textBox después de filtrar
            txtLegajo.Text = string.Empty;
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            CargarGridMedicos();
        }
    }
}