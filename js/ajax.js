


/* ------------------------------------------------------------------------------------- */
function oAjax()
	{		
	var xmlhttp=false;
		try 
		{ xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");} 
		catch (e){
		
		try { xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");} 
		catch (E) { xmlhttp = false;}
		}
		if (!xmlhttp && typeof XMLHttpRequest!='undefined'){ xmlhttp = new XMLHttpRequest();}
	return xmlhttp;
	}
/* ------------------------------------------------------------------------------------- */

function objetoAjax(){
	try {
		xmlhttp = new XMLHttpRequest();
	} catch (e) {
		try {
			xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");

		} catch (E) {
			try{
		   xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}catch (e){
			xmlhttp =false;
			}
  		}
	}

	return xmlhttp;
}

ajax=objetoAjax();



function AccionProductor(obj){
	var datos="";
	var accion = obj.value;
	var tabla = "Productor";
	
	var d1 = document.getElementById('paterno').value.toUpperCase();
	var d2 = document.getElementById('materno').value.toUpperCase();
	var d3 = document.getElementById('nombres').value.toUpperCase();
	var d4 = document.getElementById('t_documento').value.toUpperCase();
	var d5 = document.getElementById('n_documento').value.toUpperCase();
	var d6 = document.getElementById('zona').value.toUpperCase();
	var d7 = document.getElementById('condicion').value.toUpperCase();
	var d8 = document.getElementById('status').value.toUpperCase();
	var d9 = document.getElementById('area').value.toUpperCase();
	var d10 = document.getElementById('p_estimada').value.toUpperCase();	
	var d11 = document.getElementById('id_productor').value.toUpperCase();
	
	datos=d1+"*"+d2+"*"+d3+"*"+d4+"*"+d5+"*"+d6+"*"+d7+"*"+d8+"*"+d9+"*"+d10+"*"+d11;
	ajax.open("POST", "controller/cls_general.php",true);
	ajax.onreadystatechange=resultado;
	
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("datos="+datos+"&accion="+accion+"&tabla="+tabla);
}


function mostrar3(url,num,m,cod,d){
	ajax.open("GET", "view/form/"+url+".php?m="+m+"&cod="+cod+"&del="+d+"&pp="+new Date().getTime(),false);
	ajax.onreadystatechange=function() {
		var divResultado = document.getElementById('bgNew'+num);
			if (ajax.readyState==4 && ajax.status==200){
				divResultado.innerHTML = ajax.responseText;
				Calendar.setup({
					inputField     :    "2FNacimiento",
					ifFormat       :    "%Y-%m-%d",  //"%d/%m/%Y"
					button         :    "2FNacimiento"
				});

				closeview();
			}
		}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send();
}


function mostrar(url,cod){
	ajax.open("POST", "view/"+url+".php",true);
	ajax.onreadystatechange=function() {
		var divResultado = document.getElementById('divdata');
			if (ajax.readyState==4 && ajax.status==200){			
				divResultado.innerHTML = ajax.responseText;
				
				//if(estado==0 || estado==2 || estado==3){
					//put_validaciones();
											
					Calendar.setup({
					inputField     :    "1FecNac",
					ifFormat       :    "%Y-%m-%d",  //"%d/%m/%Y"
					button         :    "1FecNac"
					});
		
					//window.onAfterLoad = off_paste();
					var options = {
					beforeSend: function(){
						jQuery("#progress").show();
						//clear everything
						jQuery("#bar").width('0%');
						jQuery("#message").html("");
						jQuery("#percent").html("0%");
					},
					uploadProgress: function(event, position, total, percentComplete){
						jQuery("#bar").width(percentComplete+'%');
						jQuery("#percent").html(percentComplete+'%');
					},
					success: function(){
						jQuery("#bar").width('100%');
						jQuery("#percent").html('100%');
					},
					complete: function(response){
						jQuery("#message").html(response.responseText);
						document.getElementById('trSFile').setAttribute("style", "display: none;");
					},
					error: function(){
						jQuery("#message").html("<font color='red'> ERROR: No se subio el archivo.</font>");
					}
				};
     			jQuery("#formu").ajaxForm(options);

				
			}
		}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("cod="+cod);
}



function MostrarAlertas(obj,url){
	var cod = obj.id;
	ajax.open("POST", "view/"+url+".php",true);
	ajax.onreadystatechange=function() {
		var divResultado = document.getElementById('divdata');
			if (ajax.readyState==4 && ajax.status==200){			
				divResultado.innerHTML = ajax.responseText;
				
			}
		}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("cod="+cod);
}



function CambiarUsuario(obj,acci){
	var cod=obj.className;
	var acc=acci;
	ajax.open("POST", "controller/cls_usuario.php",true);
	ajax.onreadystatechange=function(){
		if (ajax.readyState==4 && ajax.status==200){			
			if(ajax.responseText=="1"){
				obj.src="img/msj/Knob Green.png";
				obj.title="Habilitado";
			}else if(ajax.responseText=="0"){
				obj.src="img/msj/Knob Red.png";
				obj.title="Deshabilitado";
			}else if(ajax.responseText=="4"){
				alert("Se Restableció su Clave: pass@MIDIS")
			}else if(ajax.responseText=="5"){
				mostrar(this,'v_usuario','1');
			}
			
		}
	}

	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("cod="+cod+"&accion="+acc);
}



function AccionClave(){
	var pass1 = document.getElementById('pass_new').value;
	var pass2 = document.getElementById('pass_new2').value;
	var cod = document.getElementById('cod').value;
	var pass_old = document.getElementById('pass_old').value;
	var password = document.getElementById('password').value;
	if(MD5(pass_old)==password){
		if(pass1!=''){
			if(pass1==pass2){
				var passold = document.getElementById('pass_old').value;
				var accion = "UpdatePass";
						
				ajax.open("POST", "controller/cls_usuario.php",true);
				ajax.onreadystatechange=function(){
					if (ajax.readyState==4 && ajax.status==200){
						var str=ajax.responseText;
						vclass=ajax.responseText.substring(str.length-1,str.length);
						if(vclass=="2"){		
							nclass="success";
							document.getElementById('boton').style.display="none";
							document.getElementById('formu').style.display="none";			
						}else if(vclass=="1"){
							nclass="error";
						}
						
						document.getElementById('info').setAttribute('class',nclass);
						document.getElementById('info').innerHTML=ajax.responseText.substring(0,str.length-1);
					}
				}
				ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				ajax.send("pass="+pass1+"&cod="+cod+"&accion="+accion);
			}else{
				alert('Error en Repetir Contraseña.');
			}
		}else{
			alert('Error en Nueva Contraseña.');
		}
	}else{
		alert('Contraseña Anterior Inválida.');
	}
}



function Mostrar2(obj){
	var cod=obj;
	ajax.open("POST", "view/n_usuario.php",true);
	ajax.onreadystatechange=function(){
		if (ajax.readyState==4 && ajax.status==200){
			var divResultado = document.getElementById('divdata');			
			divResultado.innerHTML = ajax.responseText;
			if(obj!=0){
				document.getElementById('btnregistrar').value="Editar";
			}
		}
	}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("cod="+cod);
}


function AccionUsuario(obj){
	var accion=obj.value;
	var datos="";
	
	var d0 = document.getElementById('idusuario').value.toUpperCase();
	var d1 = document.getElementById('usuario').value.toUpperCase();
	var d2 = document.getElementById('tipo').value.toUpperCase();
	datos=d0+"*"+d1+"*"+d2;
	
	ajax.open("POST", "controller/cls_usuario.php",true);
	ajax.onreadystatechange=function(){
		if (ajax.readyState==4 && ajax.status==200){
			var str=ajax.responseText;
			vclass=ajax.responseText.substring(str.length-1,str.length);
			if(vclass=="2"){		
				nclass="success";
				document.getElementById('boton').style.display="none";
				document.getElementById('formu').style.display="none";			
			}else if(vclass=="1"){
				nclass="error";
			}
			
			document.getElementById('info').setAttribute('class',nclass);
			document.getElementById('info').innerHTML=ajax.responseText.substring(0,str.length-1);
		}
	}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("datos="+datos+"&accion="+accion);
}



function resultado() {
	if (ajax.readyState==4 && ajax.status==200){
		var str=ajax.responseText;
		vclass=ajax.responseText.substring(str.length-1,str.length);
		if(vclass=="2"){		
			nclass="success";
			document.getElementById('Form_Boton').style.display="none";
			document.getElementById('Form_').style.display="none";
		}else if(vclass=="1"){
			nclass="error";
		}
		document.getElementById('info').setAttribute('class',nclass);
		document.getElementById('info').innerHTML=ajax.responseText.substring(0,str.length-1);
		/**
		if(vclass!="3"){
			$('#info').fadeIn(2000);
			$('#info').fadeOut(6000);	
			$('.mensaje').fadeIn(7000);	
		}**/
		
	}	
		
}


// ---------------- PARA UBIGEOS DE 3 CAMPOS ----------------


function fprovincia1(obj){
	var depa = obj.value;
	var categ= "provincia";
	ajax.open("POST", "view/providistri.php",true);
	ajax.onreadystatechange=function() {
		var divResultado = document.getElementById('divprovincia1');
			if (ajax.readyState==4 && ajax.status==200){			
				divResultado.innerHTML = ajax.responseText;
			}
		}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("depa="+depa+"&categ="+categ);
}


function fdistrito1(){
	var depa = document.getElementById('1NDepartamento').value;
	var prov = document.getElementById('1NProvincia').value;
	var categ= "distrito";
	ajax.open("POST", "view/providistri.php",true);
	ajax.onreadystatechange=function() {
		var divResultado = document.getElementById('divdistrito1');
			if (ajax.readyState==4 && ajax.status==200){			
				divResultado.innerHTML = ajax.responseText;
			}
		}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("depa="+depa+"&prov="+prov+"&categ="+categ);
}



function fprovincia2(obj){
	var depa = obj.value;
	var categ= "provincia";
	ajax.open("POST", "view/providistri2.php",true);
	ajax.onreadystatechange=function() {
		var divResultado = document.getElementById('divprovincia2');
			if (ajax.readyState==4 && ajax.status==200){			
				divResultado.innerHTML = ajax.responseText;
			}
		}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("depa="+depa+"&categ="+categ);
}


function fdistrito2(){
	var depa = document.getElementById('1DDepartamento').value;
	var prov = document.getElementById('1DProvincia').value;
	var categ= "distrito";
	ajax.open("POST", "view/providistri2.php",true);
	ajax.onreadystatechange=function() {
		var divResultado = document.getElementById('divdistrito2');
			if (ajax.readyState==4 && ajax.status==200){			
				divResultado.innerHTML = ajax.responseText;
			}
		}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("depa="+depa+"&prov="+prov+"&categ="+categ);
}


// ---------------- -------------------- ----------------




function off_paste(){/**
	//document.all.onPaste=function(){return false};
	//document.getElementsByTagName('input').onPaste=function(){return false};

	//document.getElementById('materno').onpaste = function() { return false};
	var f=document.getElementById('formu');

	for(var a=0; a<=f.elements.length; a++){
		//alert(f.elements[a].type);
		if(f.elements[a].type=="text"){
			      document.getElementById(f.elements[a].id).onpaste = function() { return false};
			      document.getElementById(f.elements[a].id).oncopy = function() { return false};
			      document.getElementById(f.elements[a].id).ondrag = function() { return false};
			      document.getElementById(f.elements[a].id).ondrop = function() { return false};
			}		
		}**/
}