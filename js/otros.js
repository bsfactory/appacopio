// Otros 
function CajaAceptable(id){
	var valor=document.getElementById(id).value;
	var posicion = valor.indexOf('*');
	if(posicion==-1){return 0;}else{return 1;}
}


function NoEspaciosEnBlanco(id){
	var valor=document.getElementById(id).value;
	if(valor=='' || valor=='0' || valor=='-' || valor=='000000'){return 1;}else{return 0;}
}


function Email(id){
	letras=/(^[0-9a-zA-Z]+(?:[._][0-9a-zA-Z]+)*)@([0-9a-zA-Z]+(?:[._-][0-9a-zA-Z]+)*\.[0-9a-zA-Z]{2,3})$/;
//letras=/^[0-9a-zA-Z][\w.-]+@\w[\w.-]+\.[\w.-]*[0-9a-zA-Z][0-9a-zA-Z]$/i;
	var valor=document.getElementById(id).value;
	if(valor.match(letras)){return 0;}else{return 1;}
}

// -----------------------------------------


// ----------- FUNCIONES ESPECIALES ------------------

function NoEspaciosEnBlanco2(num){
	var valor=document.getElementsByTagName("select")[num].value;
	if(valor=='' || valor=='0' || valor=='-' || valor=='000000'){return 1;}else{return 0;}
}

function NoEspaciosEnBlanco3(num){
	data = document.getElementById('dvContenedor');
	data1 = data.getElementsByTagName("input");
	var valor = data.getElementsByTagName("input")[num-1].value;
	if(valor=='' || valor=='0' || valor=='-' || valor=='000000'){return 1;}else{return 0;}
}

function CajaAceptable3(num){
	data = document.getElementById('dvContenedor');
	data1 = data.getElementsByTagName("input");
	var valor = data.getElementsByTagName("input")[num-1].value;
	var posicion = valor.indexOf('*');
	if(posicion==-1){return 0;}else{return 1;}
}

// ------------------------------------------------------------



function ValidarAccion(form,btn){
	var canterror=0;
		
	if(form==1){
	// FOMULARIO N° 1
		canterror=canterror+NoEspaciosEnBlanco('1Paterno');
	 	canterror=canterror+CajaAceptable('1Paterno');
		canterror=canterror+NoEspaciosEnBlanco('1Materno');
	 	canterror=canterror+CajaAceptable('1Materno');
		canterror=canterror+NoEspaciosEnBlanco('1Nombres');
	 	canterror=canterror+CajaAceptable('1Nombres');
		canterror=canterror+NoEspaciosEnBlanco('1TDocumento');
		canterror=canterror+NoEspaciosEnBlanco('1NumDocumento');
	 	canterror=canterror+CajaAceptable('1NumDocumento');
		canterror=canterror+NoEspaciosEnBlanco('1Sexo');
		canterror=canterror+NoEspaciosEnBlanco('1ECivil');
		canterror=canterror+NoEspaciosEnBlanco('1Email');
	 	canterror=canterror+CajaAceptable('1Email');
		canterror=canterror+NoEspaciosEnBlanco('1Celular');
	 	canterror=canterror+CajaAceptable('1Celular');
		canterror=canterror+NoEspaciosEnBlanco('1FecNac');
	 	canterror=canterror+CajaAceptable('1FecNac');
		canterror=canterror+NoEspaciosEnBlanco('1Pais');
	 	canterror=canterror+CajaAceptable('1Pais');
		canterror=canterror+NoEspaciosEnBlanco('1NDistrito');
		canterror=canterror+NoEspaciosEnBlanco('1DDistrito');
		canterror=canterror+NoEspaciosEnBlanco('1Direccion');
	 	canterror=canterror+CajaAceptable('1Direccion');
		canterror=canterror+NoEspaciosEnBlanco('1Sector');
	 	canterror=canterror+CajaAceptable('1Sector');
		canterror=canterror+NoEspaciosEnBlanco('1Manzana');
	 	canterror=canterror+CajaAceptable('1Manzana');
		canterror=canterror+NoEspaciosEnBlanco('1Lote');
	 	canterror=canterror+CajaAceptable('1Lote');
		
		canterror=canterror+NoEspaciosEnBlanco('1IngAdmPub');
	 	canterror=canterror+CajaAceptable('1IngAdmPub');
		canterror=canterror+NoEspaciosEnBlanco('1IngSector');
	 	canterror=canterror+CajaAceptable('1IngSector');
		
	}else if(form==2){
	// FOMULARIO N° 2
		canterror=canterror+NoEspaciosEnBlanco('2Parentesco');
		canterror=canterror+NoEspaciosEnBlanco('2Paterno');
	 	canterror=canterror+CajaAceptable('2Paterno');
		canterror=canterror+NoEspaciosEnBlanco('2Materno');
	 	canterror=canterror+CajaAceptable('2Materno');
		canterror=canterror+NoEspaciosEnBlanco('2Nombres');
	 	canterror=canterror+CajaAceptable('2Nombres');
		canterror=canterror+NoEspaciosEnBlanco('2TDocumento');
		canterror=canterror+NoEspaciosEnBlanco('2NumDoc');
	 	canterror=canterror+CajaAceptable('2NumDoc');
		canterror=canterror+NoEspaciosEnBlanco('2Sexo');
		canterror=canterror+NoEspaciosEnBlanco('2ECivil');
		canterror=canterror+NoEspaciosEnBlanco('2FNacimiento');
	 	canterror=canterror+CajaAceptable('2FNacimiento');
		
	}else if(form==3){
	// FOMULARIO N° 3
		canterror=canterror+NoEspaciosEnBlanco('3CEstudios');
		canterror=canterror+CajaAceptable('3CEstudios');
		canterror=canterror+NoEspaciosEnBlanco('3Estado');
		canterror=canterror+NoEspaciosEnBlanco('3CiudadPais');
		canterror=canterror+CajaAceptable('3CiudadPais');
		canterror=canterror+NoEspaciosEnBlanco('3Especialidad');
		canterror=canterror+CajaAceptable('3Especialidad');
		canterror=canterror+NoEspaciosEnBlanco('3FecTitulo');
		canterror=canterror+CajaAceptable('3FecTitulo');
		canterror=canterror+NoEspaciosEnBlanco('3NumColegiatura');
		canterror=canterror+CajaAceptable('3NumColegiatura');
		
		n=document.getElementById('percent').innerHTML;
		v=document.getElementById('EFile').style.display;
		if(v=='none'){
			if(n=='0%'){canterror=canterror+1}
		}
		
	}else if(form==4){
	// FOMULARIO N° 4
		canterror=canterror+NoEspaciosEnBlanco('4TParticipacion');
		canterror=canterror+NoEspaciosEnBlanco('4TEvento');
		canterror=canterror+NoEspaciosEnBlanco('4NomInstOrganiza');
		canterror=canterror+CajaAceptable('4NomInstOrganiza');
		canterror=canterror+NoEspaciosEnBlanco('4CursoEvento');
		canterror=canterror+CajaAceptable('4CursoEvento');
		canterror=canterror+NoEspaciosEnBlanco('4FInicio');
		canterror=canterror+CajaAceptable('4FInicio');
		canterror=canterror+NoEspaciosEnBlanco('4FFin');
		canterror=canterror+CajaAceptable('4FFin');
		canterror=canterror+NoEspaciosEnBlanco('4Duracion');
		canterror=canterror+CajaAceptable('4Duracion');
		canterror=canterror+NoEspaciosEnBlanco('4Lugar');
		canterror=canterror+CajaAceptable('4Lugar');
		canterror=canterror+NoEspaciosEnBlanco('4Tipo');
		
		n=document.getElementById('percent').innerHTML;
		v=document.getElementById('EFile').style.display;
		if(v=='none'){
			if(n=='0%'){canterror=canterror+1}
		}
		
	}else if(form==5){
	// FOMULARIO N° 5
		canterror=canterror+NoEspaciosEnBlanco('5Idioma');
		canterror=canterror+NoEspaciosEnBlanco('5CEstudios');
		canterror=canterror+CajaAceptable('5CEstudios');
		canterror=canterror+NoEspaciosEnBlanco('5Lectura');
		canterror=canterror+NoEspaciosEnBlanco('5Escritura');
		canterror=canterror+NoEspaciosEnBlanco('5Conversacion');
		
		n=document.getElementById('percent').innerHTML;
		v=document.getElementById('EFile').style.display;
		if(v=='none'){
			if(n=='0%'){canterror=canterror+1}
		}
		
	}else if(form==6){
	// FOMULARIO N° 6
		canterror=canterror+NoEspaciosEnBlanco('6Entidad');
		canterror=canterror+CajaAceptable('6Entidad');
		canterror=canterror+NoEspaciosEnBlanco('6Area');
		canterror=canterror+CajaAceptable('6Area');
		canterror=canterror+NoEspaciosEnBlanco('6CiudadPais');
		canterror=canterror+CajaAceptable('6CiudadPais');
		canterror=canterror+NoEspaciosEnBlanco('6FInicio');
		canterror=canterror+CajaAceptable('6FInicio');
		canterror=canterror+NoEspaciosEnBlanco('6FFin');
		canterror=canterror+CajaAceptable('6FFin');
		canterror=canterror+NoEspaciosEnBlanco('6Cargo');
		
		n=document.getElementById('percent').innerHTML;
		v=document.getElementById('EFile').style.display;
		if(v=='none'){
			if(n=='0%'){canterror=canterror+1}
		}
		
	}else if(form==7){
	// FOMULARIO N° 7
		canterror=canterror+NoEspaciosEnBlanco('7Nombre');
		canterror=canterror+CajaAceptable('7Nombre');
		canterror=canterror+NoEspaciosEnBlanco('7Fecha');
		canterror=canterror+CajaAceptable('7Fecha');
		canterror=canterror+NoEspaciosEnBlanco('7Publicador');
		
		n=document.getElementById('percent').innerHTML;
		v=document.getElementById('EFile').style.display;
		if(v=='none'){
			if(n=='0%'){canterror=canterror+1}
		}
		
	}else if(form==8){
	// FOMULARIO N° 8
		canterror=canterror+NoEspaciosEnBlanco('8Entidad');
		canterror=canterror+CajaAceptable('8Entidad');
		canterror=canterror+NoEspaciosEnBlanco('8CiudadPais');
		canterror=canterror+CajaAceptable('8CiudadPais');
		canterror=canterror+NoEspaciosEnBlanco('8Nombre');
		canterror=canterror+CajaAceptable('8Nombre');
		canterror=canterror+NoEspaciosEnBlanco('8Fecha');
		canterror=canterror+CajaAceptable('8Fecha');
		canterror=canterror+NoEspaciosEnBlanco('8Tipo');
		
		n=document.getElementById('percent').innerHTML;
		v=document.getElementById('EFile').style.display;
		if(v=='none'){
			if(n=='0%'){canterror=canterror+1}
		}

	}
	
	if(canterror==0){
		document.getElementById('msjvalides').style.display="none";
		if(confirm(String.fromCharCode(191)+"Esta seguro que desea "+btn+"?")){
			if(form==1){AccionDatos();
			}else if(form==2){AccionFamiliares();
			}else if(form==3){AccionEstudios();
			}else if(form==4){AccionCapacitaciones();
			}else if(form==5){AccionIdiomas();
			}else if(form==6){AccionCargosDirectivos();
			}else if(form==7){AccionInvPublicaciones();
			}else if(form==8){AccionPremios();}
		}else{return false;}
	}else{
		document.getElementById('msjvalides').style.display="block";
	}
}



function AccionValidarUsuario(obj){
	var canterror=0;
	
	// FOMULARIO N° 1
	canterror=canterror+NoEspaciosEnBlanco('datos');
	canterror=canterror+CajaAceptable('datos');
	canterror=canterror+NoEspaciosEnBlanco('cargo');
	canterror=canterror+NoEspaciosEnBlanco('tipo');
	canterror=canterror+NoEspaciosEnBlanco('sede');
	canterror=canterror+CajaAceptable('sede');
	canterror=canterror+NoEspaciosEnBlanco('correo');
	canterror=canterror+CajaAceptable('correo');
	
	
	if(canterror==0){
		document.getElementById('msjvalides').style.display="none";
		if(confirm(String.fromCharCode(191)+"Esta seguro que desea Grabar?")){
			//alert("Registrado");
			AcccionUsuario(obj);
		}else{return false;}
	}else{
		document.getElementById('msjvalides').style.display="block";
	}	
}



function ProgramaSociales(obj){
	
	var cad=(obj.className).split(' ');
	//alert(cad[0]);
	//obj.className = cad[0]+" "+"menus_midis";
	
	//alert(obj.getElementsByTagName("div")[0].innerHTML);
	
	for(i=1;i<=5;i++){
		var tp = document.getElementById(i);
		tp.style.background="#FFFFFF";
		tp.getElementsByTagName("div")[0].style.background="#005b48";
		if(obj.id==i){
			obj.style.background="#EEEEEE";
			obj.getElementsByTagName("div")[0].style.background="#333333";
		}
	}
	
	var desc="";
	var url='';
	if(obj.id==1){desc="GESTION DE ACOPIO";url='mod_GAcopio';}
	else if(obj.id==2){desc="CAMBIO DE CLAVE";url='u_clave';}
	else if(obj.id==3){desc="CONSULTAS";url='v_imprimir';}
	else if(obj.id==4){desc="GESTION DE MANTENIMIENTO";url='buscador';}
	else{desc="REPORTES";url='v_reporte';}
	document.getElementById('id_ProgramaSociales').value=obj.id;
	document.getElementById('m_title').innerHTML="SISTEMA DE ACOPIO DE CAFE - "+desc;
	mostrar(url,'0');
	
	
}


function imprimir(){
	//var carpe=document.getElementById('printer_carpeta').value;
	window.open('view/declaracion_jurada.php','','scrollbars=1,width=800,height=600,titlebar=0');
}


function buscador_datos(){
	if(document.getElementById('buscador01').checked){
		document.getElementById('buscar').disabled="";
		document.getElementById('buscar2').disabled="disabled";
	}else{
		document.getElementById('buscar').value="";
		document.getElementById('buscar').disabled="disabled";
		document.getElementById('buscar2').disabled="";
	}
}


function put_validaciones(){
	
	document.getElementById('Comunidad1').onblur=function(event){return validarLetrasConEspaci_o(event)};
	document.getElementById('Comunidad1').onkeypress=function(event){return validarLetrasConEspaci_o(event)};
	
	document.getElementById('CantidadAfectados').onblur = function(event){return soloNumerosEnteros(event)};
	document.getElementById('CantidadAfectados').onkeypress = function(event){return soloNumerosEnteros(event)};
	
	document.getElementById('NumInstrumento').onblur = function(event){return validarLetrasNumeros(event)};
	document.getElementById('NumInstrumento').onkeypress = function(event){return validarLetrasNumeros(event)};
	
	document.getElementById('FecRegistro').onkeypress=function(event){return read(event)};
	document.getElementById('FecOcurrencia').onkeypress=function(event){return read(event)};
	
	document.getElementById('Descripcion').onkeypress=function(event){return caracteres_raros(event)};
	document.getElementById('Descripcion').onkeypress=function(event){return caracteres_raros(event)};
	
	//--
	document.getElementById('Paterno').onblur = function(event){return validarLetrasConEspaci_o(event)};
	document.getElementById('Paterno').onkeypress = function(event){return validarLetrasConEspaci_o(event)};
	
	document.getElementById('Materno').onblur = function(event){return validarLetrasConEspaci_o(event)};
	document.getElementById('Materno').onkeypress = function(event){return validarLetrasConEspaci_o(event)};
	
	document.getElementById('Nombres').onblur = function(event){return validarLetrasConEspaci_o(event)};
	document.getElementById('Nombres').onkeypress = function(event){return validarLetrasConEspaci_o(event)};
	
	document.getElementById('Dni').onblur = function(event){return soloNumerosEnteros(event)};
	document.getElementById('Dni').onkeypress = function(event){return soloNumerosEnteros(event)};

	document.getElementById('FecNacimiento').onkeypress=function(event){return read(event)};
	document.getElementById('FecAfiliacion').onkeypress=function(event){return read(event)};
	
	document.getElementById('Telefono').onblur = function(event){return soloNumerosEnteros(event)};
	document.getElementById('Telefono').onkeypress = function(event){return soloNumerosEnteros(event)};
	
	document.getElementById('Email').onblur = function(event){return soloEmail(event)};
	document.getElementById('Email').onkeypress = function(event){return soloEmail(event)};
	
	document.getElementById('TiempoResidencia').onblur = function(event){return soloNumerosEnteros(event)};
	document.getElementById('TiempoResidencia').onkeypress = function(event){return soloNumerosEnteros(event)};
	
	document.getElementById('NomInstitucion').onblur = function(event){return caracteres_raros(event)};
	document.getElementById('NomInstitucion').onkeypress = function(event){return caracteres_raros(event)};
	
	document.getElementById('CargoInstitucion').onblur = function(event){return validarLetrasConEspaci_o(event)};
	document.getElementById('CargoInstitucion').onkeypress = function(event){return validarLetrasConEspaci_o(event)};
	
	document.getElementById('Comunidad2').onblur = function(event){return validarLetrasConEspaci_o(event)};
	document.getElementById('Comunidad2').onkeypress = function(event){return validarLetrasConEspaci_o(event)};
	
	document.getElementById('Institucion').onblur = function(event){return caracteres_raros(event)};
	document.getElementById('Institucion').onkeypress = function(event){return caracteres_raros(event)};
	
	document.getElementById('ApellidosNombres').onblur = function(event){return validarLetrasConEspaci_o(event)};
	document.getElementById('ApellidosNombres').onkeypress = function(event){return validarLetrasConEspaci_o(event)};
	
	document.getElementById('Dni2').onblur = function(event){return soloNumerosEnteros(event)};
	document.getElementById('Dni2').onkeypress = function(event){return soloNumerosEnteros(event)};
	

	//--
	document.getElementById('ApellidosNombres2').onblur = function(event){return validarLetrasConEspaci_o(event)};
	document.getElementById('ApellidosNombres2').onkeypress = function(event){return validarLetrasConEspaci_o(event)};
	
	document.getElementById('Cargo2').onblur = function(event){return validarLetrasConEspaci_o(event)};
	document.getElementById('Cargo2').onkeypress = function(event){return validarLetrasConEspaci_o(event)};
	
	document.getElementById('Institucion2').onblur = function(event){return caracteres_raros(event)};
	document.getElementById('Institucion2').onkeypress = function(event){return caracteres_raros(event)};
	
	
	//--
	document.getElementById('NumDocAlerta').onblur = function(event){return validarLetrasNumeros(event)};
	document.getElementById('NumDocAlerta').onkeypress = function(event){return validarLetrasNumeros(event)};
	
	document.getElementById('FecVirtual').onblur = function(event){return read(event)};
	document.getElementById('FecFisico').onkeypress = function(event){return read(event)};	
	document.getElementById('FecCaso').onblur = function(event){return read(event)};

	document.getElementById('DetalleCaso').onblur = function(event){return caracteres_raros(event)};
	document.getElementById('DetalleCaso').onkeypress = function(event){return caracteres_raros(event)};
	
	document.getElementById('Observaciones').onblur = function(event){return caracteres_raros(event)};
	document.getElementById('Observaciones').onkeypress = function(event){return caracteres_raros(event)};
	
	
/*	data = document.getElementById('dvContenedor');
	data1 = data.getElementsByTagName("input");
	for(i=1;i<(data1.length);i++){
		if(i%4!=0){
			data.getElementsByTagName("input")[i-1].onblur = function(event){return validarLetrasConEspaci_o(event)};
			data.getElementsByTagName("input")[i-1].onkeypress = function(event){return validarLetrasConEspaci_o(event)};
		}
	}*/
	
	function read(e){
		tecla = (document.all) ? e.keyCode : e.which; 	
		if (tecla==8 || tecla==0) return true;
		patron = / /;
		te = String.fromCharCode(tecla);
		return patron.test(te);
	}
}