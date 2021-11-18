Imports System.Data.SqlClient
Imports System.Net.Mail

Public Class _Default
    Inherits System.Web.UI.Page

    Public x As Integer
    Public connectionstring As String = ConfigurationManager.ConnectionStrings(ConfigurationManager.AppSettings("Conexion")).ToString()

    Public EmailActivo As String = ConfigurationManager.AppSettings("EmailActivo")
    Public Email As String = ConfigurationManager.AppSettings(EmailActivo)
    Public EmailPass As String = ConfigurationManager.AppSettings(EmailActivo & "Pass")

    Dim con As New SqlConnection(connectionstring)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub bPortada_Click(sender As Object, e As ImageClickEventArgs) Handles bPortada.Click
        pPortada.Visible = False
        pLoguinMenu.Visible = True
    End Sub

    Protected Sub bVolverLoguin_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverLoguin.Click
        pPortada.Visible = True
        pLoguin.Visible = False
    End Sub

    Protected Sub bRegistrase_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrase.Click
        pLoguinMenu.Visible = False
        pRegistrarse.Visible = True
    End Sub

    Protected Sub bRegistrarseVolverLoguinU13_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarseVolverLoguinU13.Click
        pLoguinMenu.Visible = False
        pPortada.Visible = True
    End Sub

    Protected Sub bRegistrarseUO_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarseUO.Click
        pRegistrarse.Visible = False
        pLoguinMenu.Visible = True
    End Sub

    Protected Sub bRegistrarseU_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarseU.Click

        Dim ok As Boolean = True

        LimpiarErroresRegistroU()

        tNombreU.Text = tNombreU.Text.Trim.ToUpper
        If comprobar(tNombreU.Text) = False Then
            ArreglarCampo(tNombreU)
            ok = False
            lENombreU.Text = "El nombre contenia caracteres inválidos, fueron quitados."
            lENombreU.Visible = True
        End If
        tApellidoU.Text = tApellidoU.Text.Trim.ToUpper
        If comprobar(tApellidoU.Text) = False Then
            ArreglarCampo(tApellidoU)
            ok = False
            lEApellidoU.Text = "El Apellido contenia caracteres inválidos, fueron quitados."
            lEApellidoU.Visible = True
        End If
        tDocU.Text = tDocU.Text.Trim
        If comprobar(tDocU.Text) = False Or Not IsNumeric(tDocU.Text) Then
            SoloNumeros(tDocU)
            ok = False
            lEDocU.Text = "El Documento no era válido, se ajustó a número."
            lEDocU.Visible = True
        End If
        ArreglarCampo(tEmailU)
        If ValidaEmail(tEmailU.Text) = False Then
            ok = False
            lEEmailU.Text = "El Email no es válido."
            lEEmailU.Visible = True
        End If

        tLocalidadU.Text = tLocalidadU.Text.Trim().ToUpper
        If comprobar(tLocalidadU.Text) = False Then
            ArreglarCampo(tLocalidadU)
            ok = False
            lELocalidadU.Text = "La Localidad conteni caracteres invalidos, fueron quitados."
            lELocalidadU.Visible = True
        End If

        tDireccionU.Text = tDireccionU.Text.Trim().ToUpper
        If comprobar(tDireccionU.Text) = False Then
            ArreglarCampo(tDireccionU)
            ok = False
            lEDireccionU.Text = "La Dirección contenia cararcteres invalidos, fueron quitados."
            lEDireccionU.Visible = True
        End If

        tTelefonosU.Text = tTelefonosU.Text.Trim().ToUpper
        If comprobar(tTelefonosU.Text) = False Then
            ArreglarCampo(tTelefonosU)
            ok = False
            lETelefonosU.Text = "El tléfono contenia caracteres invalidos, fueron quitados."
            lETelefonosU.Visible = True
        End If

        Dim FechaNacimiento As Date
        ControlDeNacimiento(tF_Nac, ok, lEEdadU, lEdadU, True, FechaNacimiento)

        tUsuarioU.Text = tUsuarioU.Text.Trim().ToUpper
        If comprobar(tUsuarioU.Text) = False Or tUsuarioU.Text.IndexOf(" ") > -1 Then
            tUsuarioU.Text = tUsuarioU.Text.Replace(" ", "")
            ArreglarCampo(tUsuarioU)
            ok = False
            lEUsuarioU.Text = "El Usuario contenia caracteres inválidos, fueron quitados."
            lEUsuarioU.Visible = True
        End If

        If tUsuarioU.Text.Length < 5 Then
            ok = False
            lEUsuarioU.Text = "El Usuario debe tener de 5 a 10 caracteres, letras y/o números."
            lEUsuarioU.Visible = True
        End If

        tClaveU.Text = tClaveU.Text.Trim()
        If comprobar(tClaveU.Text) = False Or tClaveU.Text.IndexOf(" ") > -1 Then
            tClaveU.Text = tClaveU.Text.Replace(" ", "")
            ArreglarCampo(tClaveU)
            ok = False
            lEClaveU.Text = "La Clave contenia caracteres inválidos. Pruebe con letras y/o números."
            lEClaveU.Visible = True
        End If

        If tClaveU.Text.Length < 5 Then
            ok = False
            lEClaveU.Text = "La Clave debe tener de 5 a 10 caracteres, letras y/0 números."
            lEClaveU.Visible = True
        End If

        tRepetirClaveU.Text.Trim()
        If comprobar(tRepetirClaveU.Text) = False Or tRepetirClaveU.Text.IndexOf(" ") > -1 Then
            tRepetirClaveU.Text = tRepetirClaveU.Text.Replace(" ", "")
            ArreglarCampo(tRepetirClaveU)
            ok = False
            lERepetirClaveU.Text = "La segunda Clave contenia caracteres inválidos. Pruebe con letras y/o números."
            lERepetirClaveU.Visible = True
        End If

        If ok = False Then
            lErroresU.Text = "Revise los errores por favor y luego reintente."
            lErroresU.Visible = True
            Exit Sub
        End If

        If tRepetirClaveU.Text <> tRepetirClaveU.Text Then
            ok = False
            lERepetirClaveU.Text = "Las 2 claves son diferentes."
            lERepetirClaveU.Visible = True
        End If

        Session("Usuario") = tUsuarioU.Text
        Session("Password") = tClaveU.Text
        Session("TipoDocumento") = dTDocU.SelectedValue.Trim
        Session("Documento") = tDocU.Text.Trim
        If YaExisteSQL("select idusuario from usuarios where usuario='" & Session("Usuario") & "'") Then
            ok = False
            lEUsuarioU.Text = "El Usuario elegido ya existe. Pruebe con otro."
            lEUsuarioU.Visible = True
        End If

        If YaExisteSQL("select idusuario from usuarios where doc='" & Session("Documento") & "' and tdoc='" & Session("TipoDocumento") & "'") Then
            ok = False
            lEDocU.Text = "Ya existe el " & Session("TipoDocumento") & " " & Session("Documento") & " ."
            lEDocU.Visible = True
        End If

        If ok = False Then
            lErroresU.Text = "Solo se permite una inscripción por persona."
            lErroresU.Visible = True
            Exit Sub
        End If

        Session("Usuario") = tUsuarioU.Text.ToLower
        Session("Passord") = tClaveU.Text
        Session("TipoDocumento") = dTDocU.SelectedValue.Trim
        Session("Documento") = tDocU.Text.Trim
        Session("ApellidoYNombre") = tNombreU.Text.Trim & " " & tApellidoU.Text.Trim
        Session("Email") = tEmailU.Text.Trim

        LimpiarErroresRegistroU()

        Session("sqlIngreso") = "insert into Usuarios (Apellido,Nombre,tDoc,Doc,Usuario,Pass,Email,idProv,Localidad,Direccion,Telefonos,fNacimiento) values ('" & tApellidoU.Text.Trim & "','" & tNombreU.Text.Trim & "','" & Session("TipoDocumento") & "','" & Session("Documento") & "','" & Session("Usuario") & "','" & Session("Password") & "','" & Session("Email") & "'," & dProvinciaU.SelectedValue & ",'" & tLocalidadU.Text.Trim & "','" & tDireccionU.Text.Trim & "','" & tTelefonosU.Text.Trim & "','" & FechaNacimiento.ToString("yyyy-MM-dd") & "') "

        Dim codigo As String = CreaCodigo(4)

        Session("codigo") = codigo

        Dim en As String = Chr(13) & Chr(10), mensaje As String = "Saludos " &
            Session("ApellidoYNombre") & "." & en & en &
            "Te escribimos desde Helados UNLZ, en respuesta a tu solicitud de regisrto " &
            "como nuevo usuario de nuestra aplicacion." & en & en &
            "Por favor, ingresa el codigo: " & codigo & " en el cuadro de texto de " &
            "la aplicacion web, y presiona Validar. Esto completara tu registro " &
            "como nuevo usuario de Helados UNLZ " & en & en & en & en &
            "(Por favor, no responda a este mail, es automatico. . . muchas gracias.)" & en & en

        Dim ok2 As String = EnviarMail(Session("Email"), "Bienvenido a Consumo Red!", mensaje)
        tValidar.Text = ""
        lCodigo.Visible = False
        pRegistrarse.Visible = False
        pValidarEmail.Visible = True
    End Sub

    Protected Sub bTodook_Click(sender As Object, e As ImageClickEventArgs) Handles bTodook.Click
        pBienvenidos.Visible = False
        pLoguin.Visible = True
    End Sub

    Protected Sub bEntrarAqui_Click(sender As Object, e As ImageClickEventArgs) Handles bEntrarAqui.Click
        pLoguinMenu.Visible = False
        pLoguin.Visible = True
    End Sub

    Sub ArreglarCampo(ByRef campo As TextBox)
        campo.Text = campo.Text.Trim.Replace("'", "").Replace("""", "").Replace("*", "").Replace("+", "").Replace("-", "").Replace("/", "").Replace(":", "").Replace("`", "").Replace("<", "").Replace(">", "").Replace("=", "").Replace("&", "")
    End Sub

    Function comprobar(ByVal user As String) As Boolean
        If user Is System.DBNull.Value Then
            Return False
        Else
            Dim aux As Boolean = True
            Dim listanegra, x As String

            listanegra = "'*+-/:;`><&" & """"

            If user <> "" Then
                For Each x In user
                    If aux = True Then
                        If InStr(1, listanegra, x) > 0 Then
                            aux = False
                        Else
                            aux = True
                        End If
                    Else
                        Return False
                    End If
                Next
                If aux = True Then
                    Return True
                End If
            Else
                Return False
            End If
            Return False
        End If
    End Function

    Sub LimpiarErroresRegistroU()
        lErroresU.Text = ""
        lErroresU.Visible = False
        lENombreU.Text = ""
        lEApellidoU.Text = ""
        lEDocU.Text = ""
        lEdadU.Text = ""
        lEEmailU.Text = ""
        lELocalidadU.Text = ""
        lEDireccionU.Text = ""
        lEUsuarioU.Text = ""
        lEClaveU.Text = ""
        lERepetirClaveU.Text = ""
        lENombreU.Visible = False
        lEApellidoU.Visible = False
        lEDocU.Visible = False
        lEEdadU.Visible = False
        lEEmailU.Visible = False
        lELocalidadU.Visible = False
        lEDireccionU.Visible = False
        lETelefonosU.Visible = False
        lEUsuarioU.Visible = False
        lEClaveU.Visible = False
        lERepetirClaveU.Visible = False
        lGusto.Visible = False
        lStock.Visible = False
        lPrecioSinIva.Visible = False
        lMensajeErrorProducto.Visible = False
        lMensajeProducto.Visible = False
    End Sub

    Sub LimpiarRegistroU()
        LimpiarErroresRegistroU()
        pRegistrarse.Visible = False

        tNombreU.Text = ""
        tApellidoU.Text = ""
        dTDocU.SelectedIndex = 0
        tDocU.Text = ""
        tEmailU.Text = ""
        dProvinciaU.SelectedIndex = 0
        tLocalidadU.Text = ""
        tDireccionU.Text = ""
        tTelefonosU.Text = ""
        tUsuarioU.Text = ""
        tClaveU.Text = ""
        tRepetirClaveU.Text = ""
    End Sub

    Public Function ValidaEmail(ByVal email As String) As Boolean
        Dim emailRegex As New System.Text.RegularExpressions.Regex("^(?<user>[^@]+)@(?<host>.+)$")
        Dim emailMatch As System.Text.RegularExpressions.Match = emailRegex.Match(email)
        Return emailMatch.Success
    End Function

    Sub SoloNumeros(ByRef campo As TextBox)
        Dim cam As String = campo.Text.Trim, salida As String = "", c As String
        For Each c In cam
            If IsNumeric(c) Then salida &= c
        Next
        campo.Text = salida
    End Sub

    Function VNum(ByVal NTexto As String) As Decimal
        'Tranforma un texto con algo, que puede ser un numero con coma o punto y devuelve un numero decimal siempre
        Return CDec(Val(NTexto.Trim.Replace(",", ".")))
    End Function

    Function NumSQL(ByVal numero As String) As String
        'Recibe un numero desde un TexBox por ejemplo, lo verifica como número válido, y luego le cambie la coma por punto para que sea válido en una sentencia de SQL , luego lo devuelve
        Return CStr(VNum(numero)).Trim.Replace(",", ".")
    End Function

    Function RellenaNum(ByVal numero As Integer, ByVal cantidad As Integer) As String
        'Rellena con 0s adelante el numero. Ideal´para dias y meses : Rellena (3,2)--> "03" Rellena(3,4)-->"0003"
        Dim snum As String = CStr(numero).Trim
        Return "00000000000000000000".Substring(0, cantidad - snum.Length) & snum
    End Function

    Public Function AñoMes(ByVal fecha As Date) As String
        'devuelve AAAA-MM
        Return RellenaNum(Year(fecha), 4) & "-" & RellenaNum(Month(fecha), 2)
    End Function

    Public Function Vstr(ByVal cosa As Object) As String
        If IsDBNull(cosa) Then
            Return ""
        Else Return CStr(cosa)

        End If
    End Function

    Function CalcularEdad(ByVal FechaNac As Date) As Integer
        Dim edad As Integer = DateTime.Today.AddTicks(-FechaNac.Ticks).Year - 1
        Return edad

    End Function

    Sub ControlDeNacimiento(ByRef xtf_nac As TextBox, ByRef ok As Boolean, ByRef xlEFNac As Label, ByRef xlEdad As Label, ByVal Valida18 As Boolean, ByRef FechaNacimiento As Date)
        ArreglarCampo(xtf_nac)
        xlEFNac.Visible = False
        If xtf_nac.Text.Length < 6 Then
            ok = False
            xlEFNac.Text &= "El campo Fecha de Nacimiento debe tener 6 números."
            xlEdad.Text = "0"
            xlEFNac.Visible = True
        Else
            Dim fechaX As String = xtf_nac.Text
            Dim AñosX As Integer = VNum(fechaX.Substring(4, 2))
            If AñosX + 2000 > Date.Today.Year Then
                AñosX += 1900
            Else
                AñosX += 2000
                fechaX = AñosX.ToString.Trim & "-" & fechaX.Substring(2, 2) & "-" & fechaX.Substring(0, 2)
                If Not IsDate(fechaX) Then
                    ok = False
                    xlEFNac.Text &= "El campo Fecha de Nacimiento, es una fecha inválida."
                    xlEdad.Text = "0"
                    xlEFNac.Visible = True
                Else
                    Dim dFechax As Date
                    dFechax = CDate(fechaX)
                    FechaNacimiento = dFechax
                    If dFechax > Date.Today Then
                        ok = False
                        xlEFNac.Text &= "Nacio en el futuro....."
                        xlEdad.Text = "0"
                        xlEFNac.Visible = True
                    Else
                        Dim Edad As Integer = CalcularEdad(dFechax)
                        xlEdad.Text = Edad
                        If Edad < 18 And Valida18 Then
                            ok = False
                            xlEFNac.Text &= "Debe ser mayor de edad(18 Años)."
                            xlEdad.Text = "0"
                            xlEFNac.Visible = True
                        End If
                    End If
                End If

            End If
        End If
    End Sub

    Public Function SQL_Accion(ByVal Sql_de_accion As String) As Boolean
        'Ejecuta la consulta de accion 'Sql_de_accion' abriendo la coneecion automaticamente se da cuenta si es de un insert, update o delete,
        'porque mira dentro de la sentencia que se le devuelve true si se pudo hacer, y false si hubo algun error.
        Dim adapter As New SqlDataAdapter, salida As Boolean = True
        Try
            If con.State = ConnectionState.Closed Then con.Open()
            'con.Open()
            If Sql_de_accion.ToUpper.IndexOf("INSERT") Then
                'MsgBox(Sql_de_accion)
                adapter.InsertCommand = New SqlCommand(Sql_de_accion, con)
                adapter.InsertCommand.ExecuteNonQuery()
            Else
                If Sql_de_accion.ToUpper.IndexOf("UPDATE") Then
                    adapter.UpdateCommand = New SqlCommand(Sql_de_accion, con)
                    adapter.UpdateCommand.ExecuteNonQuery()
                Else
                    If Sql_de_accion.ToUpper.IndexOf("DELETE") Then
                        adapter.DeleteCommand = New SqlCommand(Sql_de_accion, con)
                        adapter.DeleteCommand.ExecuteNonQuery()
                    Else
                        'esta mal la sintaxis porque no hay ni insert, ni delete ni update
                        salida = False
                    End If
                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            salida = False

        End Try
        'con.Clase()
        Return salida

    End Function

    Function LeeUnCampo(ByVal sql As String, ByVal campo As String) As Object
        'Se le pasa un select de sql con un campo y devuelde el valor del campo como Objeto. Se supone que devuelde nada o 1 registro(no mas que 1)
        'Por ej: valor=LeerUnCampo("Select cosa from table where condi=1","cosa") valor tomará cosa. Si no encuentra nada devuelve "**NADA**".
        'Si hay error devuelve "**ERROR**"
        Dim da1 As New SqlDataAdapter(sql, con)
        Dim ds1 As New DataSet
        Try
            If con.State = ConnectionState.Closed Then con.Open()
            da1.Fill(ds1, "datos")
            If ds1.Tables("datos").Rows.Count < 1 Then
                Return "**NADA**"
            Else
                Return ds1.Tables("datos").Rows(0)(campo)
            End If
        Catch
            Return "**ERROR**"
        End Try

        Return ds1.Tables("datos").Rows(0)(campo)

    End Function

    Public Function YaExisteSQL(ByVal sql As String) As Boolean
        'Se le pasa un select de sql que en teoria busca algo, por eje: un número de cheuqe, s hay registros la funcion devuelve true,
        'estilo "El chueque ya existe", si no esta, devuleve false 
        'Dim ar As String

        Dim con As New SqlConnection(connectionstring)
        Dim da1 As New SqlDataAdapter(sql, con)
        Dim ds1 As New DataSet
        da1.Fill(ds1, "afidesc")
        If ds1.Tables("afidesc").Rows.Count < 1 Then
            Return False
        Else
            Return True
        End If
    End Function

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click

        Session("QueEs") = "Usuarios"
        Loguea()

    End Sub

    Sub Loguea()
        Dim usu As String = tUsuario.Text.Trim.ToUpper, pass As String = tClave.Text.Trim
        If comprobar(tUsuario.Text.Trim) = False Or comprobar(tClave.Text.Trim) = False Then
            lErrorLoguin.Text = "El Usuario o la Clave son incorrectos, Revise por favor."
            lErrorLoguin.Visible = True
            Exit Sub
        End If

        Dim da1 As New SqlDataAdapter("select * from " & Session("QueEs") & " where Activo = 1 AND upper(ltrim(rtrim(usuario)))='" & usu & "' and ltrim(rtrim(pass))='" & pass & "'", con)
        Dim ds1 As New DataSet
        da1.Fill(ds1, "Login")
        If ds1.Tables("Login").Rows.Count = 0 Then

            lErrorLoguin.Text = "El Usuario o la Clave son incorrectos, Revise por favor."
            lErrorLoguin.Visible = True
            Exit Sub
        End If

        Select Case Session("QueEs")
            Case "Usuarios"
                Session("idUsuario") = ds1.Tables("Login").Rows(0)("idUsuario")
                Session("Usuario") = usu
                Session("Password") = pass
                Session("TipoDocuemnto") = ds1.Tables("Login").Rows(0)("tDoc")
                Session("Documento") = ds1.Tables("Login").Rows(0)("Doc").ToString.Trim
                Session("ApellidoYNombre") = ds1.Tables("Login").Rows(0)("Nombre").ToString.Trim & " " & ds1.Tables("Login").Rows(0)("Apellido").ToString.Trim
                Session("Email") = ds1.Tables("Login").Rows(0)("Email").ToString.Trim
                Session("idProv") = ds1.Tables("Login").Rows(0)("idProv").ToString.Trim
                Session("Localidad") = ds1.Tables("Login").Rows(0)("Localidad").ToString.Trim
                Session("Direccion") = ds1.Tables("Login").Rows(0)("Direccion").ToString.Trim
                Session("Telefonos") = ds1.Tables("Login").Rows(0)("Telefonos").ToString.Trim

                lBienvenidoAreaU.Text = "Bienvenido " & Session("ApellidoYNombre") & " , a tu Área de Usuario."
                LimpiarRegistroU()
                pLoguin.Visible = False
                pAreaUsuario.Visible = True

            Case "Administradores"
                Session("idUsuario") = ds1.Tables("Login").Rows(0)("idUsuario")
                Session("Usuario") = usu
                Session("Password") = pass
                Session("TipoDocuemnto") = ds1.Tables("Login").Rows(0)("tDoc")
                Session("Documento") = ds1.Tables("Login").Rows(0)("Doc").ToString.Trim
                Session("ApellidoYNombre") = ds1.Tables("Login").Rows(0)("Nombre").ToString.Trim & " " & ds1.Tables("Login").Rows(0)("Apellido").ToString.Trim
                Session("Email") = ds1.Tables("Login").Rows(0)("Email").ToString.Trim
                Session("idProv") = ds1.Tables("Login").Rows(0)("idProv").ToString.Trim
                Session("Localidad") = ds1.Tables("Login").Rows(0)("Localidad").ToString.Trim
                Session("Direccion") = ds1.Tables("Login").Rows(0)("Direccion").ToString.Trim
                Session("Telefonos") = ds1.Tables("Login").Rows(0)("Telefonos").ToString.Trim

                lBienvenidoAreaU.Text = "Bienvenido " & Session("ApellidoYNombre") & " , a tu Área de Administrador."
                LimpiarRegistroU()
                bABMProducto.Visible = True
                bVerPedidosGeneral.Visible = True
                bAdministrarUsuarios.Visible = True
                pLoguin.Visible = False
                pAreaUsuario.Visible = True

        End Select

    End Sub

    Protected Sub bAhoraQueHago_Click(sender As Object, e As ImageClickEventArgs) Handles bAhoraQueHago.Click
        pAreaUsuario.Visible = False
        pAhoraQueHago.Visible = True
    End Sub

    Sub LimpiarLoguin()
        lErrorLoguin.Text = ""
        lErrorLoguin.Visible = False
        tUsuario.Text = ""
        tClave.Text = ""
        pRegistrarse.Visible = False
    End Sub

    Protected Sub bVolverLoguinU1_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverLoguinU1.Click
        LimpiarLoguin()
        LimpiarRegistroU()
        lReenviarClave.Text = "" ' falta terminar
        pLoguin.Visible = True
        pAreaUsuario.Visible = False
        tUsuario.Text = Session("Usuario")
        tClave.Text = Session("Passsword")
    End Sub

    Protected Sub bVolverLoguinU2_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverLoguinU2.Click
        pAhoraQueHago.Visible = False
        pAreaUsuario.Visible = True
    End Sub

    Protected Sub bModificarDatos_Click(sender As Object, e As ImageClickEventArgs) Handles bModificarDatos.Click

        pAreaUsuario.Visible = False
        CargarCampos()
        pCambiarDatosPersonalesU.Visible = True

    End Sub

    Protected Sub bGuardarDatos_Click(sender As Object, e As ImageClickEventArgs) Handles bGuardarDatos.Click

        Dim ok As Boolean = True

        LimpiarErroresRegistroU()


        ArreglarCampo(tCamEmail)
        If ValidaEmail(tCamEmail.Text) = False Then
            ok = False
            EEmailU.Text = "El Email no es válido."
            EEmailU.Visible = True
        End If

        tCamLocalidad.Text = tCamLocalidad.Text.Trim().ToUpper
        If comprobar(tCamLocalidad.Text) = False Then
            ArreglarCampo(tCamLocalidad)
            ok = False
            ELocalidadU.Text = "La Localidad contenia caracteres invalidos, fueron quitados."
            ELocalidadU.Visible = True
        End If

        tCamDireccion.Text = tCamDireccion.Text.Trim().ToUpper
        If comprobar(tCamDireccion.Text) = False Then
            ArreglarCampo(tCamDireccion)
            ok = False
            EDireccionU.Text = "La Dirección contenia cararcteres invalidos, fueron quitados."
            EDireccionU.Visible = True
        End If

        tCamTelefono.Text = tCamTelefono.Text.Trim().ToUpper
        If comprobar(tCamTelefono.Text) = False Then
            ArreglarCampo(tCamTelefono)
            ok = False
            ETelefonoU.Text = "El tléfono contenia caracteres invalidos, fueron quitados."
            ETelefonoU.Visible = True
        End If

        tCamUsuario.Text = tCamUsuario.Text.Trim().ToUpper
        If comprobar(tCamUsuario.Text) = False Or tCamUsuario.Text.IndexOf(" ") > -1 Then
            tCamUsuario.Text = tCamUsuario.Text.Replace(" ", "")
            ArreglarCampo(tCamUsuario)
            ok = False
            EUsuarioU.Text = "El Usuario contenia caracteres inválidos, fueron quitados."
            EUsuarioU.Visible = True
        End If

        If tCamUsuario.Text.Length < 5 Then
            ok = False
            EUsuarioU.Text = "El Usuario debe tener de 5 a 10 caracteres, letras y/o números."
            EUsuarioU.Visible = True
        End If

        tcamClave.Text = tcamClave.Text.Trim()
        If comprobar(tcamClave.Text) = False Or tcamClave.Text.IndexOf(" ") > -1 Then
            tcamClave.Text = tcamClave.Text.Replace(" ", "")
            ArreglarCampo(tcamClave)
            ok = False
            EClaveU.Text = "La Clave contenia caracteres inválidos. Pruebe con letras y/o números."
            EClaveU.Visible = True
        End If

        If tcamClave.Text.Length < 5 Then
            ok = False
            EClaveU.Text = "La Clave debe tener de 5 a 10 caracteres, letras y/0 números."
            EClaveU.Visible = True
        End If

        If ok = False Then
            [Error].Text = "Revise los errores por favor y luego reintente."
            [Error].Visible = True
            Exit Sub
        End If

        LimpiarErroresRegistroU()

        If SQL_Accion("update Usuarios set Email='" & tCamEmail.Text.Trim.ToUpper.Replace("'", "´") & "', idProv='" & dCamProvincia.Text.Trim.ToUpper.Replace("'", "´") & "', localidad='" & tCamLocalidad.Text.Trim.ToUpper.Replace("'", "´") & "', direccion ='" & tCamDireccion.Text.Trim.ToUpper.Replace("'", "´") & "',  telefonos='" & tCamTelefono.Text.Trim.ToUpper.Replace("'", "´") & "', usuario='" & tCamUsuario.Text.Trim.ToUpper.Replace("'", "´") & "', pass='" & tcamClave.Text.Trim.ToUpper.Replace("'", "´") & "' where idUsuario=" & Val(Session("idUsuario"))) = False Then
            [Error].Text = "Se a producido un error al querer modificar tus datos..."
            [Error].Visible = True
            Exit Sub
        End If

        LimpiarErroresRegistroU()

        pCambiarDatosPersonalesU.Visible = False
        pDatosModificados.Visible = True
        bCancelarVolverCAm.Focus()


    End Sub

    Sub CargarCampos()

        Dim da As New SqlDataAdapter("SELECT  upper (ltrim(rtrim(isnull(Email,'')))) as email, (ltrim(rtrim(isnull(idprov,'')))) as provincia, (ltrim(rtrim(isnull(localidad,'')))) as localidad, (ltrim(rtrim(isnull(direccion,'')))) as dirección, (ltrim(rtrim(isnull(telefonos,'')))) as telefono, (ltrim(rtrim(isnull(usuario,'')))) as usuario, (ltrim(rtrim(isnull(pass,'')))) as clave from Usuarios where idUsuario= " & Val(Session("idUsuario")), con)
        Dim ds As New DataSet
        da.Fill(ds, "Usuarios")

        tCamEmail.Text = ds.Tables("Usuarios").Rows(0)("email")
        dCamProvincia.Text = ds.Tables("Usuarios").Rows(0)("provincia")
        tCamLocalidad.Text = ds.Tables("Usuarios").Rows(0)("localidad")
        tCamDireccion.Text = ds.Tables("Usuarios").Rows(0)("Dirección")
        tCamTelefono.Text = ds.Tables("Usuarios").Rows(0)("telefono")
        tCamUsuario.Text = ds.Tables("Usuarios").Rows(0)("usuario")
        tcamClave.Text = ds.Tables("Usuarios").Rows(0)("clave")

    End Sub

    Protected Sub bCancelarVolverCAm_Click(sender As Object, e As ImageClickEventArgs) Handles bCancelarVolverCAm.Click
        pCambiarDatosPersonalesU.Visible = False
        pAreaUsuario.Visible = True

    End Sub

    Protected Sub bVolverAreaUsuario_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverAreaUsuario.Click
        pDatosModificados.Visible = False
        pAreaUsuario.Visible = True
    End Sub

    Protected Sub bPedidos_Click(sender As Object, e As ImageClickEventArgs) Handles bPedidos.Click
        pAreaUsuario.Visible = False
        pPedidos.Visible = True
    End Sub

    Protected Sub ImageButton4_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton4.Click
        pAreaUsuario.Visible = True
        pPedidos.Visible = False
    End Sub

    Protected Sub ImagenButton2_Click(sender As Object, e As ImageClickEventArgs) Handles ImagenButton2.Click
        Dim en As String = "</br>"

        lInstrucciones.Text = "Instrucciones: " & en & en & "1) Elija el Helado que desea solicitar a la fabrica." & ", y se vera el elegido en 'Agregar: '. " & en & "2) Indique la cantidad de latas de helado. " & en & "3) Oprima el boton 'Agregar a la lista'. El item elegido y la cantidad se veran en la lista inferior. Si quiere sacar algun item(lo quita completo), solo presione sobre el item en la lista para seleccionarlo y oprima 'Quitar'. Si agrega un item que ya estaba en la lista, se suman las cantidades. " & en & "4) Cuando haya terminado oprima 'Enviar el pedido'. Todos los items figuraran como 'Solicitado', y desde 'Revisar estado de los pedidos' podra ver si cambiaron a 'Despachando' o 'Enviado'. Desde alli podra anular los pedidos que aun esten en 'Solicitado'."

        lInstrucciones.Visible = False
        bInstrucciones.Text = "Abrir Instrucciones"

        pPedidos.Visible = False
        lCosaAgregar.Text = ""
        CargarHelados()

        bQuitarTodos.Visible = False
        bSolicitarPedido.Visible = False
        lErrorPedido.Text = ""

        If IsNothing(Session("idUsuario")) Then
            pLoguin.Visible = True
            Exit Sub
        End If

        SQL_Accion("delete Web_Pedidos_Temporal where Num_Cli= " & Session("idUsuario"))
        CargaTemporal()

        pNuevoPedido.Visible = True
    End Sub

    Protected Sub bSolicitarPedido_Click(sender As Object, e As ImageClickEventArgs) Handles bSolicitarPedido.Click
        Dim idU As Integer = VNum(Session("idUsuario"))
        Dim npedido As Integer = 0, vItem As String = "", vTipo As String = "",
        vCantidad As Integer = 0
        Dim linea As String = "", en As String = Chr(13) & Chr(10)
        lErrorPedido.Text = ""

        If SQL_Accion("insert into WEB_Pedidos (Num_Cli) values (" & Session("idUsuario") & ")") = True Then
            Dim da2 As New SqlDataAdapter("select top 1 NPedido from WEB_Pedidos where Num_Cli=" & Session("idUsuario") & " order by NPedido desc", con)
            Dim ds2 As New DataSet
            da2.Fill(ds2, "dato")

            If ds2.Tables("dato").Rows.Count > 0 Then
                npedido = ds2.Tables("dato").Rows(0)("NPedido")
                'obtengo el numero que le asigno y lo uso para crear los detalles
                If SQL_Accion("INSERT INTO WEB_Pedidos_Detalle (Item, Cantidad, NPedido) " & "SELECT WEB_Pedidos_Temporal.Item, WEB_Pedidos_Temporal.Cantidad," & npedido & " AS NPedido FROM WEB_Pedidos_Temporal where Num_Cli=" & idU) = True Then
                    lPedidoCreado.Text = "El pedido N° " & npedido & " , fue creado correctamente."
                    pNuevoPedido.Visible = False
                    pPedidoCreado.Visible = True
                    If SQL_Accion("delete Web_Pedidos_Temporal where Num_Cli=" & idU) = False Then
                    End If
                Else
                    lErrorPedido.Text = "Hubo un error al intentar guardar el detalle del pedido " & npedido & ", que quedo vacio. Anulelo e Intente mas tarde."
                    Exit Sub
                End If
                Exit Sub
            Else
                lErrorPedido.Text = "Hubo un error al intentar guardar el pedido. Intente mas tarde." & npedido & ", que quedo vacio. Anulelo e Intente mas tarde."
                Exit Sub
            End If
        Else
            lErrorPedido.Text = "Hubo un error al intentar guardar el pedido. Intente mas tarde."
        End If
    End Sub

    Protected Sub ImageButton3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton3.Click
        CargarHistorico()
    End Sub

    Sub CargarHelados()
        Dim x As Integer = 0, cosa As String
        Dim da2 As New SqlDataAdapter("select * from Web_Helados order by Gusto", con)
        Dim ds2 As New DataSet
        dHelados.Items.Clear()
        ddlHelados.Items.Clear()
        da2.Fill(ds2, "dato")
        If ds2.Tables("dato").Rows.Count = 0 Then
            dHelados.Items.Add("*** No hay Helados disponibles en este momento . . . ***")
            Exit Sub
        End If
        For x = 0 To ds2.Tables("dato").Rows.Count - 1
            cosa = ds2.Tables("dato").Rows(x)("gusto").ToString.Trim

            dHelados.Items.Add(cosa)
            ddlHelados.Items.Add(cosa)
        Next
        dHelados.SelectedIndex = 0
        lCosaAgregar.Text = dHelados.SelectedItem.ToString
        lQueEs.Text = "Helado"
    End Sub

    Sub CargaTemporal()

        Dim idU As Integer = VNum(Session("idUsuario"))
        Dim consulta As String = "select Item, Cantidad from Web_Pedidos_Temporal where Num_Cli= " & Session("idUsuario") & " order by Item"

        Dim da1 As New SqlDataAdapter(consulta, con)

        Dim ds1 As New DataSet
        da1.Fill(ds1, "histo")
        gListaPedido.DataSource = ds1.Tables("histo")
        gListaPedido.DataBind()
        If ds1.Tables("histo").Rows.Count = 0 Then
            lErrorHistorico.Text = ""
            gListaPedido.Visible = False
            bSolicitarPedido.Visible = False
            bQuitarTodos.Visible = False
        Else
            gListaPedido.Visible = True
            bSolicitarPedido.Visible = True
            bQuitarTodos.Visible = True
        End If
    End Sub

    Protected Sub bCancelarPedido_Click(sender As Object, e As ImageClickEventArgs) Handles bCancelarPedido.Click
        If SQL_Accion("delete Web_Pedidos_Temporal where Num_Cli = " & VNum(Session("idUsuario"))) = False Then

        End If

        pNuevoPedido.Visible = False
        pPedidos.Visible = True
    End Sub

    Protected Sub bInstrucciones_Click(sender As Object, e As EventArgs) Handles bInstrucciones.Click
        If bInstrucciones.Text = "Abrir Instrucciones" Then
            bInstrucciones.Text = "Cerrar Instrucciones"
            lInstrucciones.Visible = True
        Else
            bInstrucciones.Text = "Abrir Instrucciones"
            lInstrucciones.Visible = False
        End If
    End Sub

    Protected Sub dHelados_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dHelados.SelectedIndexChanged
        lCosaAgregar.Text = dHelados.SelectedItem.ToString
        lQueEs.Text = "Helado"
    End Sub

    Protected Sub bAgregarALista_Click(sender As Object, e As ImageClickEventArgs) Handles bAgregarALista.Click
        Dim x As Integer = 0, numero As Integer = 0
        Dim Cosa As String = lCosaAgregar.Text.Trim
        If Cosa = "----------" Then Exit Sub

        Dim Cantidad As Integer = VNum(tCantLatas.SelectedValue.ToString)

        If Cantidad <= 0 Then Exit Sub
        lErrorPedido.Text = ""

        'veo si ya esta el item en la lista
        Dim da2 As New SqlDataAdapter("select cantidad from Web_Pedidos_Temporal where Num_Cli=" & Session("idUsuario") & " and ltrim(rtrim(item))='" & Cosa & "'", con)
        Dim ds2 As New DataSet
        da2.Fill(ds2, "dato")
        If ds2.Tables("dato").Rows.Count > 0 Then
            'ya estaba, le leo la cantidad y reemplazo
            Cantidad += VNum(ds2.Tables("dato").Rows(0)("cantidad"))
            If SQL_Accion("update Web_Pedidos_Temporal set cantidad=" & Cantidad & " where Num_Cli=" & Session("idUsuario") & " and ltrim(rtrim(item))='" & Cosa & "'") = False Then
                lErrorPedido.Text = "No puedo modificar el item elegido, intente mas tarde."
                Exit Sub
            End If
        Else
            If SQL_Accion("insert into Web_Pedidos_Temporal (Num_Cli, Item, Cantidad) values (" & Session("idUsuario") & ", '" & Cosa & "', " & Cantidad & ")") = False Then
                lErrorPedido.Text = "No puedo agregar el item a la lista, intente mas tarde."
                Exit Sub
            End If
        End If
        tCantLatas.SelectedIndex = 0
        CargaTemporal()
    End Sub

    Protected Sub gListaPedido_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gListaPedido.RowCommand
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim row As GridViewRow = gListaPedido.Rows(index)
        Dim Item As String = row.Cells(1).Text, en As String = Chr(13) & Chr(10)
        Dim consulta As String = "delete web_pedidos_temporal where ltrim(rtrim(item))='" & Item & "' and num_cli=" & VNum(Session("idUsuario"))

        lErrorPedido.Text = ""
        If (e.CommandName = "Quitar") Then
            If SQL_Accion(consulta) = False Then
                lErrorPedido.Text = "No puedo quitar el item de la lista. Intente mas tarde."
                Exit Sub
            End If
            CargaTemporal()
        End If
    End Sub

    Protected Sub bQuitarTodos_Click(sender As Object, e As ImageClickEventArgs) Handles bQuitarTodos.Click
        If SQL_Accion("delete web_pedidos_temporal where num_cli=" & VNum(Session("idUsuario"))) = False Then
            lErrorPedido.Text = "No puedo quitar a todos los items de la lista. Intente mas tarde."
            Exit Sub
        End If
        CargaTemporal()
    End Sub

    Sub CargarHistorico()
        lErrorHistorico.Text = ""
        Dim idU As Integer = VNum(Session("idUsuario"))
        Dim da1 As New SqlDataAdapter("select NPedido, Fecha, Estado from WEB_Pedidos where Num_Cli=" & idU & " and Estado<>'Enviado' order by NPedido desc", con)
        Dim ds1 As New DataSet

        da1.Fill(ds1, "histo")
        gHistorico.DataSource = ds1.Tables("histo")
        gHistorico.DataBind()
        If ds1.Tables("histo").Rows.Count = 0 Then
            lErrorHistorico.Text = "No hay pedidos enteriores o hubo un error al cargarlos. Reintente mas tarde."
            gHistorico.Visible = False
        Else
            gHistorico.Visible = True
        End If
        pPedidos.Visible = False
        pHistorico.Visible = True
    End Sub

    Sub CargarHistoricoGeneral()
        Dim da1 As New SqlDataAdapter("select * from WEB_Pedidos order by NPedido desc", con)
        Dim ds1 As New DataSet

        da1.Fill(ds1, "generales")
        gPedidosGenerales.DataSource = ds1.Tables("generales")
        gPedidosGenerales.DataBind()

    End Sub

    Protected Sub gHistorico_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gHistorico.RowCommand
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim row As GridViewRow = gHistorico.Rows(index)
        Dim Npedido As Integer = VNum(row.Cells(2).Text), en As String = Chr(13) & Chr(10)
        If (e.CommandName = "Ver") Then
            Label3.Text = "Detalle del Pedido N° " & Npedido

            lErrorVerUnPedido.Text = ""
            Dim da1 As New SqlDataAdapter("SELECT WEB_Pedidos_Detalle.Item, " &
                "WEB_Pedidos_Detalle.Cantidad FROM WEB_Pedidos_Detalle INNER JOIN Web_Helados ON " &
                "WEB_Pedidos_Detalle.Item = Web_Helados.Gusto WHERE WEB_Pedidos_Detalle.NPedido=" &
                Npedido & " ORDER BY Web_Helados.CodH", con)

            Dim ds1 As New DataSet
            da1.Fill(ds1, "histo")
            gVerUnPedido.DataSource = ds1.Tables("histo")
            gVerUnPedido.DataBind()
            If ds1.Tables("histo").Rows.Count = 0 Then
                lErrorHistorico.Text = "Hubo un error al cargar los items del pedido " & Npedido &
                    ", porque no se leyo ninguno. Reintente mas tarde."
                gVerUnPedido.Visible = False
            Else
                gVerUnPedido.Visible = True
            End If
            pHistorico.Visible = False
            pVerUnPedido.Visible = True
        End If

        If (e.CommandName = "Anular") Then
            'tengo que mirar el estado del pedido (pudo haber dejado abierto con Solicitando pero ya se lo enviaron)
            lErrorHistorico.Text = ""
            Dim da1 As New SqlDataAdapter("select Estado from WEB_Pedidos where NPedido=" & Npedido, con)
            Dim ds1 As New DataSet
            da1.Fill(ds1, "histo")

            If ds1.Tables("histo").Rows.Count = 0 Then
                lErrorHistorico.Text = "No puedo acceder al al pedido N° " & Npedido & ". Reintente mas  tarde."
                Exit Sub
            Else
                Dim Estado As String = ds1.Tables("histo")(0)("estado").ToString.Trim
                If Estado <> "Solicitado" Then
                    lErrorHistorico.Text = "El pedido tiene estado='" & Estado & "' y ya no puede cancelarse por web (solo 'Solicitado'). Llame a la fabrica " & "por favor."
                    Exit Sub
                Else
                    If Estado = "Anulado" Then
                        lErrorHistorico.Text = "El pedido N° " & Npedido & ", YA estaba Anulado..."
                        Exit Sub
                    End If
                    lErrorHistorico.Text = ""
                    If SQL_Accion("update WEB_Pedidos set Estado='Anulado' where NPedido=" & Npedido) = False Then
                        lErrorHistorico.Text = "No he podido cambiar el estado, hubo algun " & "error de conexion- Por favor, reintente mas tarde a llame a la " & "fabrica para avisar de la anulacion."
                        Exit Sub
                    Else
                        lPedidoAnulado.Text = "El pedido N° " & Npedido & ", fue ANULADO "
                        pHistorico.Visible = False
                        pPedidoAnulado.Visible = True
                        Exit Sub
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub ImageButton8_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton8.Click
        CargarHistorico()
    End Sub

    Protected Sub bTerminarHistorico_Click(sender As Object, e As ImageClickEventArgs) Handles bTerminarHistorico.Click
        pHistorico.Visible = False
        pPedidos.Visible = True
    End Sub

    Protected Sub ImageButton9_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton9.Click
        pVerUnPedido.Visible = False
        pHistorico.Visible = True
    End Sub

    Protected Sub ImageButton5_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton5.Click
        pPedidoCreado.Visible = False
        pPedidos.Visible = True
    End Sub

    Protected Sub ImageButton6_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton6.Click
        CargarHistorico()
        pPedidoAnulado.Visible = False
        pHistorico.Visible = True
    End Sub

    Function EnviarMail(ByVal EmailDestino As String, ByVal Subject As String, ByVal Mensaje As String) As String

        'Devuelve "Ok" si lo envio, sino, devuelve el mensaje de error producido'

        Dim Resultado As String = "Ok"
        Dim SmtpServer As New SmtpClient()
        Dim mail As New MailMessage()

        Try
            mail = New MailMessage()

            mail.From = New MailAddress(Email, "Helados UNLZ")
            mail.To.Add(EmailDestino)
            mail.Subject = Subject
            mail.Body = Mensaje
            mail.IsBodyHtml = False
            mail.Priority = mail.Priority.Normal

            If EmailActivo = "EmailGmail" Then
                SmtpServer.Credentials = New Net.NetworkCredential(Email, EmailPass)
                SmtpServer.Host = "smtp.gmail.com"
                SmtpServer.Port = 587
                SmtpServer.EnableSsl = True
            Else
                'Para Email DonWeb
                'SmtpServer.Host = "localhost"
                SmtpServer.Credentials = New Net.NetworkCredential(Email, EmailPass)
                SmtpServer.Host = "dtcwin033.ferozo.com"
                SmtpServer.Port = 465
                SmtpServer.EnableSsl = True
            End If

            SmtpServer.Send(mail)
        Catch
            Resultado = Err.Description
        End Try
        mail.Dispose()
        Return Resultado
    End Function

    Protected Sub bRecuperarClave_Click(sender As Object, e As ImageClickEventArgs) Handles bRecuperarClave.Click

        Dim usu As String = tUsuario.Text.Trim.ToUpper, email As String, xusuario As String, mensaje As String, pass As String
        Dim en As String = Chr(13) & Chr(10)

        If comprobar(usu) = False Then
            lReenviarClave.Text = "*** El usuario es incorrecto, Revisa por favor. ***"
            lReenviarClave.Visible = True
            Exit Sub
        End If

        Dim da2 As New SqlDataAdapter("Select ltrim(rtrim(nombre)) + ' ' + ltrim(rtrim(apellido)) as usuario, pass, " & " email from usuarios where upper(ltrim(rtrim(usuario))) = '" & usu & "'", con)

        Dim ds2 As New DataSet
        da2.Fill(ds2, "Login")
        If ds2.Tables("Login").Rows.Count = 0 Then
            lReenviarClave.Text = "*** El usuario es incorrecto. Revisa por favor. ***"
            lReenviarClave.Visible = True
            Exit Sub
        End If

        email = ds2.Tables("Login").Rows(0)("email").ToString.Trim.ToLower
        pass = ds2.Tables("Login").Rows(0)("pass").ToString.Trim.ToLower
        xusuario = ds2.Tables("Login").Rows(0)("usuario").ToString.Trim

        mensaje = "Hola " & xusuario & "." & en & en & "Le escribimos desde Helados UNLZ, respondiendo a su pedido " &
            "de recuperacion de clave. " & en & en & "Su usuario es " & " "" " & usu & """" & en & "Su clave es " &
            """" & pass & """" & en & en & "Ya podes volver a entrar y armar tus pedidos!" & en &
            "Un gran saludo desde Helados UNLZ!" & en & en & en & en &
            "(Por favor no respondas a este mail, es automatico. . . Gracias!" & en & en

        Dim ok As String = EnviarMail(email, "Helados UNLZ - Clave recuperada", mensaje)

        If ok = "Ok" Then
            lReenviarClave.Text = "*** Ya te enviamos un mail con la clave! ***"
        Else
            lReenviarClave.Text = "*** Hubo un error al querer enviar el mail. . . ***"
        End If

        lReenviarClave.Visible = True

    End Sub

    Public Function CreaCodigo(ByVal cantCaracteres As Integer) As String
        'Crea un codigo de tantos caracteres como cantCaracteres, mezclando numeros y letras

        Dim strRand As String = Nothing, r As New Random, c As String, i As Integer

        For i = 0 To cantCaracteres - 1

            If Math.Round(r.Next(0, 2)) = 0 Then
                c = Chr(Math.Round(r.Next(48, 58)))
            Else
                c = Chr(Math.Round(r.Next(65, 91)))
            End If
            strRand &= c
        Next

        Return strRand
    End Function

    Protected Sub bValidar_Click(sender As Object, e As EventArgs) Handles bValidar.Click
        pValidarEmail.Visible = False

        Dim sqlIngreso As String = Session("sqlIngreso") & " "
        If sqlIngreso.Length < 10 Or sqlIngreso.IndexOf("insert") < 0 Then
            lErroresU.Text = "Hubo un error con el codigo. Por favor, trate de generar un nuevo codigo."
            lErroresU.Visible = True
            Exit Sub
        End If

        If tValidar.Text.Trim.ToUpper <> Session("codigo") Then
            lCodigo.Visible = True
            Exit Sub
        End If

        If SQL_Accion(sqlIngreso) = False Then
            lErroresU.Text = "Hubo un error al tratar de validar el codigo. Por favor, " &
                "trate de generar un nuevo codigo."
            lErroresU.Visible = True
            Exit Sub
        End If

        Session("idUsuario") = VNum(LeeUnCampo("select top 1 idUsuario from usuarios where Usuario ='" & Session("Usuario") & "' and Pass = '" & Session("Password") & "' ", "idUsuario"))
        lBienvenido.Text = "Bienvenido" & Session("ApellidoYNombre") & " !!"

        Dim mensaje As String, xusuario As String = Session("ApellidoYNombre"),
            en As String = Chr(13) & Chr(10)
        mensaje = "Bienvenido " & xusuario & " a los Cursos de ASP .NET!." & en & en &
            "Te damos una cordial bienvenida a la comunidad de ASP .NET!." & en & en &
            "Tu usuario es " & """" & Session("Usuario") & """" & en & en &
            "Tu clave es " & """" & Session("Password") & """" & en & en &
            "Ya podes logearte para ver tus datos!!." & en & en

        LimpiarRegistroU()
        pRegistrarse.Visible = False
        pBienvenidos.Visible = True
        bRegistrarseVolverLoguinU13.Focus()
    End Sub

    Protected Sub bRegresarRegistro_Click(sender As Object, e As EventArgs) Handles bRegresarRegistro.Click
        pValidarEmail.Visible = False
        tValidar.Text = ""
        pRegistrarse.Visible = True
    End Sub

    Protected Sub bCancelarValidar_Click(sender As Object, e As ImageClickEventArgs) Handles bCancelarValidar.Click
        pValidarEmail.Visible = False
        tValidar.Text = ""
        pRegistrarse.Visible = True
    End Sub

    Protected Sub bAdministrador_Click(sender As Object, e As EventArgs) Handles bAdministrador.Click
        Session("QueEs") = "Administradores"
        Loguea()
    End Sub

    Protected Sub bABMProducto_Click(sender As Object, e As EventArgs) Handles bABMProducto.Click
        pAreaUsuario.Visible = False
        pAreaAdministracion.Visible = True
        LimpiarErroresRegistroU()
    End Sub

    Protected Sub bVolver_Click(sender As Object, e As EventArgs) Handles bVolver.Click
        pAreaAdministracion.Visible = False
        pAreaUsuario.Visible = True
        LimpiarErroresRegistroU()
    End Sub

    Protected Sub bAgregarProducto_Click(sender As Object, e As EventArgs) Handles bAgregarProducto.Click
        pAreaAdministracion.Visible = False
        pAgregarProducto.Visible = True
        LimpiarErroresRegistroU()
    End Sub

    Protected Sub bSalirAgregar_Click(sender As Object, e As EventArgs) Handles bSalirAgregar.Click
        pAgregarProducto.Visible = False
        pAreaAdministracion.Visible = True
        LimpiarErroresRegistroU()
    End Sub

    Protected Sub bAgregarProd_Click(sender As Object, e As EventArgs) Handles bAgregarProd.Click

        LimpiarErroresRegistroU()

        Dim ok As Boolean = True

        tGusto.Text = tGusto.Text.Trim

        If comprobar(tGusto.Text) = False Then
            ArreglarCampo(tGusto)
            ok = False
            lGusto.Text = "El Gusto no es valido."
            lGusto.Visible = True
        End If

        Session("Gusto") = tGusto.Text.Trim

        Dim PrecioSinIva As Decimal = tPrecioSinIva.Text

        Dim Stock As Decimal = tStock.Text

        If YaExisteSQL("select Gusto from Web_Helados where Gusto ='" & Session("Gusto") & "'") Then
            ok = False
            lGusto.Text = "El sabor de Helado ya existe. Pruebe con otro."
            lGusto.Visible = True
        End If

        Session("sqlIngreso") = "insert into Web_Helados (Gusto, PrecioSinIva, Stock) values ('" & tGusto.Text.Trim & "'," & PrecioSinIva & "," & Stock & ")"

        If ok Then
            If SQL_Accion(Session("sqlIngreso")) = False Then
                lMensajeErrorProducto.Text = "Hubo un error al ingresar el producto a la base de datos."
                lMensajeErrorProducto.Visible = True

            Else
                lMensajeProducto.Text = "Producto agregado exitosamente."
                lMensajeProducto.Visible = True
                pAgregarProducto.Visible = False
                pAreaAdministracion.Visible = True
            End If
        Else
            lMensajeErrorProducto.Text = "Hubo un error al querer agregar producto."
            lMensajeErrorProducto.Visible = True
        End If

    End Sub

    Protected Sub bModificarProducto_Click(sender As Object, e As EventArgs) Handles bModificarProducto.Click
        LimpiarErroresRegistroU()
        pAreaAdministracion.Visible = False
        pModificarProducto.Visible = True
        CargarHelados()

    End Sub

    Protected Sub bSalirModificar_Click(sender As Object, e As EventArgs) Handles bSalirModificar.Click
        LimpiarErroresRegistroU()
        pAreaAdministracion.Visible = True
        pModificarProducto.Visible = False
    End Sub

    Protected Sub bModificarProd_Click(sender As Object, e As EventArgs) Handles bModificarProd.Click
        LimpiarErroresRegistroU()

        Dim ok As Boolean = True

        tGustoMod.Text = tGustoMod.Text.Trim

        If comprobar(tGustoMod.Text) = False Then
            ArreglarCampo(tGustoMod)
            ok = False
            lGustoMod.Text = "El Gusto no es valido."
            lGustoMod.Visible = True
        End If

        Session("GustoMod") = tGustoMod.Text.Trim

        Dim PrecioSinIva As Decimal = tPrecioSinIvaMod.Text

        Dim Stock As Decimal = tStockMod.Text

        Dim ProductoAModificar As String = ddlHelados.SelectedValue

        If YaExisteSQL("select Gusto from Web_Helados where Gusto ='" & Session("GustoMod") & "'") Then
            ok = False
            lGustoMod.Text = "El sabor de Helado ya existe. Pruebe con otro."
            lGustoMod.Visible = True
        End If

        Session("sqlIngreso") = "update Web_Helados set Gusto = '" & tGustoMod.Text.Trim & "', PrecioSinIva = " & PrecioSinIva & ", Stock = " & Stock & " where Gusto = '" & ProductoAModificar & "'"

        If ok Then
            If SQL_Accion(Session("sqlIngreso")) = False Then
                lErrorModificarProducto.Text = "Hubo un error al ingresar el producto a la base de datos."
                lErrorModificarProducto.Visible = True

            Else
                lMensajeProducto.Text = "Producto modificado exitosamente."
                lMensajeProducto.Visible = True
                pModificarProducto.Visible = False
                pAreaAdministracion.Visible = True
            End If
        Else
            lErrorModificarProducto.Text = "Hubo un error al querer agregar producto."
            lMensajeErrorProducto.Visible = True
        End If
    End Sub

    Protected Sub bVerPedidosGeneral_Click(sender As Object, e As EventArgs) Handles bVerPedidosGeneral.Click
        pAreaUsuario.Visible = False
        pPedidosGenerales.Visible = True
        CargarHistoricoGeneral()
    End Sub

    Protected Sub bSalirPedidosGeneral_Click(sender As Object, e As ImageClickEventArgs) Handles bSalirPedidosGeneral.Click
        pPedidosGenerales.Visible = False
        pAreaUsuario.Visible = True
    End Sub

    Protected Sub gPedidosGenerales_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gPedidosGenerales.RowCommand
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim row As GridViewRow = gPedidosGenerales.Rows(index)
        Dim Npedido As Integer = VNum(row.Cells(3).Text)
        If (e.CommandName = "Ver") Then
            Label3.Text = "Detalle del Pedido N° " & Npedido

            lErrorVerUnPedido.Text = ""
            Dim da1 As New SqlDataAdapter("SELECT WEB_Pedidos_Detalle.Item, " &
                "WEB_Pedidos_Detalle.Cantidad FROM WEB_Pedidos_Detalle WHERE WEB_Pedidos_Detalle.NPedido=" &
                Npedido & " ", con)

            Dim ds1 As New DataSet
            da1.Fill(ds1, "histo")
            gVerUnPedido.DataSource = ds1.Tables("histo")
            gVerUnPedido.DataBind()
            If ds1.Tables("histo").Rows.Count = 0 Then
                lErrorHistorico.Text = "Hubo un error al cargar los items del pedido " & Npedido &
                    ", porque no se leyo ninguno. Reintente mas tarde."
                gVerUnPedido.Visible = False
            Else
                gVerUnPedido.Visible = True
            End If
            pHistorico.Visible = False
            pVerUnPedido.Visible = True
        End If



        'If (e.CommandName = "Editar") Then
        '    Label3.Text = "Detalle del Pedido N° " & Npedido

        '    lErrorVerUnPedido.Text = ""
        '    Dim da1 As New SqlDataAdapter("SELECT WEB_Pedidos_Detalle.Item, " &
        '        "WEB_Pedidos_Detalle.Cantidad FROM WEB_Pedidos_Detalle INNER JOIN Web_Helados ON " &
        '        "WEB_Pedidos_Detalle.Item = Web_Helados.Gusto WHERE WEB_Pedidos_Detalle.NPedido=" &
        '        Npedido & " ORDER BY Web_Helados.CodH", con)

        '    Dim ds1 As New DataSet
        '    da1.Fill(ds1, "histo")
        '    gVerUnPedido.DataSource = ds1.Tables("histo")
        '    gVerUnPedido.DataBind()
        '    If ds1.Tables("histo").Rows.Count = 0 Then
        '        lErrorHistorico.Text = "Hubo un error al cargar los items del pedido " & Npedido &
        '            ", porque no se leyo ninguno. Reintente mas tarde."
        '        gVerUnPedido.Visible = False
        '    Else
        '        gVerUnPedido.Visible = True
        '    End If
        '    pHistorico.Visible = False
        '    pVerUnPedido.Visible = True
        'End If

        If (e.CommandName = "Anular") Then
            'tengo que mirar el estado del pedido (pudo haber dejado abierto con Solicitando pero ya se lo enviaron)
            lErrorHistorico.Text = ""
            Dim da1 As New SqlDataAdapter("select Estado from WEB_Pedidos where NPedido=" & Npedido, con)
            Dim ds1 As New DataSet
            da1.Fill(ds1, "histo")

            If ds1.Tables("histo").Rows.Count = 0 Then
                lErrorHistorico.Text = "No puedo acceder al al pedido N° " & Npedido & ". Reintente mas  tarde."
                Exit Sub
            Else
                Dim Estado As String = ds1.Tables("histo")(0)("estado").ToString.Trim
                If Estado <> "Solicitado" Then
                    lErrorHistorico.Text = "El pedido tiene estado='" & Estado & "' y ya no puede cancelarse por web (solo 'Solicitado'). Llame a la fabrica " & "por favor."
                    Exit Sub
                Else
                    If Estado = "Anulado" Then
                        lErrorHistorico.Text = "El pedido N° " & Npedido & ", YA estaba Anulado..."
                        Exit Sub
                    End If
                    lErrorHistorico.Text = ""
                    If SQL_Accion("update WEB_Pedidos set Estado='Anulado' where NPedido=" & Npedido) = False Then
                        lErrorHistorico.Text = "No he podido cambiar el estado, hubo algun " & "error de conexion- Por favor, reintente mas tarde a llame a la " & "fabrica para avisar de la anulacion."
                        Exit Sub
                    Else
                        lPedidoAnulado.Text = "El pedido N° " & Npedido & ", fue ANULADO "
                        pHistorico.Visible = False
                        pPedidoAnulado.Visible = True
                        Exit Sub
                    End If
                End If
            End If
        End If

        If (e.CommandName = "Editar") Then

            Dim da1 As New SqlDataAdapter("SELECT WEB_Pedidos_Detalle.Item, " &
                "WEB_Pedidos_Detalle.Cantidad FROM WEB_Pedidos_Detalle WHERE WEB_Pedidos_Detalle.NPedido=" &
                Npedido & " ", con)

            Dim ds1 As New DataSet
            da1.Fill(ds1, "histo")
            gEditarPedido.DataSource = ds1.Tables("histo")
            gEditarPedido.DataBind()
            If ds1.Tables("histo").Rows.Count = 0 Then
                lErrorHistorico.Text = "Hubo un error al cargar los items del pedido " & Npedido &
                    ", porque no se leyo ninguno. Reintente mas tarde."
                gEditarPedido.Visible = False
            Else
                gEditarPedido.Visible = True
                lNPedidoAEditar.Text = Npedido
            End If
            pEditarPedido.Visible = True
        End If

        pPedidosGenerales.Visible = False
    End Sub

    Protected Sub bSalirVerPedidos_Click(sender As Object, e As ImageClickEventArgs) Handles bSalirVerPedidos.Click
        pEditarPedido.Visible = False
        pPedidosGenerales.Visible = True
    End Sub

    Protected Sub gEditarPedido_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gEditarPedido.RowCommand
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim row As GridViewRow = gEditarPedido.Rows(index)
        Dim Item As String = row.Cells(1).Text, en As String = Chr(13) & Chr(10)
        Dim consulta As String = "delete web_pedidos_detalle where item='" & Item & "' and NPedido=" & VNum(lNPedidoAEditar.Text)

        Dim email As String = TraerMailUsuario(lNPedidoAEditar.Text)

        If (e.CommandName = "Quitar") Then
            If SQL_Accion(consulta) = False Then
                lErrorPedido.Text = "No puedo quitar el item de la lista. Intente mas tarde."
                Exit Sub
            End If
            CargarGrillaEditPedido()
        End If
    End Sub

    Public Function TraerMailUsuario(NPedido As String) As String
        Dim da1 = New SqlDataAdapter($"select NUM_CLI from WEB_Pedidos where Npedido = {NPedido}", con)
        Dim ds1 = New DataSet()
        da1.Fill(ds1, "dato1")
        Dim numCli As String = ds1.Tables("dato1").Rows(0)("Num_Cli").ToString()
        Dim da2 = New SqlDataAdapter($"select Email from Usuarios where idUsuario = {numCli}", con)
        Dim ds2 = New DataSet()
        da2.Fill(ds2, "dato")
        Try
            Dim email = ds2.Tables("dato").Rows(0)("Email").ToString()
            Return email

        Catch
            Return ""
        End Try

    End Function

    Sub CargarGrillaEditPedido()
        Dim da1 As New SqlDataAdapter("SELECT WEB_Pedidos_Detalle.Item, " &
                "WEB_Pedidos_Detalle.Cantidad FROM WEB_Pedidos_Detalle WHERE WEB_Pedidos_Detalle.NPedido=" &
                lNPedidoAEditar.Text & " ", con)

        Dim ds1 As New DataSet
        da1.Fill(ds1, "histo")
        gEditarPedido.DataSource = ds1.Tables("histo")
        gEditarPedido.DataBind()
        If ds1.Tables("histo").Rows.Count = 0 Then
            lErrorHistorico.Text = "Hubo un error al cargar los items del pedido " & lNPedidoAEditar.Text &
                ", porque no se leyo ninguno. Reintente mas tarde."
            gEditarPedido.Visible = False
        End If
        gEditarPedido.Visible = True
    End Sub

    Protected Sub bEnviarPedido_Click(sender As Object, e As ImageClickEventArgs) Handles bEnviarPedido.Click

        If SQL_Accion("update WEB_Pedidos set Estado='Enviado' where NPedido=" & lNPedidoAEditar.Text) = False Then
            lErrorHistorico.Text = "No he podido cambiar el estado, hubo algun " & "error de conexion- Por favor, reintente mas tarde a llame a la " & "fabrica para avisar del Envio."
            Exit Sub
        Else
            CargarHistoricoGeneral()
            pEditarPedido.Visible = False
            pPedidosGenerales.Visible = True
            Exit Sub
        End If
    End Sub

    Sub CargarUsuarios()
        Dim da1 As New SqlDataAdapter("select Nombre, Apellido, Usuario, Email, Activo from Usuarios", con)
        Dim ds1 As New DataSet

        da1.Fill(ds1, "usuarios")
        gListaUsuarios.DataSource = ds1.Tables("usuarios")
        gListaUsuarios.DataBind()
    End Sub

    Protected Sub bAdministrarUsuarios_Click(sender As Object, e As EventArgs) Handles bAdministrarUsuarios.Click
        pAreaUsuario.Visible = False
        pAdministracionUsuarios.Visible = True
        CargarUsuarios()
    End Sub

    Protected Sub bSalirAdministracionUsuarios_Click(sender As Object, e As EventArgs) Handles bSalirAdministracionUsuarios.Click
        pAreaUsuario.Visible = True
        pAdministracionUsuarios.Visible = False
    End Sub

    Protected Sub gListaUsuarios_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gListaUsuarios.RowCommand
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim row As GridViewRow = gListaUsuarios.Rows(index)
        Dim usuario As String = row.Cells(5).Text, en As String = Chr(13) & Chr(10), email As String = row.Cells(6).Text
        Dim consultaDes As String = "update Usuarios set Activo = 0 where Usuario='" & usuario & "' "
        Dim consultaAct As String = "update Usuarios set Activo= 1 where Usuario='" & usuario & "' "
        Dim consultaElim As String = "delete Usuarios where Usuario='" & usuario & "' "


        If (e.CommandName = "Desactivar") Then
            If SQL_Accion(consultaDes) = False Then
                lErrorPedido.Text = "No puedo quitar el item de la lista. Intente mas tarde."
                Exit Sub
            Else
                EnviarMail(email, "Se Desactivo su cuenta", tbMensajeAUsuario.Text)
            End If
        End If
        If (e.CommandName = "Activar") Then
            If SQL_Accion(consultaAct) = False Then
                lErrorPedido.Text = "No puedo quitar el item de la lista. Intente mas tarde."
                Exit Sub
            Else
                EnviarMail(email, "Se Activo su cuenta", tbMensajeAUsuario.Text)
            End If
        End If
        If (e.CommandName = "Eliminar") Then
            If SQL_Accion(consultaElim) = False Then
                lErrorPedido.Text = "No puedo quitar el item de la lista. Intente mas tarde."
                Exit Sub
            Else
                EnviarMail(email, "Se Elimino su cuenta", tbMensajeAUsuario.Text)
            End If
        End If

        CargarUsuarios()
    End Sub
End Class