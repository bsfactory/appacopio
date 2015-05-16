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
<div style="float:left"></div>

<input type="hidden" id="id_productor" value="<?php echo $rs["Id_Productor"];?>">
<table width="903" border="0">
        <tr>
          <td width="897">
            <table width="800" border="0">
              <tr>
                <td colspan="6" style="font-weight:bold;text-align:center;font-size:13px"><u>NOTA DE INGRESO DE CAFE A ALMACEN</u></td>
              </tr>
              <tr>
                <td width="120">&nbsp;</td>
                <td width="9">&nbsp;</td>
                <td width="234">&nbsp;</td>
                <td width="140">&nbsp;</td>
                <td width="9">&nbsp;</td>
                <td width="150">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;&nbsp;Productor</td>
                <td>:</td>
                <td>&nbsp;
                  <input name="descripcion" type="text" class="mayus" id="descripcion" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" size="30" maxlength="100"/>
  &nbsp;<img src='img/zoom.png' title='Buscar Productor' onclick="mostrar('n_productor',0)" /></td>
                <td style="text-align:right">Producto&nbsp;&nbsp;</td>
                <td>:</td>
                <td style="text-align:right">&nbsp;
                  <input name="descripcion" type="text" class="mayus" id="descripcion" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" size="30" maxlength="100"/>
  &nbsp;<img src='img/zoom.png' title='Buscar Productor' onclick="mostrar('n_productor',0)" /></td>
              </tr>
            </table>
            <table width="800" border="0">
              <tr>
                <td width="120">&nbsp;&nbsp;Tipo de Café Orgánico</td>
                <td width="9" align="center">:</td>
                <td width="166" align="center">NOP-USDA/UE
                  <input type="radio" name="radio" id="radio4" value="radio" /></td>
                <td width="166" align="center">FLO-FAIRTRADE
                  <input type="radio" name="radio" id="radio5" value="radio" /></td>
                <td width="166" align="center">UTZ Certified
                  <input type="radio" name="radio" id="radio6" value="radio" /></td>
              </tr>
            </table>
            <br>
            <table width="800" border="1" style="text-align:center">
              <tr>
                <th width="198" rowspan="2">&nbsp;TIPO DE CAFE</th>
                <th colspan="2">&nbsp;N° SACOS</th>
                <th width="119" rowspan="2">&nbsp;PESO ESTIMADO<br />
                  kg.</th>
                <th width="119" rowspan="2">&nbsp;ESTADO DE HUMEDAD</th>
                <th width="122" rowspan="2">&nbsp;OBSERVACION</th>
              </tr>
              <tr>
                <th width="78">&nbsp;YUTE</th>
                <th width="81">&nbsp;POLY</th>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>
            <br />
            <table width="800" border="0">
              <tr>
                <td width="348" style="font-weight:bold;text-align:center;font-size:13px"><u>CONTROL DE CALIDAD</u></td>
              </tr>
            </table>
            
            <table width="400" border="0" align="left">
              <tr>
                <td colspan="6" style="font-weight:bold">&nbsp;ANALISIS DE CAFE PERGAMINO (400 gr)</td>
              </tr>
              <tr>
                <td width="90">&nbsp;&nbsp;Humedad</td>
                <td width="9">:</td>
                <td width="70">&nbsp;
                  <input name="descripcion2" type="text" class="mayus" id="descripcion2" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" size="5" maxlength="100"/>
                  &nbsp;</td>
                <td width="100" style="text-align:right">Producto&nbsp;&nbsp;</td>
                <td width="9">:</td>
                <td width="70">&nbsp;
                  <input name="descripcion2" type="text" class="mayus" id="descripcion2" onblur="return validarLetrasConEspaci_o(event)" onkeypress="return validarLetrasConEspaci_o(event)" size="5" maxlength="100"/>
  &nbsp;</td>
              </tr>
            </table>
            
            <table width="400" border="0">
              <tr>
                <td width="90">&nbsp;</td>
                <td width="360">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td style="font-weight:bold">&nbsp;CONTROL DE PESO</td>
              </tr>
            </table>
            
            <br />
            <table width="400" border="1"  align="left">
              <tr>
                <th width="200">&nbsp;TIPO DE CAFE</th>
                <th width="100">&nbsp;GRAMOS</th>
                <th width="100">&nbsp;PORCENTAJE (%)</th>
              </tr>
              <tr>
                <td>&nbsp;Exportable</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;Segunda y Descarte</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;Cascarilla</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td style="text-align:center;font-weight:bold">&nbsp;TOTAL</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>
            
            <table width="80" border="0" align="left">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
            
            <table width="316" border="1">
              <tr>
                <th width="160">&nbsp;SACOS YUTE</th>
                <th width="160">&nbsp;kg.</th>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>
            <br />
            <table width="700" border="0">
              <tr>
                <td width="200" style="font-weight:bold;">&nbsp;PRESENCIA DE GRANOS:</td>
                <td width="166" align="center">Negro
                <input type="radio" name="radio" id="radio" value="radio" /></td>
                <td width="166" align="center">Marrones
                <input type="radio" name="radio" id="radio2" value="radio" /></td>
                <td width="166" align="center">Parcial N/M
                <input type="radio" name="radio" id="radio3" value="radio" /></td>
              </tr>
              <tr>
                <td valign="top" style="vertical-align:sub">Observaciones:</td>
                <td colspan="3"><textarea name="textarea" id="textarea" cols="70" rows="3"></textarea></td>
              </tr>
            </table>
            <p>&nbsp;</p>
          </td></tr>
        
          <tr><td></td></tr>
          <tr><td></td></tr>
        
        <tr>
          <td>&nbsp;</td></tr>
         
  </table>
</div>


<div id="info"></div>

<div id="msjvalides" class="error" style="display:none">No dejar formularios vacíos.<br>Ingresar todos los datos correctamente.</div>
