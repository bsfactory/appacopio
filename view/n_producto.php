<?php
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);

require_once("../model/ConexionBD.php");
require_once("../model/general.class.php");
require_once("../model/producto.class.php");

$General = new General();
$Producto = new Producto();

$rs=mysqli_fetch_array($Producto->ListadoPorCodigo($cod));
$sql1=$General->ListadoTipoProducto();

if($cod==0){$btnname='Grabar';}else{$btnname='Editar';}
?>

<div id="Form_" style="display:block">
<div style="float:left"><img src="img/producto.jpg" width="300" height="234"></div>

<input type="hidden" id="id_producto" value="<?php echo $rs["Id_Producto"];?>">
<table width="484" border="0">
        <tr>
          <td width="478">
            <table width="481" border="0">
              <tr>
                <td width="29">&nbsp;</td>
                <td colspan="3" style="font-weight:bold">NUEVO PRODUCTO</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td width="112">&nbsp;</td>
                <td width="14">&nbsp;</td>
                <td width="308">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;&nbsp;Descripcion</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="descripcion" type="text" class="mayus" id="descripcion" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" value="<?php echo $rs["Paterno"];?>" size="40" maxlength="100"/></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;&nbsp;Tipo</td>
                <td>:</td>
                <td>&nbsp;
				<?php
					//if($data["id_TipoUsuario"]=="1"){$st2="selected";}else{$st2="";}
					//if($data["id_TipoUsuario"]=="2"){$st3="selected";}else{$st1="";}
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
                <td>&nbsp;&nbsp;Peso</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="peso" type="text" class="mayus" id="peso" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" value="<?php echo $rs["Paterno"];?>" size="10" maxlength="100"/></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;&nbsp;Tipo de Saco</td>
                <td>:</td>
                <td>&nbsp;
                <select name="t_saco" id="t_saco">
                  <option selected="selected">-</option>
                  <option <?php echo $st1;?> value="2">ADMINISTRADOR</option>
                  <option <?php echo $st2;?> value="1">CONSULTOR</option>
                </select></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;&nbsp;Productor</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="descripcion" type="text" class="mayus" id="descripcion" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" size="30" maxlength="100"/>&nbsp;<img src='img/zoom.png' title='Buscar Productor' onclick="mostrar('n_productor',0)"></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td style="font-weight:bold"><div id="Form_Boton" style="display:block"><input type="button" name="btnregistrar" id="btnregistrar" value="<?php echo $btnname;?>" onclick="AccionProducto(this)" class="inputsubmit"/></div></td>
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
