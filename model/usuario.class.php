<?php 
class Usuario{
 
	function Usuario(){
	}	


	function Logueo($u,$c){
		$link=conectarse();
		if($link==true){
			$query = "SELECT * FROM Tb_Usuario WHERE Usuario='$u' AND Clave='$c' AND Estado=1";
			$result = mysqli_query($link,$query);
		if (!$result)
			return false;
		else
			return $result;
	}
		Desconectarse();
	}


	function ListadoGeneral(){
		$link=conectarse();
		if($link==true){
			$query	= "SELECT * FROM Tb_Usuario u,Tb_TipoUsuario t WHERE u.Id_TipoUsuario=t.Id_TipoUsuario";
			$result = mysqli_query($link,$query);
		if (!$result)
			return false;
		else
			return $result;
		}
		Desconectarse();
	} 


	function ListadoPorCodigo($cod){
		$link=conectarse();
		if($link==true){
			$query	= "SELECT id_Usuario,Usuario,Clave,Estado,id_TipoUsuario FROM Tb_Usuario WHERE Id_Usuario=$cod";
			$result = mysqli_query($link,$query);
			if (!$result)
				return false;
			else
				return $result;
		}
		Desconectarse();
	}


	function Grabar($d1,$d2){
		$link=conectarse();
		if($link==true) {
			$query="CALL sp_GrabarUsuario('$d1',$d2)";
			$result = mysqli_query($link,$query);
			if (!$result){
				return false;
			}else{
				return true;
			}
		}
	} 


	function Editar($d1,$d2,$cod){
		$link=conectarse();
		if($link==true) {
			$query="CALL sp_EditarUsuario('$d1',$d2,$cod)";
			$result = mysqli_query($link,$query);
			if (!$result){
				return false;
			}else{
				return true;
			}
		}
	}


	function EditarClave($pass,$cod){
		$link=conectarse();
		if($link==true) {
			$query="CALL sp_EditarClave('$pass',$cod)";
			$result = mysqli_query($link,$query);
			if (!$result){
				return false;
			}else{
				return true;
			}
		}
	}  


	function Eliminar($cod){
		$link=conectarse();
		if($link==true) {
			$query="CALL sp_EliminarUsuario($cod)";
			$result = mysqli_query($link,$query);
			if (!$result){
				return false;
			}else{
				return true;
			}
		}
	}


}
?>