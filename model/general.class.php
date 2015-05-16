<?php 
class General{
 
	function General(){
	}



	function ListadoTipoDoc(){
		$link=conectarse();
		if($link==true){
			$query = "CALL sp_LTipoDoc";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return $result;
		}
		Desconectarse();
	}


	function ListadoZona(){
		$link=conectarse();
		if($link==true){
			$query = "CALL sp_LZona";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return $result;
		}
		Desconectarse();
	}


	function ListadoTipoProducto(){
		$link=conectarse();
		if($link==true){
			$query = "CALL sp_LTipoProducto";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return $result;
		}
		Desconectarse();
	}


}
?>