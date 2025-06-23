using Negocio;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INTEGRADOR_15
{
    public partial class Informe1 : System.Web.UI.Page
    {
        NegocioTurnos negocioTurnos = new NegocioTurnos();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Usuario"] == null)
            //{
            //    // Si el Session no contiene el usuario, redirigir a la página de inicio de sesión
            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{
            //    lblNombreUsuario.Text = Session["Usuario"].ToString();
            //}

            if (!IsPostBack)
            {
                CargarMeses();
                CargarAnios();
            }
        }

        private void CargarMeses()
        {
            ddlMes.DataSource = negocioTurnos.ObtenerMeses();
            ddlMes.DataTextField = "Mes";
            ddlMes.DataValueField = "Mes";
            ddlMes.DataBind();
            ddlMes.Items.Insert(0, new ListItem("Elija un mes", ""));
        }

        private void CargarAnios()
        {
            ddlAnio.DataSource = negocioTurnos.ObtenerAnios();
            ddlAnio.DataTextField = "Anio";
            ddlAnio.DataValueField = "Anio";
            ddlAnio.DataBind();
            ddlAnio.Items.Insert(0, new ListItem("Elija un año", ""));
        }

        protected void btnGenerarInforme_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlMes.SelectedValue) && !string.IsNullOrEmpty(ddlAnio.SelectedValue))
            {
                int mes = int.Parse(ddlMes.SelectedValue);
                int anio = int.Parse(ddlAnio.SelectedValue);

                // Acá implementarías la lógica para obtener el médico con más turnos en ese mes/año
                // Podés seguir usando la capa de Datos o crear una nueva función en Negocio

                string legajoMedico = negocioTurnos.ObtenerMedicoConMasTurnos(mes, anio);


                if (!string.IsNullOrEmpty(legajoMedico))
                {
                    lblResultado.Text = $"Legajo del médico con más turnos en {mes}/{anio}: {legajoMedico}";
                }
                else
                {
                    lblResultado.Text = $"No hay turnos registrados en {mes}/{anio}.";
                }
            }

            CargarMeses();
            CargarAnios();

        }
    }
}
