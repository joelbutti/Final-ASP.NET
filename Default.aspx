<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="Sistema._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sistema</title>
    <style type="text/css">
        #form1 {
            width: 767px;
            height: auto 886px;
            margin: auto auto;
            margin-top: auto;
            margin-bottom: auto;
        }

        .auto-style2 {
            height: 24px;
        }

        .auto-style3 {
            height: 76px;
        }

        .auto-style4 {
            height: 24px;
            width: 138px;
        }

        .auto-style5 {
            width: 113px;
        }

        .auto-style6 {
            width: 126px;
        }
    </style>
</head>
<body bgcolor="fffffff">
    <form id="form1" runat="server">
        <asp:Panel ID="pPortada" runat="server" Height="350px" Width="765px">
            <asp:ImageButton ID="bPortada" runat="server" ImageAlign="Middle" ImageUrl="~/imagenes/portada.jpg" />
        </asp:Panel>

        <br />
        <br />


        <asp:Panel ID="pLoguin" runat="server" BorderStyle="Solid" ForeColor="#003366" Visible="false">
            <table style="width: 100%">
                <tr>
                    <td colspan="5" class="auto-style3" align="Center">
                        <h2>Ingrese su usuario y contraseña
                            <br />
                            <br />
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <h2>Usuario :</h2>
                    </td>
                    <td class="auto-style2" align="Center">
                        <asp:TextBox ID="tUsuario" runat="server" Height="25px" MaxLength="10" ForeColor="#33CCFF" BackColor="#003366"></asp:TextBox>
                    </td>

                    <td class="auto-style2">
                        <h2>Clave :</h2>
                    </td>
                    <td class="auto-style2" align="Center">
                        <asp:TextBox ID="tClave" runat="server" Height="25px" TextMode="Password" MaxLength="10" ForeColor="#33CCFF" BackColor="#003366"></asp:TextBox>
                    </td>

                    <td class="auto-style2" align="Center">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" ImageUrl="~/imagenes/entrar.png" />
                    </td>
                    <td class="auto-style2" align="Center">
                        <asp:Button ID="bAdministrador" Text="Soy Admin" runat="server" BackColor="LightBlue" />
                    </td>
                </tr>
                <tr>
                    <td colspan="5" align="Center">
                        <asp:Label ID="lErrorLoguin" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>

            <br />

            <table style="width: 100%">
                <tr>
                    <td>
                        <asp:ImageButton ID="bRecuperarClave" runat="server" ImageUrl="~/imagenes/reenviarclave.png" ImageAlign="Middle" />
                    </td>
                    <td>
                        <asp:Label ID="lReenviarClave" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>

            <br />
            <br />

            <table width="765px">
                <tr>
                    <td align="Center">
                        <asp:ImageButton ID="bVolverLoguin" runat="server" ImageUrl="~/imagenes/terminarvolver.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table>


        </asp:Panel>

        <br />
        <br />


        <asp:Panel ID="pLoguinMenu" runat="server" Height="392px" Font-Bold="true" Width="765px" ForeColor="Blue" Font-Size="Large" BorderStyle="Solid" Visible="false">

            <table>
                <tr>
                    <td width="750px" align="Center">
                        <asp:Image runat="server" ImageUrl="~/imagenes/registrate.png" Height="55px" />
                    </td>
                </tr>
                <tr>
                    <td width="750px" align="Center">
                        <asp:ImageButton runat="server" ImageUrl="~/imagenes/registrateaqui.png" ImageAlign="Middle" ID="bRegistrase" />
                    </td>
                </tr>
                <tr>
                    <td width="750px" align="Center">
                        <asp:ImageButton runat="server" ImageUrl="~/imagenes/yaregistrado.png" ImageAlign="Middle" ID="bEntrarAqui" />
                    </td>
                </tr>
                <tr>
                    <td width="750px" align="Center">
                        <asp:ImageButton runat="server" ImageUrl="~/imagenes/terminarvolver.png" ImageAlign="Middle" Height="70px" ID="bRegistrarseVolverLoguinU13" />
                    </td>
                </tr>

            </table>


        </asp:Panel>

        <br />
        <br />


        <asp:Panel ID="pRegistrarse" runat="server" BorderColor="#66CCFF" Height="900px" Visible="false" ForeColor="#372C57" Style="margin-right: 0px" Font-Size="Large">

            <table style="width: 100%;">
                <tr>
                    <td width="765px" align="Center">
                        <asp:Image runat="server" ImageUrl="~/imagenes/registrarsetitulo.png" ImageAlign="Middle" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>Para poder registrarse debe ser mayor de 18 años, residir en Argentina y contar con documentos válido en Argentina que acredite tu identidad.<br />
                            Solo se puede hacer un registro por docmento. Los datos deben ser reales, correctos y vigentes.<br />
                            Todos los datos a continuación(menos Origen) son obligatorios:</h3>
                    </td>
                </tr>

            </table>

            <br />

            <table width="765px">
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Tu/s Nombre/s :</h2>
                    </td>

                    <td width="315px">
                        <asp:TextBox ID="tNombreU" runat="server" MaxLength="20" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="35px" Font-Size="X-Large"></asp:TextBox>
                    </td>

                    <td align="Center">
                        <asp:Label ID="lENombreU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Apellido/s : </h2>
                    </td>

                    <td width="315px">
                        <asp:TextBox ID="tApellidoU" runat="server" MaxLength="20" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="35px" Font-Size="X-Large"></asp:TextBox>
                    </td>

                    <td align="Center">
                        <asp:Label ID="lEApellidoU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Tipo de Doc :</h2>
                    </td>
                    <td>
                        <asp:DropDownList ID="dTDocU" runat="server" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="35px" Font-Size="X-Large">
                            <asp:ListItem Value="DNI">Doc. Nacional de Identidad</asp:ListItem>
                            <asp:ListItem Value="LC">Libreta Civica</asp:ListItem>
                            <asp:ListItem Value="LE">Libreta de Enrolamiento</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp</td>
                </tr>
                <tr>
                    <td height="35px" class="auto-style5">
                        <h2 class="auto-style6">N° de Doc:</h2>
                    </td>

                    <td height="35px" style="width: 127px" width="255px">
                        <h6>(Sin puntos ni espacios)</h6>
                    </td>

                    <td width="315">
                        <asp:TextBox ID="tDocU" runat="server" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="35px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lEDocU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Fecha Nac : ddmmaa</h2>
                    </td>
                    <td>
                        <asp:TextBox ID="tF_Nac" runat="server" ForeColor="#33CCFF" BackColor="#003366" Width="140px" Height="35px" Font-Size="X-Large"></asp:TextBox>
                        &nbsp;
                         <asp:Label ID="lEdadU" runat="server" BackColor="#3FFFFF" Font-Size="X-Large" ForeColor="#003366" Text="0"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp; AÑOS</td>
                    <td align="Center">
                        <asp:Label ID="lEEdadU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Email :</h2>
                    </td>
                    <td>
                        <asp:TextBox ID="tEmailU" runat="server" MaxLength="70" Rows="2" TextMode="MultiLine" Width="305px" Height="35px" ForeColor="#33CCFF" BackColor="#003366" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lEEmailU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Provincia :</h2>
                    </td>
                    <td width="315px">
                        <asp:DropDownList ID="dProvinciaU" runat="server" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="35px" Font-Size="X-Large">
                            <asp:ListItem Value="1">Buenos Aires</asp:ListItem>
                            <asp:ListItem Value="2">CABA</asp:ListItem>
                            <asp:ListItem Value="3">Catamarca</asp:ListItem>
                            <asp:ListItem Value="4">Chaco</asp:ListItem>
                            <asp:ListItem Value="5">Chubut</asp:ListItem>
                            <asp:ListItem Value="6">Córdoba</asp:ListItem>
                            <asp:ListItem Value="7">Corrientes</asp:ListItem>
                            <asp:ListItem Value="8">Entre Rios</asp:ListItem>
                            <asp:ListItem Value="9">Formosa</asp:ListItem>
                            <asp:ListItem Value="10">Jujuy</asp:ListItem>
                            <asp:ListItem Value="11">La Pampa</asp:ListItem>
                            <asp:ListItem Value="12">La Rioja</asp:ListItem>
                            <asp:ListItem Value="13">Mendoza</asp:ListItem>
                            <asp:ListItem Value="14">Misiones</asp:ListItem>
                            <asp:ListItem Value="15">Neuqúen</asp:ListItem>
                            <asp:ListItem Value="16">Río Negro</asp:ListItem>
                            <asp:ListItem Value="17">Salta</asp:ListItem>
                            <asp:ListItem Value="18">San Juan</asp:ListItem>
                            <asp:ListItem Value="19">San Luis</asp:ListItem>
                            <asp:ListItem Value="20">Santa Cruz</asp:ListItem>
                            <asp:ListItem Value="21">Santa Fe</asp:ListItem>
                            <asp:ListItem Value="22">Santiago del Estero</asp:ListItem>
                            <asp:ListItem Value="23">Tierra del Fuego</asp:ListItem>
                            <asp:ListItem Value="24">Tucumán</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Localidad :</h2>
                    </td>
                    <td>
                        <asp:TextBox ID="tLocalidadU" runat="server" MaxLength="25" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="35px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lELocalidadU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Dirección :</h2>
                    </td>
                    <td>
                        <asp:TextBox ID="tDireccionU" runat="server" MaxLength="70" Rows="2" TextMode="MultiLine" ForeColor="#33CCFF" BackColor="#003366" Height="35px" Width="305px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lEDireccionU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Télefono :</h2>
                    </td>
                    <td>
                        <asp:TextBox ID="tTelefonosU" runat="server" MaxLength="25" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="35px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lETelefonosU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Usuario :</h2>
                    </td>
                    <td>
                        <asp:TextBox ID="tUsuarioU" runat="server" MaxLength="10" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="35px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lEUsuarioU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px" height="35px" colspan="2">
                        <h2>Clave :</h2>
                    </td>
                    <td>
                        <asp:TextBox ID="tClaveU" runat="server" MaxLength="10" TextMode="Password" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="35px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lEClaveU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px" height="35pz" colspan="2">
                        <h2>Repetir Clave :</h2>
                    </td>
                    <td>
                        <asp:TextBox ID="tRepetirClaveU" runat="server" MaxLength="10" TextMode="Password" ForeColor="#33CCFF" BackColor="#03366" Width="305px" Height="35px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lERepetirClaveU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>

            <br />

            <asp:Label ID="lErroresU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>

            <br />
            <br />

            <table width="765px">
                <tr>
                    <td>
                        <asp:ImageButton ID="bRegistrarseU" runat="server" ImageUrl="~/imagenes/registrarse.png" ImageAlign="Middle" Width="300px" />
                    </td>
                    <td>
                        <asp:ImageButton ID="bRegistrarseUO" runat="server" ImageUrl="~/imagenes/cancelarvolver.png" ImageAlign="Middle" Width="300px" />
                    </td>
                </tr>
            </table>

        </asp:Panel>

        <asp:Panel ID="pValidarEmail" runat="server" Height="392px" Font-Bold="true" ForeColor="Blue" Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="false">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="Label5" Text="Version" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="#999999" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label6" runat="server" Font-Bold="true" Font-Size="X-Large"
                            Text="Le hemos enviado un codigo de verificacion al mail que ingreso. Abra el mail, copie el codigo y peguelo en el cuadro de texto a continuacion. Luego oprima 'Validar el codigo'. Para corregir algun dato ingresado, oprima 'Regresar al registro' o bien 'Cancelar y Volver' para anular la operacion y volver al Login."></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%; text-align: center;">
                <tr>
                    <td align="center">
                        <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Ingrese codigo de verificacion:"></asp:Label>
                        <asp:TextBox ID="tValidar" runat="server" ForeColor="White" MaxLength="10" BackColor="#333333" Height="31px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lCodigo" runat="server" ForeColor="Red" Text="**Codigo Incorrecto**" Visible="False"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="bValidar" BackColor="LightGreen" runat="server" Text="Validar el codigo" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="bRegresarRegistro" runat="server" BackColor="Yellow" Text="Regresar al registro" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:ImageButton ID="bCancelarValidar" runat="server" ImageUrl="~/imagenes/cancelarvolver.png" ImageAlign="Middle" Width="300px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <br />

        <asp:Panel ID="pBienvenidos" runat="server" BorderColor="#66CCFF" Height="335px" ForeColor="#372C57" Font-Size="Large" Visible="false">

            <table>
                <tr>
                    <td class="auto-style40" align="center">
                        <asp:Label ID="lBienvenido" runat="server" Font-Size="X-Large" Text="Bienvenido/a!!"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="Center">
                        <h2>Ya estas anotado en los cursos de ASP.NET!
                            <br />
                            Nos Alegra mucho que estes con Nosotros. El equipo de cursos de Guillermo (poné tu empresa o a vos...)
                            <br />
                            <br />
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td align="Center">
                        <asp:ImageButton ID="bTodook" runat="server" ImageUrl="~/imagenes/todook.png" ImageAlign="Middle" Width="305" Height="70px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <br />

        <%--<-----------------------------------------------Panel Inicio ------------------------------>--%>

        <asp:Panel ID="pAreaUsuario" runat="server" Font-Bold="true" Width="765px" ForeColor="Blue" Font-Size="Large" BorderStyle="Solid" Visible="false" Height="550px">

            <table width="765px">
                <tr>
                    <td align="Center" height="50px">
                        <asp:Label ID="lBienvenidoAreaU" runat="server" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="Center">
                        <asp:ImageButton ID="bAhoraQueHago" runat="server" ImageUrl="~/imagenes/ahora_que_hago.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table>


            <table>
                <tr>
                    <td align="Center" width="765px" height="45px">
                        <asp:Button ID="bVerPedidosGeneral" runat="server" BackColor="LightBlue" Text="Pedidos Generales" Visible="false" Height="45px" Width="300px" />
                        <br />
                        <br />
                        <asp:Button ID="bABMProducto" runat="server" BackColor="LightBlue" Text="ABM Productos" Visible="false" Height="45px" Width="300px" />
                    </td>
                </tr>
                <tr>
                    <td align="Center" width="765px" height="45px">
                        <br />
                        <asp:Button ID="bAdministrarUsuarios" runat="server" BackColor="LightBlue" Text="Administrar Usuarios" Visible="false" Height="45px" Width="300px" />
                    </td>
                </tr>
                <tr>
                    <td align="Center" height="45px">
                        <asp:ImageButton ID="bModificarDatos" runat="server" ImageUrl="~/imagenes/modificardatos.png" ImageAlign="Middle" />
                        <br />
                        <asp:ImageButton ID="bPedidos" runat="server" Height="53px" ImageUrl="~/imagenes/pedidosfabrica.png" Width="258px" />
                    </td>
                </tr>
                <tr>
                    <td align="Center" class="auto-style9">
                        <asp:ImageButton ID="bVolverLoguinU1" runat="server" ImageUrl="~/imagenes/terminarvolver.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table>

        </asp:Panel>

        <%--<------------------------------Panel Administracion usuarios -------------------------------------->--%>

        <asp:Panel ID="pAdministracionUsuarios" runat="server" Font-Bold="true" Width="1000px" ForeColor="Blue" Font-Size="Large" BorderStyle="Solid" Visible="false" Height="750px">

            <table style="width: 994px">
                <tr>
                    <td align="Center" height="50px">
                        <asp:Label Text="Bienvenido al area de Administracion de Usuarios" runat="server" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server">Mensaje que se enviara al usuario: </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox TextMode="MultiLine" ID="tbMensajeAUsuario" runat="server" Height="67px" Width="267px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />

            <asp:GridView ID="gListaUsuarios" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="950px" Height="380px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Desactivar" Text="Desactivar" />
                    <asp:ButtonField ButtonType="Button" CommandName="Activar" HeaderText="Acciones" Text="Activar" />
                    <asp:ButtonField ButtonType="Button" CommandName="Eliminar" Text="Eliminar" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" ReadOnly="True" />
                    <asp:BoundField DataField="Usuario" HeaderText="Usuario" ReadOnly="True" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" />
                    <asp:BoundField DataField="Activo" HeaderText="¿Activo?" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <br />
            <br />
            <br />
            <div align="Center" width="765px" height="45px">
                <asp:Button ID="bSalirAdministracionUsuarios" runat="server" BackColor="Gray" Text="Volver" Width="300" Height="40" />
            </div>

        </asp:Panel>

        <br />

        <%--<---------------------------------------------------- Panel Administracion Productos ------------------------------->--%>

        <asp:Panel ID="pAreaAdministracion" runat="server" Font-Bold="true" Width="765px" ForeColor="Blue" Font-Size="Large" BorderStyle="Solid" Visible="false" Height="452px">

            <table width="765px">
                <tr>
                    <td align="Center" height="50px">
                        <asp:Label Text="Bienvenido al area de Administracion de Productos" runat="server" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
            </table>

            <br />
            <br />
            <br />

            <table>
                <tr>
                    <td align="Center" width="765px" height="45px">
                        <asp:Button ID="bAgregarProducto" runat="server" BackColor="Green" Text="Agregar Producto" Width="300" Height="40" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td align="Center" width="765px" height="45px">
                        <asp:Button ID="bModificarProducto" runat="server" BackColor="Yellow" Text="Modificar Producto" Width="300" Height="40" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            <asp:Label ID="lMensajeProducto" runat="server" Font-Size="Medium" ForeColor="Green" Visible="false"></asp:Label>
            <br />
            <br />
            <br />
            <div align="Center" width="765px" height="45px">
                <asp:Button ID="bVolver" runat="server" BackColor="Gray" Text="Volver" Width="300" Height="40" />
            </div>

        </asp:Panel>

        <asp:Panel ID="pAgregarProducto" runat="server" Height="500px" ForeColor="#372C57" BackImageUrl="~/imagenes/datospersonales.jpg" Font-Bold="true" Visible="false">

            <table>
                <tr>
                    <td align="Center" height="80px" width="765px">
                        <h1>Agregar Producto</h1>
                    </td>
                </tr>
            </table>

            <br />

            <table width="765px">

                <tr>
                    <td width="255px">
                        <h3>Gusto:</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tGusto" runat="server" MaxLength="70" ForeColor="#33CCFF" BackColor="#003366" Height="28px" Width="305px" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lGusto" runat="server" Visible="false" ForeColor="Red" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>

                <tr>
                    <td width="255px">
                        <h3>Precio sin iva :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tPrecioSinIva" runat="server" MaxLength="70" TextMode="Number" ForeColor="#33CCFF" BackColor="#003366" Height="28px" Width="305px" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lPrecioSinIva" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td></td>
                </tr>

                <tr>
                    <td width="255px">
                        <h3>Stock :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tStock" runat="server" MaxLength="25" TextMode="Number" Width="305px" Height="28px" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lStock" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>

            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            <asp:Label ID="lMensajeErrorProducto" runat="server" Font-Size="Medium" ForeColor="Red" Visible="false"></asp:Label>
            <br />
            <br />
            <table>
                <tr>
                    <td align="center" width="382px">
                        <asp:Button ID="bAgregarProd" runat="server" BackColor="Green" Text="Agregar Producto" Width="300" Height="40" />
                    </td>
                    <td align="Center" width="382px">
                        <asp:Button ID="bSalirAgregar" runat="server" BackColor="Gray" Text="Cancelar" Width="300" Height="40" />
                    </td>
                </tr>

            </table>

        </asp:Panel>

        <%--<---------------- Modificar producto -------------------------->--%>

        <asp:Panel ID="pModificarProducto" runat="server" Height="500px" ForeColor="#372C57" BackImageUrl="~/imagenes/datospersonales.jpg" Font-Bold="true" Visible="false">

            <table>
                <tr>
                    <td align="Center" height="80px" width="765px">
                        <h1>Modificar Producto</h1>
                    </td>
                </tr>
            </table>

            <br />

            <table width="765px">

                <tr>
                    <td width="255px">
                        <h3>Gusto:</h3>
                    </td>
                    <td width="315px">
                        <asp:DropDownList ID="ddlHelados" runat="server" MaxLength="70" ForeColor="#33CCFF" BackColor="#003366" Height="28px" Width="305px" Font-Size="Large"></asp:DropDownList>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lHelados" runat="server" Visible="false" ForeColor="Red" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td width="255px">
                        <h3>Gusto:</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tGustoMod" runat="server" MaxLength="70" ForeColor="#33CCFF" BackColor="#003366" Height="28px" Width="305px" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lGustoMod" runat="server" Visible="false" ForeColor="Red" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>

                <tr>
                    <td width="255px">
                        <h3>Precio sin iva :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tPrecioSinIvaMod" runat="server" MaxLength="70" TextMode="Number" ForeColor="#33CCFF" BackColor="#003366" Height="28px" Width="305px" Font-Size="Large"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td></td>
                </tr>

                <tr>
                    <td width="255px">
                        <h3>Stock :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tStockMod" runat="server" MaxLength="25" TextMode="Number" Width="305px" Height="28px" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            <asp:Label ID="lErrorModificarProducto" runat="server" Font-Size="Medium" ForeColor="Red" Visible="false"></asp:Label>
            <br />
            <br />
            <table>
                <tr>
                    <td align="center" width="382px">
                        <asp:Button ID="bModificarProd" runat="server" BackColor="Yellow" Text="Modificar Producto" Width="300" Height="40" />
                    </td>
                    <td align="Center" width="382px">
                        <asp:Button ID="bSalirModificar" runat="server" BackColor="Gray" Text="Cancelar" Width="300" Height="40" />
                    </td>
                </tr>

            </table>

        </asp:Panel>

        <%--<------------------------------------------ Pedidos Generales --------------------------->--%>

        <asp:Panel ID="pPedidosGenerales" runat="server" Heigth="498px"
            Font-Bolt="True" ForeColor="Blue"
            Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="False">
            &nbsp;<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Historicos de Pedidos Generales y ver Estado<br />
            <br />
            <table style="width: 100%;">
            </table>
            <br />
            <asp:GridView ID="gPedidosGenerales" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="750px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Ver" Text="Ver Pedido" />
                    <asp:ButtonField ButtonType="Button" CommandName="Anular" HeaderText="(solo &quot;Solicitado&quot;)" Text="Anular Pedido" />
                    <asp:ButtonField ButtonType="Button" CommandName="Editar" Text="Editar Pedido" />
                    <asp:BoundField DataField="NPedido" HeaderText="N° Pedido" ReadOnly="True" />
                    <asp:BoundField DataField="Num_Cli" HeaderText="N° Cliente" ReadOnly="True" />
                    <asp:BoundField DataField="fecha" DataFormatString="{0:dd/MM/yyyy HH:mm:tt}" HeaderText="Fecha y Hora" ReadOnly="True" />
                    <asp:BoundField DataField="estado" HeaderText="Estado del Pedido" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style53">&nbsp;</td>
                    <td class="auto-style57">
                        <asp:ImageButton ID="bActualizarPedidosGeneral" runat="server" ImageUrl="~/imagenes/actualizar.png" />
                    </td>
                    <td class="auto-style55">
                        <asp:ImageButton ID="bSalirPedidosGeneral" runat="server" ImageUrl="~/imagenes/terminarvolver.png" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <br />

            <br />
            <br />
        </asp:Panel>

        <%-- <------------------------------------  Editar Pedido -------------------------------> --%>

        <asp:Panel ID="pEditarPedido" runat="server" Heigth="498px"
            Font-Bolt="True" ForeColor="Blue"
            Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="False">
                Editar Pedido
            <asp:Label ID="lNPedidoAEditar" Visible="false" runat="server">
            </asp:Label> 
            <br />

            <br />
            Esta es la lista de su pedido.<br />
            <table style="width: 100%;">
                <tr>
                    <td colspan="2" class="auto-style48">
                        <asp:GridView runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="750px" ID="gEditarPedido">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:ButtonField Text="Quitar" ButtonType="Image" ImageUrl="~/imagenes/quitar.png" CommandName="Quitar" />
                                <asp:BoundField HeaderText="Item Solicitado" DataField="Item" />
                                <asp:BoundField HeaderText="Cant." DataField="Cantidad" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style50">
                        <asp:ImageButton ID="bEnviarPedido" runat="server" ImageUrl="~/imagenes/solicitar.png" />
                    </td>
                    <td class="auto-style49">
                        <asp:ImageButton ID="bSalirVerPedidos" runat="server" ImageUrl="~/imagenes/cancelarpedido.png" />
                    </td>
                </tr>
            </table>

            <br />
            <br />
        </asp:Panel>


        <%--<---------------------------------------Ahora que hago?------------------------------>--%>


        <br />

        <asp:Panel ID="pAhoraQueHago" runat="server" Width="765px" Height="400px" Font-Bold="true" ForeColor="Blue" Visible="false" BorderStyle="Solid" Font-Size="Large">

            <table>
                <tr>
                    <td align="Center">
                        <h1>Te cuento un poco!!</h1>
                    </td>
                </tr>
                <tr>
                    <td align="Center" height="150px">
                        <h3>Aca podes escribir una descripción de un servicio, o como funciona la aplicación.
                            <br />
                            Escribir acorde al destino que le vas a dar al proyecto.
                            <br />
                            La idea es guiar al que se metio en tu aplicación sin saber demasiado sobre dónde se metió.
                            <br />
                            Podés extenderte lo que consideres necesario, inclusive agregar fotos o imagenes para hacer más entendible algún proceso.</h3>
                    </td>
                </tr>
                <tr>
                    <td align="Center" height="45px">
                        <asp:ImageButton ID="bVolverLoguinU2" runat="server" ImageUrl="~/imagenes/terminarvolver.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table>

        </asp:Panel>

        <br />

        <asp:Panel ID="pCambiarDatosPersonalesU" runat="server" Height="700px" ForeColor="#372C57" BackImageUrl="~/imagenes/datospersonales.jpg" Font-Bold="true" Visible="false">

            <table>
                <tr>
                    <td align="Center" height="80px" width="765px">
                        <h1>Cambiar tus datos personales</h1>
                    </td>
                </tr>
            </table>

            <br />

            <table width="765px">

                <tr>
                    <td width="255px">
                        <h3>Email válido para notificaciones:</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tCamEmail" runat="server" MaxLength="70" TextMode="MultiLine" ForeColor="#33CCFF" BackColor="#003366" Height="28px" Width="305px" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="EEmailU" runat="server" Visible="false" ForeColor="Red" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td width="255px">
                        <h3>Provincia :</h3>
                    </td>
                    <td width="315px">
                        <asp:DropDownList ID="dCamProvincia" runat="server" Width="305px" Height="28px" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large">
                            <asp:ListItem Value="1">Buenos Aires</asp:ListItem>
                            <asp:ListItem Value="2">CABA</asp:ListItem>
                            <asp:ListItem Value="3">Catamarca</asp:ListItem>
                            <asp:ListItem Value="4">Chaco</asp:ListItem>
                            <asp:ListItem Value="5">Chubut</asp:ListItem>
                            <asp:ListItem Value="6">Córdoba</asp:ListItem>
                            <asp:ListItem Value="7">Corrientes</asp:ListItem>
                            <asp:ListItem Value="8">Entre Rios</asp:ListItem>
                            <asp:ListItem Value="9">Formosa</asp:ListItem>
                            <asp:ListItem Value="10">Jujuy</asp:ListItem>
                            <asp:ListItem Value="11">La Pampa</asp:ListItem>
                            <asp:ListItem Value="12">La Rioja</asp:ListItem>
                            <asp:ListItem Value="13">Mendoza</asp:ListItem>
                            <asp:ListItem Value="14">Misiones</asp:ListItem>
                            <asp:ListItem Value="15">Neuqúen</asp:ListItem>
                            <asp:ListItem Value="16">Río Negro</asp:ListItem>
                            <asp:ListItem Value="17">Salta</asp:ListItem>
                            <asp:ListItem Value="18">San Juan</asp:ListItem>
                            <asp:ListItem Value="19">San Luis</asp:ListItem>
                            <asp:ListItem Value="20">Santa Cruz</asp:ListItem>
                            <asp:ListItem Value="21">Santa Fe</asp:ListItem>
                            <asp:ListItem Value="22">Santiago del Estero</asp:ListItem>
                            <asp:ListItem Value="23">Tierra del Fuego</asp:ListItem>
                            <asp:ListItem Value="24">Tucumán</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td width="255px">
                        <h3>Localidad :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tCamLocalidad" runat="server" MaxLength="25" Width="305px" Height="28px" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="ELocalidadU" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td width="255px">
                        <h3>Dirección :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tCamDireccion" runat="server" MaxLength="70" TextMode="MultiLine" ForeColor="#33CCFF" BackColor="#003366" Height="28" Width="305" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="EDireccionU" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td width="255px">
                        <h3>Teléfono (agregue caracteristica):</h3>
                    </td>
                    <td width="315">
                        <asp:TextBox ID="tCamTelefono" runat="server" MaxLength="10" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large" Height="28px" Width="305px"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="ETelefonoU" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td width="255px">
                        <h3>Usuario :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tCamUsuario" runat="server" MaxLength="10" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large" Width="305px" Height="28px"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="EUsuarioU" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="255px">
                        <h3>Clave :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tcamClave" runat="server" MaxLength="10" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large" Width="305px" Height="28px"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="EClaveU" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="Center" colspan="3">
                        <asp:Label ID="Error" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red" Height="50px"></asp:Label>
                    </td>
                </tr>

            </table>

            <br />

            <table>

                <tr>
                    <td align="center" width="382px">
                        <asp:ImageButton ID="bGuardarDatos" runat="server" ImageUrl="~/imagenes/cambiarlosdatos.png" ImageAlign="Middle" />
                    </td>
                    <td align="Center" width="382px">
                        <asp:ImageButton ID="bCancelarVolverCAm" runat="server" ImageUrl="~/imagenes/cancelarvolver.png" ImageAlign="Middle" />
                    </td>
                </tr>

            </table>

        </asp:Panel>

        <br />

        <asp:Panel ID="pDatosModificados" runat="server" ForeColor="#372C57" BackImageUrl="~/imagenes/datospersonales.jpg" Font-Bold="true" Height="300px" Visible="false">

            <table>

                <tr>
                    <td align="Center" width="765px">
                        <h2>Tus datos han sido Modificados Correctamente</h2>
                    </td>
                </tr>
                <tr>
                    <td align="Center" width="765px" height="150px">
                        <asp:ImageButton ID="bVolverAreaUsuario" runat="server" ImageUrl="~/imagenes/volveratuarea.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table>

        </asp:Panel>


        <asp:Panel ID="Panel1" runat="server" Style="margin-bottom: 32px">
            <br />
        </asp:Panel>

        <%--Clase 8 --------------------------------------%>

        <asp:Panel ID="pPedidos" runat="server" Heigth="498px"
            Font-Bolt="True" ForeColor="Blue"
            Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="False">
            <table class="auto-style40">
                <tr>
                    <td class="auto-style36" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Menu de Pedidos</td>
                </tr>
                <tr>
                    <td align="center" class="auto-style37">
                        <asp:ImageButton ID="ImagenButton2" runat="server" ImageUrl="~/imagenes/nuevopedido2.png" />
                    </td>
                    <td align="center" class="auto-style38"></td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/imagenes/todoslospedidos.png" />
                    </td>
                    <td align="center" class="auto-style39">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/imagenes/terminar.png" />
                    </td>
                    <td align="center" class="auto-style39">&nbsp;</td>
                </tr>
            </table>
            <br />
        </asp:Panel>
        <asp:Panel ID="pNuevoPedido" runat="server" Heigth="498px"
            Font-Bolt="True" ForeColor="Blue"
            Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="False">
            &nbsp;Nuevo Pedido a Fabrica<br />
            <table class="auto-style41">
                <tr>
                    <td class="auto-style25">&nbsp;&nbsp;&nbsp;<asp:Button ID="bInstrucciones" runat="server" Text="Abrir instrucciones" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lInstrucciones" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style25">Seleccione el gusto del Helado&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style25">
                        <asp:DropDownList ID="dHelados" runat="server" Width="702px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style25">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">&nbsp;</td>
                </tr>
            </table>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style45"></td>
                    <td class="auto-style46">
                        <h5>Agregar:</h5>
                    </td>
                    <td class="auto-style47">
                        <asp:Label ID="lCosaAgregar" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="auto-style47">
                        <asp:Label ID="lQueEs" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style44">&nbsp;</td>
                    <td class="auto-style43">
                        <h5>Cantidad de Latas o Unidades</h5>
                    </td>
                    <td>
                        <asp:DropDownList ID="tCantLatas" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:ImageButton ID="bAgregarALista" runat="server" ImageUrl="~/imagenes/agregar.png" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style44">&nbsp;</td>
                    <td class="auto-style43">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            Esta es la lista de su pedido.<br />
            <table style="width: 100%;">
                <tr>
                    <td colspan="3" class="auto-style48">
                        <asp:GridView runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="750px" ID="gListaPedido">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:ButtonField Text="Quitar" ButtonType="Image" ImageUrl="~/imagenes/quitar.png" CommandName="Quitar" />
                                <asp:BoundField HeaderText="Item Solicitado" DataField="Item" />
                                <asp:BoundField HeaderText="Cant." DataField="Cantidad" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style51">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             <asp:ImageButton ID="bQuitarTodos" runat="server" ImageUrl="~/imagenes/quitartodos.png" />
                    </td>
                    <td class="auto-style50">
                        <asp:ImageButton ID="bSolicitarPedido" runat="server" ImageUrl="~/imagenes/solicitar.png" />
                    </td>
                    <td class="auto-style49">
                        <asp:ImageButton ID="bCancelarPedido" runat="server" ImageUrl="~/imagenes/cancelarpedido.png" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
            </table>

            <br />
            <br />
        </asp:Panel>
        <asp:Label ID="lErrorPedido" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Panel ID="pPedidoCreado" runat="server" Heigth="498px"
            Font-Bolt="True" ForeColor="Blue"
            Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="False">
            &nbsp;<br />
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style52">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lPedidoCreado" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style53">&nbsp;</td>
                    <td>
                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/imagenes/terminar.png" />
                    </td>
                </tr>
            </table>

            <br />

            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="pHistorico" runat="server" Heigth="498px"
            Font-Bolt="True" ForeColor="Blue"
            Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="False">
            &nbsp;<br />
            Historicos de Pedidos y ver Estado<br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:Label ID="lErrorHistorico" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gHistorico" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="750px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Ver" Text="Ver Pedido" />
                    <asp:ButtonField ButtonType="Button" CommandName="Anular" HeaderText="(solo &quot;Solicitado&quot;)" Text="Anular Pedido" />
                    <asp:BoundField DataField="NPedido" HeaderText="N° Pedido" ReadOnly="True" />
                    <asp:BoundField DataField="fecha" DataFormatString="{0:dd/MM/yyyy HH:mm:tt}" HeaderText="Fecha y Hora" ReadOnly="True" />
                    <asp:BoundField DataField="estado" HeaderText="Estado del Pedido" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style53">&nbsp;</td>
                    <td class="auto-style57">
                        <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/imagenes/actualizar.png" />
                    </td>
                    <td class="auto-style55">
                        <asp:ImageButton ID="bTerminarHistorico" runat="server" ImageUrl="~/imagenes/terminarvolver.png" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <br />

            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="pVerUnPedido" runat="server" Heigth="498px"
            Font-Bolt="True" ForeColor="Blue"
            Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="False">
            &nbsp;<br />
            Detalle del Pedido N°
                                 <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />
            <table class="auto-style35">
                <tr>
                    <td>
                        <asp:GridView ID="gVerUnPedido" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="750px">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:BoundField HeaderText="Item Solicitado" DataField="Item" />
                                <asp:BoundField HeaderText="Cant." DataField="Cantidad" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </td>

                </tr>
            </table>

            <table style="width: 100%;">
                <tr>
                    <td class="auto-style53">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style53">&nbsp;</td>
                    <td>
                        <asp:Label ID="lErrorVerUnPedido" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/imagenes/terminarvolver.png" />
                    </td>
                </tr>
            </table>

            <br />

            <br />
            <br />
            <br />
        </asp:Panel>

        <asp:Panel ID="pPedidoAnulado" runat="server" Heigth="498px" Font-Bolt="True" ForeColor="Blue" Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="False">
            <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lPedidoAnulado" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">
                        <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/imagenes/terminarvolver.png" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
        </asp:Panel>


    </form>
</body>
</html>
