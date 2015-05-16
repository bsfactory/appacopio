<?php
ob_start();
session_start();
extract ($_REQUEST, EXTR_OVERWRITE);
require_once("../model/ConexionBD.php");
require_once("general.class.php");

$link=conectarse();
$general = new general();

$output_dir = "../documentos/";


if(isset($_FILES["myfile"])){
	
	//Filter the file types , if you want.
	if($_FILES["myfile"]["error"] > 0){
	  echo "Error: " . $_FILES["file"]["error"] . "<br>";
	}else{
		if($_FILES["myfile"]["type"] == "application/pdf"){
		
			
			
			$binario_nombre_temporal=$_FILES["myfile"]["tmp_name"];
			
			if($_POST['CodArchivo']==''){
				$rs=odbc_fetch_array($general->GrabarArchivos($_POST['NumTab'],$_SESSION["docente"],$_FILES["myfile"]["type"],$_FILES["myfile"]["size"]));
				$id=$rs['id'];
			}else{
				$rs=$general->EditarArchivos($_FILES["myfile"]["size"],$_POST['CodArchivo']);
				$id=$_POST['CodArchivo'];
			}
			//move the uploaded file to documentos folder;
			move_uploaded_file($_FILES["myfile"]["tmp_name"],$output_dir.$_POST['NumTab'].'Doc'.$id.'_'.$_SESSION["docente"].'.pdf');
			
			
			echo "<font color='green'>Se subio correctamente el archivo :".$_FILES["myfile"]["name"].".</font>
				  <input id='File' name='File' type='hidden' value='".$id."' />";
		}else{
			echo "<font color='red'>Tipo de archivo no permitido. Solo se permiten PDF.</font>
				  <input id='File' name='File' type='hidden' value='0' />";
		}
	}

}
?>