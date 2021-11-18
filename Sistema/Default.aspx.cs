using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bVolverLogin_Click(object sender, ImageClickEventArgs e)
        {
            pPortada.Visible = true;
            pLogin.Visible = false;
        }

        protected void bPortada_Click(object sender, ImageClickEventArgs e)
        {
            pPortada.Visible = false;
            pLogin.Visible = true;
        }

        protected void bRegistrarse_Click(object sender, ImageClickEventArgs e)
        {
            pLoginMenu.Visible = false;
            pRegistrarse.Visible = true;
        }

        protected void bRegistrarseVolverLoginU13_Click(object sender, ImageClickEventArgs e)
        {
            pLoginMenu.Visible = false;
            pPortada.Visible = true;
        }

        protected void bRegistraseU_Click(object sender, ImageClickEventArgs e)
        {
            bool ok = true;

            LimpiarErroresRegistroU();

            TNombreU.Text = TNombreU.Text.Trim().ToUpper();
            if (Comprobar(TNombreU.Text) == false)
            {
                ArreglarCampo(TNombreU);
                ok = false;
                iNombreU.Text = "El nombre contiene caracteres invalidos, fueron quitados";
                iNombreU.Visible = true;
            }
            tApellidoU.Text = tApellidoU.Text.Trim().ToUpper();
            if (Comprobar(tApellidoU.Text) == true)
            {
                ArreglarCampo(tApellidoU);
                ok = false;
                tApellidoU.Text = "El apellido contiene caracteres invalidos, fueron quitados";
                tApellidoU.Visible = true;
            }
            tDocU.Text = tDocU.Text.Trim().ToUpper();
            if (Comprobar(tDocU.Text) == false || IsNumeric(tDocU.Text))
            {
                SoloNumeros(tDocU);
                ok = false;
                tDocU.Text = "El documento no era valido, se ajusto a numero.";
                tDocU.Visible = true;
            }
            ArreglarCampo(tEmailU);
            if (ValidateEmail(tEmailU.Text) == false)
            {
                ok = false;
                tDocU.Text = "El email no es valido";
                tDocU.Visible = true;
            }

            if (ok)
            {
                pRegistrarse.Visible = false;
                pBienvenido.Visible = true;
            }

        }

        protected void bRegistrarseU0_Click(object sender, ImageClickEventArgs e)
        {
            pLoginMenu.Visible = false;
            pRegistrarse.Visible = true;
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            pBienvenido.Visible = false;
            pLogin.Visible = true;
        }
        public void ArreglarCampo(TextBox campo)
        {
            campo.Text = campo.Text.Trim().Replace("'", "").Replace("*", "").Replace("+", "").Replace("-", "").Replace("/", "").Replace(":", "").Replace("`", "").Replace("<", "").Replace(">", "").Replace("=", "").Replace("&", "");
        }

        public bool Comprobar(string user)
        {
            if (string.IsNullOrEmpty(user))
            {
                return true;
            }
            else
            {
                bool aux = true;
                string listanega = "'*+-/:;`><&" + "\"\"";
                if (user != "")
                {
                    foreach (var x in user)
                    {
                        if (aux == true)
                        {
                            if (listanega.IndexOf(x) > 0)
                            {
                                aux = false;
                            }
                            else
                            {
                                aux = true;
                            }
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
                if (aux == true)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public void LimpiarErroresRegistroU()
        {
            IErroresU.Text = "";
            IErroresU.Visible = false;
            IEFNac.Visible = false;
            IEFNac.Text = "";
            iNombreU.Text = "";
            iApellidoU.Text = "";
            iDocU.Text = "";
            iEmailU.Text = "";
            iLocalidadU.Text = "";
            iDireccionU.Text = "";
            iTelefonosU.Text = "";
            iUsuarioU.Text = "";
            iPassU.Text = "";
            iPass2U.Text = "";
            iNombreU.Visible = false;
            iApellidoU.Visible = false;
            iDocU.Visible = false;
            iEmailU.Visible = false;
            iLocalidadU.Visible = false;
            iDireccionU.Visible = false;
            iTelefonosU.Visible = false;
            iUsuarioU.Visible = false;
            iPassU.Visible = false;
            iPass2U.Visible = false;

        }

        public void LimpiarRegistroU()
        {
            LimpiarRegistroU();
            LimpiarErroresRegistroU();
            pRegistrarse.Visible = false;
            TNombreU.Text = "";
            tApellidoU.Text = "";
            dTDocU.SelectedIndex = 0;
            tDocU.Text = "";
            tApellidoU.Text = "";
            dTDocU.SelectedIndex = 0;
            tDocU.Text = "";
            tEmailU.Text = "";
            didProvU.SelectedIndex = 0;
            tLocalidadU.Text = "";
            tDireccionU.Text = "";
            tTelefonosU.Text = "";
            tUsuarioU.Text = "";
            tPassU.Text = "";
            tPass2U.Text = "";
        }

        public bool ValidateEmail(string email)
        {
            Regex emailRegex = new Regex("^(?<user>[^@]+)@(?<host>.+)$");

            var emailMatch = emailRegex.Match(email);

            return emailMatch.Success;
        }

        public void SoloNumeros(TextBox campo)
        {
            string cam = campo.Text.Trim();
            string salida = "";

            foreach (var c in cam)
            {
                if (IsNumeric(c.ToString()))
                {
                    salida += c;
                }
                campo.Text = salida;
            }
        }

        public bool IsNumeric(string val)
        {
            return int.TryParse(val, out int result);
        }


    }



}