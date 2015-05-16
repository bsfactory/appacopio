<?php
ini_set('mssql.charset', 'UTF-8');
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);
require_once("../model/ConexionBD.php");
require_once("../model/producto.class.php");

$Producto = new Producto();
$sql=$Producto->ListadoGeneral();

$pnt="style='cursor:pointer'";
?>


<img src="img/vcard_add.png" style="vertical-align:middle">&nbsp;&nbsp;<a onclick="mostrar('n_producto',0)">Nuevo</a>
<br><br>

<form name="form_">
<div id="formulario_" style="margin:0 auto">

<?php 
	if(mysqli_num_rows($sql)>0){ 
?>
<h4 style="color:#F00"><strong>LISTADO DE PRODUCTOS:</strong></h4><hr />

<table width="800" border="1">
  <tr>
    <th>&nbsp;Num.</th>
    <th>&nbsp;Descripcion</th>
    <th>&nbsp;Tipo</th>
    <th>&nbsp;Peso</th>
    <th>&nbsp;</th>
    <th>&nbsp;</th>
  </tr>
	<?php
  		$i=1;
		while($rw=mysqli_fetch_array($sql)){
	?>
			<tr>
			<td>&nbsp;<?php echo $i;?></td>
			<td>&nbsp;<?php echo $rw["Descripcion"]; ?></td>
			<td>&nbsp;<?php echo $rw["TipoProducto"];?></td>
			<td>&nbsp;<?php echo $rw["Peso"];?></td>
			
			<td>&nbsp;<img $pnt src='img/zoom.png' title='Ver Productores' onclick="mostrar('n_producto',<?php echo $rs["Id_Producto"];?>)"></td>
			<td>&nbsp;<img $pnt src='img/editar_edit.gif' title='Editar' onclick="mostrar('n_producto',<?php echo $rs["Id_Producto"];?>)"></td>
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


