<?php
ini_set('mssql.charset', 'UTF-8');
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);
require_once("../model/ConexionBD.php");
require_once("../controller/general.class.php");

$general = new general();
$sql=$general->Usuario();

$pnt="style='cursor:pointer'";
?>


<img src="img/vcard_add.png" style="vertical-align:middle">&nbsp;&nbsp;<a onclick="Mostrar2(0)">Nuevo</a>
<br><br>

<form name="form_usuario">
<div id="formulario_usu" style="margin:0 auto">


<h4 style="color:#F00"><strong>USUARIOS:</strong></h4><hr />

<table width="800" border="1">
  <tr>
    <th>&nbsp;Num.</th>
    <th>&nbsp;Datos</th>
    <th>&nbsp;Tipo</th>
    <th>&nbsp;Estado</th>
    <th>&nbsp;</th>
    <th>&nbsp;</th>
    <th>&nbsp;</th>
  </tr>
  <?php
  		$i=1;
		while($rw=mysqli_fetch_array($sql)){
			if($rw["Estado"]==1){$img="Knob Green";$tit="Habilitado";}else{$img="Knob Red";$tit="Deshabilitado";}
			echo "<tr>";
			echo "<td>&nbsp;".$i."</td>";
			echo "<td>&nbsp;".$rw["Usuario"]."</td>";
			echo "<td>&nbsp;".$rw["Descripcion"]."</td>";
			echo "<td>&nbsp;"."<img $pnt class='".$rw["id_Usuario"]."' src='img/msj/".$img.".png' title='".$tit."' width='12' height='12' onclick='CambiarUsuario(this,\"CambiarEstado\")'>"."</td>";
			echo "<td>&nbsp;"."<img $pnt class='".$rw["id_Usuario"]."' src='img/key_go.png' title='Restablecer Clave' onclick='CambiarUsuario(this,\"Resetear\")'>"."</td>";
			echo "<td>&nbsp;"."<img $pnt src='img/editar_edit.gif' title='Editar' onclick='Mostrar2(".$rw["id_Usuario"].")'>"."</td>";
			echo "<td>&nbsp;"."<img $pnt class='".$rw["id_Usuario"]."' src='img/trash.gif' title='Eliminar' onclick='CambiarUsuario(this,\"Eliminar\")'>"."</td>";
			echo "</tr>";
			$i++;
		}
  ?>
</table>
<br>

</div>

</form>


