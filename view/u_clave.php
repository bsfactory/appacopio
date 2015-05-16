<?php
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);
require_once("../model/ConexionBD.php");
require_once("../controller/general.class.php");

$general = new general();
$rs=odbc_fetch_array($general->UsuarioPorCodigo($_SESSION["cod"]));

?>

<div id="formu" style="display:block">
    <div style="float:left"><img src="img/password.png" width="278" height="218"></div>
    <input type="hidden" id="password" value="<?php echo $rs["Clave"];?>">
	<input type="hidden" id="cod" value="<?php echo $rs["Id_Usuario"];?>">
    <table width="484" border="0">
        <tr><td width="669">
            <table width="484" border="0">
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" style="font-weight:bold">CAMBIAR CONTRASEÑA</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr>
                <td width="29">&nbsp;</td>
                <td width="112">&nbsp;&nbsp;Contraseña Anterior</td>
                <td width="14">:</td>
                <td>&nbsp;
                  <input name="pass_old" type="password" id="pass_old" size="20" maxlength="32"/></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td width="112">&nbsp;&nbsp;Contraseña Nueva</td>
                <td>:</td>
                <td>&nbsp;
                <input name="pass_new" type="password"  id="pass_new" size="20" maxlength="32"/></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td width="112">&nbsp;&nbsp;Repetir Contraseña</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="pass_new2" type="password" id="pass_new2" size="20" maxlength="32"/></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td style="font-weight:bold"><div id="boton" style="display:block"><input type="button" name="btnGuardar" id="accion" value="Guardar" onclick="AccionClave()" class="inputsubmit"/></div></td>
                <td style="font-weight:bold">&nbsp;</td>
                <td>&nbsp;</td>
                </tr>
            </table>
      </td></tr>

    </table>
</div>
<div id="info"></div>