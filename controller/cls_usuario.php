<?php
ob_start();
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);
require_once("../model/ConexionBD.php");
require_once("../model/usuario.class.php");

$Usuario = new Usuario();


$datos=explode('*',$datos);
$rptprocs=false;
$texto="";



if($accion=="CambiarEstado"){
	
	$rw = mysqli_fetch_array($Usuario->CambiarEstado($cod));
	$rptprocs=true;
	$rs = $rw["news"];
	
}elseif($accion=="Resetear"){
	
	$rptprocs = $Usuario->CambiarClave($cod);
	if($rptprocs){
		$rs = "4";
	}else{
		$rs = "3";
	}

}elseif($accion=="Eliminar"){
	
	$rptprocs = $Usuario->EliminarUsuario($cod);
	if($rptprocs){
		$rs = "5";
	}else{
		$rs = "3";
	}
		
}elseif($accion=="Grabar"){

	$rptprocs = $Usuario->GrabarUsuario($datos[1],$datos[2]);
	$accion="Registro";
	if($rptprocs){
		$rs = "Se ".$accion." con exito...<br>2";
	}else{
		$rs = "<h3 style='color:#D8000C'>Error.</h3>
		Ha ocurrido un error y no se ".$accion.", vuelva a intentarlo...<br><br>1";
	}
	
}elseif($accion=="Editar"){

	$rptprocs = $Usuario->EditarUsuario($datos[1],$datos[2],$datos[0]);
	$accion="Modifico";
	if($rptprocs){
		$rs = "Se ".$accion." con exito...<br>2";
	}else{
		$rs = "<h3 style='color:#D8000C'>Error.</h3>
		Ha ocurrido un error y no se ".$accion.", vuelva a intentarlo...<br><br>1";
	}

}else if($accion=="UpdatePass"){
	
	$rptprocs=$Usuario->EditarClave($pass,$cod);
	$accion="Cambio";
	if($rptprocs){
		$_SESSION["change"]="3";
		$rs = "Se ".$accion." con exito...<br>2";
	}else{
		$rs = "<h3 style='color:#D8000C'>Error.</h3>
		Ha ocurrido un error y no se ".$accion.", vuelva a intentarlo...<br><br>1";
	}
	
}


echo $rs;

ob_flush();
?>