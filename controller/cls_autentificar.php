<?php
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);
require_once("../model/ConexionBD.php");
require_once("../model/usuario.class.php");

		
$Usuario = new Usuario();

$vusu=htmlentities($user);
$clave=htmlentities($clave);
$usu=$vusu;



if($vusu!=""){
	
	$sql=$Usuario->Logueo($usu,$clave);
	
	if(mysqli_num_rows($sql)!=0){
		$rs=mysqli_fetch_array($sql);
		if($rs["Estado"]!="1"){
			echo "-1";
		}else{	
			$_SESSION["login"]=$rs["Usuario"];
			$_SESSION["estado"]=$rs["Estado"];
			$_SESSION["tipo"]="Tipo";
			$_SESSION["cod"]=$rs["Id_Usuario"];


			// Mensaje de Cambio de Contraseña
			if($clave==('123456')){
				$_SESSION["change"]="1";
			}else{
				$_SESSION["change"]="3";
			}
			// ---------------------------------
			
			echo "exito";
		}
	}else{
		echo "error";
	}

}





?>