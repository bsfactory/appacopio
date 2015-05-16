<?php
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);
require_once("../model/ConexionBD.php");
require_once("general.class.php");

		
$general = new general();

$sql1=$general->ListarAlertasPorCodigo($id1);
$sql2=$general->ListarPersonasPorCodigo($id2);

$cad1="";
while($rw1=mysqli_fetch_array($sql1)){
		$cad1=$cad1.$rw1["Id_Alerta"].",";
}


$cad2="";
while($rw2=mysqli_fetch_array($sql2)){
		$tmp=$rw2["Apellidos"].".".$rw2["Nombres"].".".$rw2["Dni"];
		$cad2=$cad2.$tmp.",";
}


echo $cad1."-".$cad2;

?>