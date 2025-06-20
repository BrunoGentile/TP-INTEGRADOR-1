using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Datos;
using Entidades;

namespace Negocio
{
    public class NegocioLogin
    {

        // [+] ---------- CONSTRUCTORES ---------- [+]

            // <+> CONSTRUCTOR POR DEFECTO
        public NegocioLogin(){}

        // [+] ---------- MÉTODOS ---------- [+]

            // <+> VALIDACIÓN DE USUARIOS
        public int ValidarLogin(string Legajo, string Password)
        {

            int Respuesta = 0;

            if ( Legajo.Length == 8 && Legajo.StartsWith("ADM") )
            {
                GestionAdministradores _GestionAdmin = new GestionAdministradores();
                Respuesta = _GestionAdmin.ValidarLogin(Legajo, Password);
            }
            else if ( Legajo.Length == 8 && Legajo.StartsWith("MED") )
            {
                GestionMedicos _GestionMedicos = new GestionMedicos();
                Respuesta = _GestionMedicos.ValidarLogin(Legajo, Password);
            }
            else
            {
                Respuesta = 0; // USUARIO NO VÁLIDO
            }

            return Respuesta;

        }

    }
}
