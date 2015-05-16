<?php 
class Productor{
 
	function Productor(){
	}


	function ListadoGeneral(){
		$link=conectarse();
		if($link==true){
			$query = "CALL sp_LProductor";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return $result;
		}
		Desconectarse();
	} 
 
 
	function ListadoPorCodigo($c){
		$link=conectarse();
		if($link==true){
			$query = "CALL sp_LProductorPorCodigo($c)";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return $result;
		}
		Desconectarse();
	}


	function Grabar($d1,$d2,$d3,$d4,$d5,$d6,$d7,$d8,$d9,$d10){
		$link=conectarse();
		if($link==true){
			$query = "CALL sp_GrabarProductor('$d1','$d2','$d3','$d4','$d5','$d6','$d7','$d8','$d9','$d10')";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return true;
		}
		Desconectarse();
	}


	function Editar($d1,$d2,$d3,$d4,$d5,$d6,$d7,$d8,$d9,$d10,$d11){
		$link=conectarse();
		if($link==true){
			$query = "CALL sp_EditarProductor('$d1','$d2','$d3','$d4','$d5','$d6','$d7','$d8','$d9','$d10','$d11')";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return true;
		}
		Desconectarse();
	}


	function Elminar($cod){
		$link=conectarse();
		if($link==true) {
			$query="CALL sp_EliminarUsuario($cod)";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return true;	 
		}
	}
	
	

}
?>