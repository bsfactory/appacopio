<?php
ini_set('mssql.charset', 'UTF-8');
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);
require_once("../model/ConexionBD.php");
require_once("../model/productor.class.php");

$Productor = new Productor();
$sql=$Productor->ListadoGeneral();

$pnt="style='cursor:pointer'";
?>


<img src="img/vcard_add.png" style="vertical-align:middle">&nbsp;&nbsp;<a onclick="mostrar('n_productor',0)">Nuevo</a>
<br><br>

<form name="form_">
<div id="formulario_" style="margin:0 auto">

<?php 
	if(mysqli_num_rows($sql)>0){ 
?>
<h4 style="color:#F00"><strong>LISTADO DE PRODUCTORES:</strong></h4><hr />

<table width="800" border="1">
  <tr>
    <th>&nbsp;Num.</th>
    <th>&nbsp;Datos</th>
    <th>&nbsp;Tipo Documento</th>
    <th>&nbsp;Nro Documento</th>
    <th>&nbsp;Zona</th>
    <th>&nbsp;Condicion</th>
    <th>&nbsp;Status</th>
    <th>&nbsp;</th>
    <th>&nbsp;</th>
    <th>&nbsp;</th>
  </tr>
	<?php
  		$i=1;
		while($rs=mysqli_fetch_array($sql)){
	?>
			<tr>
			<td>&nbsp;<?php echo $i;?></td>
			<td>&nbsp;<?php echo $rs["Datos"]; ?></td>
			<td>&nbsp;<?php echo $rs["TipoDoc"];?></td>
			<td>&nbsp;<?php echo $rs["Nro_DocIdentidad"];?></td>
			<td>&nbsp;<?php echo $rs["Zona"];?></td>
			<td>&nbsp;<?php echo $rs["Condicion"];?></td>
            <td>&nbsp;<?php echo $rs["Status_"];?></td>
            
			<td>&nbsp;<img $pnt src='img/zoom.png' title='Ver Productos' onclick="mostrar('n_productor',<?php echo $rs["Id_Productor"];?>)"></td>
			<td>&nbsp;<img $pnt src='img/editar_edit.gif' title='Editar' onclick="mostrar('n_productor',<?php echo $rs["Id_Productor"];?>)"></td>
			<td>&nbsp;<img $pnt class="<?php echo '';?>" src='img/trash.gif' title='Eliminar' onclick="CambiarUsuario(this,'Eliminar')"></td>
			</tr>
	<?php
			$i++;
		}
	}else{
		echo "<div style='color:#F00'><br>&nbsp;&nbsp;No hay ningún producto registrado.</div>";
	}
?>
</table>
<br>

</div>

</form>


