<?php 
class Producto{
 
	function Producto(){
	}


	function ListadoGeneral(){
		$link=conectarse();
		if($link==true){
			$query = "CALL sp_LProducto";
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
			$query = "CALL sp_LProductoPorCodigo($c)";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return $result;
		}
		Desconectarse();
	}


	function Grabar($d1,$d2,$d3){
		$link=conectarse();
		if($link==true){
			$query = "CALL sp_GrabarProducto('$d1','$d2','$d3')";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return true;
		}
		Desconectarse();
	}


	function Editar($d1,$d2,$d3,$d4){
		$link=conectarse();
		if($link==true){
			$query = "CALL sp_EditarProducto('$d1','$d2','$d3','$d4')";
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