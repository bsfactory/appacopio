<?php

function Conectarse(){ 
	if (!($link=mysqli_connect("localhost","root","root","db_acopio"))){
      echo "Error conectando a la base de datos."; 
      exit(); 
	} 
	return $link; 
}

function Desconectarse(){ 
	mysqli_close($link);
}
?>