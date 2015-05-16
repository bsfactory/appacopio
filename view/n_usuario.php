<?php
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);

require_once("../model/ConexionBD.php");
require_once("../controller/general.class.php");

$general = new general();

$data=mysqli_fetch_array($general->UsuarioPorCodigo($cod));
?>

<div id="formu" style="display:block">
<div style="float:left"><img src="img/personal.png" width="300" height="234"></div>

<input type="hidden" id="idusuario" value="<?php echo $cod; ?>">
<table width="484" border="0">
        <tr>
          <td width="478">
            <table width="481" border="0">
              <tr>
                <td width="29">&nbsp;</td>
                <td colspan="3" style="font-weight:bold">NUEVO USUARIO</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td width="112">&nbsp;</td>
                <td width="14">&nbsp;</td>
                <td width="308">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;&nbsp;Usuario</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="usuario" type="text" class="mayus" id="usuario" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" value="<?php echo htmlentities($data["Usuario"]);?>" size="40" maxlength="100"/></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;&nbsp;Tipo</td>
                <td>:</td>
                <td>&nbsp;
				<?php
					if($data["id_TipoUsuario"]=="1"){$st2="selected";}else{$st2="";}
					if($data["id_TipoUsuario"]=="2"){$st3="selected";}else{$st1="";}
				?>                  
                  <select name="tipo" id="tipo">
                    <option selected="selected">-</option>
                    <option <?php echo $st1;?> value="2">ADMINISTRADOR</option>
                    <option <?php echo $st2;?> value="1">CONSULTOR</option>
                  </select>
                  <div id="buscarmsj"></div></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;&nbsp;Clave</td>
                <td>&nbsp;</td>
                <td>&nbsp;
                <input name="clave" type="password" class="mayus" id="clave" size="15" readonly="readonly" style="background-color:#FFF7E3" value="123"/> 
                  <strong style="color:#F00">(123)</strong></td>
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
                <td style="font-weight:bold"><div id="boton" style="display:block"><input type="button" name="btnregistrar" id="btnregistrar" value="Grabar" onclick="AccionUsuario(this)" class="inputsubmit"/></div></td>
                <td style="font-weight:bold">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>
    </td></tr>
        
          <tr><td></td></tr>
          <tr><td></td></tr>
        
        <tr>
          <td>&nbsp;</td></tr>
         
  </table>
</div>


<div id="info"></div>

<div id="msjvalides" class="error" style="display:none">No dejar formularios vacíos.<br>Ingresar todos los datos correctamente.</div>
