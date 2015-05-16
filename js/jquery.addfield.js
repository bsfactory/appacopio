
function addField(){
	
// ID del elemento div quitandole la palabra "div_" de delante. Pasi asi poder aumentar el número. Esta parte no es necesaria pero yo la utilizaba ya que cada campo de mi formulario tenia un autosuggest , así que dejo como seria por si a alguien le hace falta.

var clickID = parseInt(jQuery(this).parent('div').attr('id').replace('div_',''));

// Genero el nuevo numero id
var newID = (clickID+1);

// Creo un clon del elemento div que contiene los campos de texto
$newClone = jQuery('#div_'+clickID).clone(true);

//Le asigno el nuevo numero id
$newClone.attr("id",'div_'+newID);

//Asigno nuevo id al primer campo input dentro del div y le borro cualquier valor que tenga asi no copia lo ultimo que hayas escrito.(igual que antes no es necesario tener un id)
$newClone.children("#Alerta option::selected").remove();
$newClone.children("#Alerta").attr("name","Alerta"+ newID +"");


//Borro el valor del segundo campo input(este caso es el campo de cantidad)


//Asigno nuevo id al boton
$newClone.children("input").eq(0).attr("id",newID)

//Inserto el div clonado y modificado despues del div original
$newClone.insertAfter(jQuery('#div_'+clickID));

//Cambio el signo "+" por el signo "-" y le quito el evento addfield
jQuery("#"+clickID).val('-').unbind("click",addField);


//Ahora le asigno el evento delRow para que borre la fial en caso de hacer click
jQuery("#"+clickID).bind("click",delRow);					
					   
}




function addField2(){
// ID del elemento div quitandole la palabra "div_" de delante. Pasi asi poder aumentar el número. Esta parte no es necesaria pero yo la utilizaba ya que cada campo de mi formulario tenia un autosuggest , así que dejo como seria por si a alguien le hace falta.

var clickID = parseInt(jQuery(this).parent('div').attr('id').replace('div2_',''));

// Genero el nuevo numero id
var newID = (clickID+1);

// Creo un clon del elemento div que contiene los campos de texto
$newClone = jQuery('#div2_'+clickID).clone(true);

//Le asigno el nuevo numero id
$newClone.attr("id",'div2_'+newID);

//Asigno nuevo id al primer campo input dentro del div y le borro cualquier valor que tenga asi no copia lo ultimo que hayas escrito.(igual que antes no es necesario tener un id)
$newClone.children("input").eq(0).attr("id",'Ap'+newID).val('');

//Borro el valor del segundo campo input(este caso es el campo de cantidad)
$newClone.children("input").eq(1).val('');

$newClone.children("input").eq(2).val('');

//Asigno nuevo id al boton
$newClone.children("input").eq(3).attr("id",newID)

//Inserto el div clonado y modificado despues del div original
$newClone.insertAfter(jQuery('#div2_'+clickID));

//Cambio el signo "+" por el signo "-" y le quito el evento addfield
jQuery("#"+clickID).val('-').unbind("click",addField2);

//Ahora le asigno el evento delRow para que borre la fial en caso de hacer click
jQuery("#"+clickID).bind("click",delRow);					
					   
}






function delRow() {
// Funcion que destruye el elemento actual una vez echo el click
jQuery(this).parent('div').remove();

}