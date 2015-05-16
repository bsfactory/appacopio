/*
	CODIGO ASCII
	============
	
	ALT + 32 == ESPACIO
	ALT + 45 == -
	ALT + 58 == :
	ALT + 8	 == BACKSPACE
	ALT + 0	 == TAB
	ALT + 47 == /
	ALT + 37 == %	 
	ALT + 40 == (
	ALT + 41 == )
	ALT + 39 == '
	ALT  35 == #
	ALT + 44 == ,
	ALT + 42 == *
	ALT + 46 == .
	ALT + 64 == @
	
	|| tecla==11
	
*/

function validarLetrasNumeros(e) { // 1
	tecla = (document.all) ? e.keyCode : e.which; // 2
	if (tecla==0) return true;
	if (tecla==45) return true; 
	if (tecla==8) return true; 
	if (tecla==32) return false; 
	patron =/^([A-Za-zñÑ0-9]+)$/; // 4
	te = String.fromCharCode(tecla); // 5
	return patron.test(te); // 6
} 

function validarLetrasConEspaci_o(e) { // 1
	tecla = (document.all) ? e.keyCode : e.which; // 2
	if (tecla==8) return true; 
	if (tecla==0) return true; 
	patron =/[A-Za-zñÑ\s]/; // 4
	te = String.fromCharCode(tecla); // 5
	return patron.test(te); // 6
} 


function soloNumerosEnteros(e) { 
	tecla = (document.all) ? e.keyCode : e.which; 	
	if (tecla==8 || tecla==0) return true;
	patron = /\d/;
	te = String.fromCharCode(tecla);
	return patron.test(te);
}

function soloNumerosEnteros_punto(e) { 
	tecla = (document.all) ? e.keyCode : e.which; 	
	if (tecla==8 || tecla==0 || tecla==46) return true;
	patron = /\d/;
	te = String.fromCharCode(tecla);
	return patron.test(te);
}

function soloEmail(e) { 
	tecla = (document.all) ? e.keyCode : e.which; 	
	if (tecla==0) return true; 
	if (tecla==8) return true;
	if (tecla==32) return false;
	if (tecla==64) return true;
	patron = /[A-Za-z_.0-9\s]/;
	te = String.fromCharCode(tecla);
	return patron.test(te);
}


function soloTelefono(e) { // 1
	tecla = (document.all) ? e.keyCode : e.which; // 2
	if (tecla==0) return true; 
	if (tecla==8) return true; 
	if (tecla==32) return false; 
	patron =/^([0-9*-]+)$/; // 4
	te = String.fromCharCode(tecla); // 5
	return patron.test(te); // 6
}


function caracteres_raros(e) { // 1
	tecla = (document.all) ? e.keyCode : e.which; // 2
	if (tecla==0) return true; 
	if (tecla==8) return true; 
	if (tecla==32) return true; 
	if (tecla==35) return true; 
	if (tecla==58) return true; 
	if (tecla==46) return true;
	if (tecla==45) return true;	
	if (tecla==39) return false; 
	patron =/^([A-Za-z0-9Ññ]+)$/; // 4
	te = String.fromCharCode(tecla); // 5
	return patron.test(te); // 6
} 





//--------------- BLOQUEO DE COPY, PASTE, CUT ----------------------------------
//window.onAfterLoad = blockeo_all();

function blockeo_all(){
	form=document.getElementById('form');
	alert(f.elements.length);
	
	//document.all.onPaste=function(){return false};
	//document.getElementsByTagName('input').onPaste=function(){return false};

	//document.getElementById('materno').onpaste = function() { return false};
	var inputs=[];
	for(a=0; a<=form.elements.length; a++)
		{	if(form.elements[a].type=='text')
			{	
			      document.getElementById(form.elements[a].id).onpaste = function() { return false};
			      document.getElementById(form.elements[a].id).oncopy = function() { return false};
			      document.getElementById(form.elements[a].id).ondrag = function() { return false};
			      document.getElementById(form.elements[a].id).ondrop = function() { return false};
			}		
		}
}

//--------------- ---------------------------- ----------------------------------