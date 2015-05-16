<?php
ob_start();
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);
require_once("../model/ConexionBD.php");
require_once("../model/productor.class.php");

$link=conectarse();

$Productor = new Productor();
$datos=explode('*',$datos);


$rptprocs=false;
$texto="";




if($accion=="Grabar"){
	
	$rptprocs=$Productor->Grabar($datos[0],$datos[1],$datos[2],$datos[3],$datos[4],$datos[5],$datos[6],$datos[7],$datos[8],$datos[9]);
	$accion="Registro";
	
}elseif($accion=="Editar"){
	
	$rptprocs=$Productor->Editar($datos[0],$datos[1],$datos[2],$datos[3],$datos[4],$datos[5],$datos[6],$datos[7],$datos[8],$datos[9],$datos[10]);
	$formu=1;
	$accion="Edito";
}



if($rptprocs){
	
	echo "Se ".$accion." con exito...<br>
	Haga clic en <a onclick='mostrar('v_productor',0)'>regresar</a> para volver.<br><br>2";

}else{
	
	echo "<h3 style='color:#D8000C'>Error.</h3>
	Ha ocurrido un error y no se ".$accion.", vuelva a intentarlo...<br><br>1";
	
}



ob_flush();
?>