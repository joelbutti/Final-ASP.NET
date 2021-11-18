<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sistema.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema</title>
    <style type="text/css">
        #form1 {
            width: 767px;
            height: 886px;
            margin: auto auto;
        }

        .auto-style1 {
            width: 607px;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style3 {
            height: 847px;
            margin-bottom: 0px;
        }
        .auto-style4 {
            height: 54px;
        }
    </style>
</head>
<body bgcolor="#ffffff">
    <form id="form1" runat="server" class="auto-style3">
        <asp:Panel ID="pPortada" runat="server" Height="350px" Width="765px">
            <asp:ImageButton ID="bPortada" runat="server" ImageAlign="Middle" ImageUrl="imagenes/portada.jpg" OnClick="bPortada_Click" />
        </asp:Panel>

        <asp:Panel ID="pLogin" runat="server" Height="498px" Font-Bold="true" ForeColor="Blue" Width="757px"
            Font-Size="Large" BorderStyle="Solid" Visible="false">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="lVersion" Text="Version" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="#999999" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label104" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Ingresa tu usuario y clave, y oprimi ENTRAR!"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%;">
                <tr>
                    <td align="center">
                        <asp:Label ID="Label22" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Usuario:"></asp:Label>
                        <asp:TextBox ID="tUsuario" runat="server" ForeColor="White" MaxLength="10" BackColor="#333333" Height="31px"></asp:TextBox>
                    </td>

                    <td align="center">
                        <asp:Label ID="Label23" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Clave:"></asp:Label>
                        <asp:TextBox ID="tClave" runat="server" ForeColor="White" MaxLength="10" TextMode="Password" BackColor="#333333" Height="29px"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/entrar.png" OnClick="ImageButton1_Click" />
                    </td>
                </tr>
            </table>
            <table style="width: 100%;">
                <tr>
                    <td align="center" class="auto-style1">
                        <asp:ImageButton ID="bRecuperarClave" runat="server" ImageUrl="~/imagenes/reenviarclave.png" />
                    </td>
                    <td>[Reenviar Clave]</td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1" style="color: #FF0000">
                        <asp:Label ID="IErrorLogin" runat="server" Text="IErrorLogin" Visible="False"></asp:Label>
                    </td>

                </tr>
            </table>

            <table class="auto-style2">
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bVolverLogin" runat="server" Height="68px" ImageUrl="imagenes/terminarvolver.png" OnClick="bVolverLogin_Click" Width="259px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pLoginMenu" runat="server" Height="392px" Font-Bold="true" ForeColor="Blue" Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="false">
            <table class="auto-style2">
                <tr>
                    <td align="center">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/registrate.png" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bRegistrarse" runat="server" ImageUrl="~/imagenes/registrateaqui.png" Width="750px" OnClick="bRegistrarse_Click" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="BAlogin" runat="server" ImageUrl="~/imagenes/yaregistrado.png" Width="750px" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bRegistrarseVolverLoginU13" runat="server" ImageUrl="~/imagenes/terminarvolver.png" OnClick="bRegistrarseVolverLoginU13_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="pRegistrarse" runat="server" BorderColor="#66CCFF" Height="1107px" Visible="false" ForeColor="#372C57" Style="margin-right: 0px" Font-Size="Large">
            <table style="width: 100%;">
                <tr>
                    <td align="center">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/registrarsetitulo.png" />
                    </td>
                </tr>

                <tr>
                    <td>Para poder registrarte debes ser mayor de 18 años, residir en Argentina y contar con documento valido en Argentina que acredite tu identidad.<br />
                        Solo se puede hacer un registro por documento. Los datos deben ser reales, correctos y vigentes.<br />
                        Todos los datos a continuacion (menos Origen) son obligatorios:
                     
                    </td>
                </tr>

            </table>
            <br />
            <table class="auto-style2">


                <tr>
                    <td>Tu/s Nombre/s:</td>
                    <td>
                        <asp:TextBox ID="TNombreU" runat="server" BackColor="#333333" ForeColor="White" Height="29px" MaxLength="20" Width="314px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td style="color: #FF0000">
                        <asp:Label ID="iNombreU" runat="server" Text="ENombreU" Visible="False"></asp:Label>
                    </td>
                </tr>



                <tr>
                    <td>Apellido/s:</td>
                    <td>
                        <asp:TextBox ID="tApellidoU" runat="server" BackColor="#333333" ForeColor="White" Height="29px" MaxLength="20" Width="314px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td style="color: #FF0000">
                        <asp:Label ID="iApellidoU" runat="server" Text="EApellidoU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Tipo Doc:</td>
                    <td>
                        <asp:DropDownList ID="dTDocU" runat="server" BackColor="#333333" ForeColor="White" Height="16px" Width="314px" Font-Size="X-Large">
                            <asp:ListItem Value="DNI">Doc. Nacional De Identidad</asp:ListItem>
                            <asp:ListItem>Libreta Civica</asp:ListItem>
                            <asp:ListItem>Libreta de enrolamiento</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>N de Doc. (sin puntos ni espacios):</td>
                    <td>
                        <asp:TextBox ID="tDocU" runat="server" BackColor="#333333" ForeColor="White" Height="29px" Width="310px" MaxLength="8" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td style="color: #FF0000">
                        <asp:Label ID="iDocU" runat="server" Text="EDocU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Fecha Nac: (ddmmaa)</td>
                    <td class="auto-style4">
                        &nbsp;<asp:TextBox ID="tF_Nac" runat="server" BackColor="#333333" Font-Size="X-Large" ForeColor="White" Height="41px" MaxLength="6" Width="146px"></asp:TextBox>
                        &nbsp;<asp:Label ID="IEdad" runat="server" Text="IEdad:"></asp:Label>
                        &nbsp;0</td>
                    <td style="color: #FF0000" class="auto-style4">
                        <asp:Label ID="IEFNac" runat="server" Text="IEFNac" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Email valido para notificaciones:</td>
                    <td>
                        <asp:TextBox ID="tEmailU" runat="server" BackColor="#333333" ForeColor="White" Height="50px" TextMode="MultiLine" Width="308px" MaxLength="70" Rows="2" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td style="color: #FF0000">
                        <asp:Label ID="iEmailU" runat="server" Text="EEmailU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Provincia:</td>
                    <td>
                        <asp:DropDownList ID="didProvU" runat="server" BackColor="#333333" ForeColor="White" Height="66px" Width="312px" Font-Size="X-Large">
                            <asp:ListItem>Buenos Aires</asp:ListItem>
                            <asp:ListItem>Catamarca</asp:ListItem>
                            <asp:ListItem>Chaco</asp:ListItem>
                            <asp:ListItem>Chubut</asp:ListItem>
                            <asp:ListItem>Caba</asp:ListItem>
                            <asp:ListItem>Cordoba</asp:ListItem>
                            <asp:ListItem>Corrientes</asp:ListItem>
                            <asp:ListItem>Entre Rios</asp:ListItem>
                            <asp:ListItem>Formosa</asp:ListItem>
                            <asp:ListItem>Jujuy</asp:ListItem>
                            <asp:ListItem>La Pampa</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Localidad:</td>
                    <td>
                        <asp:TextBox ID="tLocalidadU" runat="server" BackColor="#333333" ForeColor="White" Height="29px" Width="300px" MaxLength="25" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td style="color: #FF0000">
                        <asp:Label ID="iLocalidadU" runat="server" Text="ELocalidadU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td>
                        <asp:TextBox ID="tDireccionU" runat="server" BackColor="#333333" ForeColor="White" Height="45px" TextMode="MultiLine" Width="298px" MaxLength="100" Rows="2" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td style="color: #FF0000">
                        <asp:Label ID="iDireccionU" runat="server" Text="EDireccionU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Telefono (agregue caracteristica):</td>
                    <td>
                        <asp:TextBox ID="tTelefonosU" runat="server" BackColor="#333333" ForeColor="White" Height="29px" Width="289px" MaxLength="25" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td style="color: #FF0000">
                        <asp:Label ID="iTelefonosU" runat="server" Text="ETelefonosU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td>
                        <asp:TextBox ID="tUsuarioU" runat="server" BackColor="#333333" ForeColor="White" Height="29px" Width="191px" MaxLength="10" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td style="color: #FF0000">
                        <asp:Label ID="iUsuarioU" runat="server" Text="EUsuarioU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Clave:</td>
                    <td>
                        <asp:TextBox ID="tPassU" runat="server" BackColor="#333333" ForeColor="White" Height="29px" Width="191px" MaxLength="10" TextMode="Password" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td style="color: #FF0000">
                        <asp:Label ID="iPassU" runat="server" Text="EPassU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Repetir Clave:</td>
                    <td>
                        <asp:TextBox ID="tPass2U" runat="server" BackColor="#333333" ForeColor="White" Height="29px" Width="189px" MaxLength="10" TextMode="Password" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td style="color: #FF0000">
                        <asp:Label ID="iPass2U" runat="server" Text="EPass2U" Visible="False"></asp:Label>
                    </td>
                </tr>




            </table>

            <br />
            <asp:Label ID="IErroresU" runat="server" Text="IErroresU" ForeColor="Red" Visible="False"></asp:Label>


            <table class="auto-style2">

                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bRegistraseU" runat="server" ImageUrl="~/imagenes/registrarse.png" OnClick="bRegistraseU_Click"/>
                    </td>
                    <td align="center">
                        <asp:ImageButton ID="bRegistrarseU0" runat="server" ImageUrl="~/imagenes/cancelarvolver.png" OnClick="bRegistrarseU0_Click" />
                    </td>
                </tr>

            </table>
        </asp:Panel>

        <asp:Panel ID="pBienvenido" runat="server" BorderColor="#66CCFF" Height="535px" Visible="false" ForeColor="#372C57" Font-Size="Large">
            <table style="width:100%;">
                <tr>
                    <td align="center">
                        <asp:Label ID="Label105" runat="server" Font-Size="X-Large" ForeColor="#666666" Text="Bienvenido/a !!"></asp:Label>
                    </td>
                </tr>
               
                
                <tr>
                    <td align="center">
                      
                    </td>
                </tr>
            </table>
            <br />
            <table style="width:100%;">
                
                <tr>
                    <td>
                        Ya estas anotado en los cursos de ASP.NET!
                        <br />
                        (Escribi aca las condiciones de uso de la aplicacion, o las cosas que puede hacer el usuario para orientarlo en su primer uso, o lo que quieras!.... extendete todo lo que necesites...)
                        <br />
                        Nos alegra mucho que estes con nosotros. El equipo de cursos de Guillermo (Far)
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bRegistrarseVolverLoginU" runat="server" ImageUrl="~/imagenes/todook.png" OnClick="ImageButton2_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
