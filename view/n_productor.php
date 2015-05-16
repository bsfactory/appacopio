<?php
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);

require_once("../model/ConexionBD.php");
require_once("../model/general.class.php");
require_once("../model/productor.class.php");

$General = new General();
$Productor = new Productor();

$rs=mysqli_fetch_array($Productor->ListadoPorCodigo($cod));
$sql1=$General->ListadoTipoDoc();
$sql2=$General->ListadoZona();

if($cod==0){$btnname='Grabar';}else{$btnname='Editar';}
?>

<div id="Form_" style="display:block">
<div style="float:left"><img src="img/productor.jpg" width="300" height="234"></div>

<input type="hidden" id="id_productor" value="<?php echo $rs["Id_Productor"];?>">
<table width="484" border="0">
        <tr>
          <td width="478">
            <table width="481" border="0">
              <tr>
                <td width="29">&nbsp;</td>
                <td colspan="3" style="font-weight:bold">NUEVO PRODUCTOR</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td width="112">&nbsp;</td>
                <td width="14">&nbsp;</td>
                <td width="308">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;&nbsp;Paterno</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="paterno" type="text" class="mayus" id="paterno" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" value="<?php echo $rs["Paterno"];?>" size="30" maxlength="100"/></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;&nbsp;Materno</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="materno" type="text" class="mayus" id="materno" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" value="<?php echo $rs["Materno"];?>" size="30" maxlength="100"/></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;&nbsp;Nombres</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="nombres" type="text" class="mayus" id="nombres" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" value="<?php echo $rs["Nombres"];?>" size="30" maxlength="100"/></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;&nbsp;Tipo Documento</td>
                <td>:</td>
                <td>&nbsp;
                  <select name="t_documento" id="t_documento">
                    <option selected="selected">-</option>
                    <?php 
						while($rs1=mysqli_fetch_array($sql1)){
							if($rs["Id_TipoDocIdentidad"]==$rs1["Id_TipoDocIdentidad"]){$s="selected";}else{$s="";}
					?>
                    <option <?php echo $s;?> value="<?php echo $rs1["Id_TipoDocIdentidad"];?>"><?php echo $rs1["Descripcion"];?></option>
                    <?php } ?>
                  </select>
                  <div id="buscarmsj"></div></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;&nbsp;Nro Documento</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="n_documento" type="text" class="mayus" id="n_documento" onblur="return soloNumerosEnteros(event)" onkeypress="return soloNumerosEnteros(event)" value="<?php echo $rs["Nro_DocIdentidad"];?>" size="15" maxlength="100"/></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;&nbsp;Zona</td>
                <td>:</td>
                <td>&nbsp;
                  <select name="zona" id="zona">
                    <option selected="selected">-</option>
                     <?php 
						while($rs2=mysqli_fetch_array($sql2)){
							if($rs["Id_Zona"]==$rs2["Id_Zona"]){$s="selected";}else{$s="";}
					?>
                    <option <?php echo $s;?> value="<?php echo $rs2["Id_Zona"];?>"><?php echo $rs2["Descripcion"];?></option>
                    <?php } ?>
                </select></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;&nbsp;Condición</td>
                <td>:</td>
                <td>&nbsp;
                  <select name="condicion" id="condicion">
                    <option selected="selected">-</option>
                    <option <?php echo $st1;?> value="SI">SOCIO</option>
                    <option <?php echo $st2;?> value="NO">NO SOCIO</option>
                  </select></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;&nbsp;Status</td>
                <td>:</td>
                <td>&nbsp;
                <select name="status" id="status">
                  <option selected="selected">-</option>
                  <option <?php echo $st1;?> value="ORGANIC">ORGANIC</option>
                  <option <?php echo $st2;?> value="T2">T2</option>
                </select></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;&nbsp;Area Terreno (ha)</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="area" type="text" class="mayus" id="area" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" value="<?php echo $rs["Area_Terreno"];?>" size="10" maxlength="100"/></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;&nbsp;Prod. Estimada (t)</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="p_estimada" type="text" class="mayus" id="p_estimada" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" value="<?php echo $rs["Produccion_Estimada"];?>" size="10" maxlength="100"/></td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="16">&nbsp;</td>
                <td style="font-weight:bold"><div id="Form_Boton" style="display:block"><input type="button" name="btnregistrar" id="btnregistrar" value="<?php echo $btnname;?>" onclick="AccionProductor(this)" class="inputsubmit"/></div></td>
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
