/*verifica que los datos del login hayan sido capturados para procesarlos en la pagina php 
 */
jQuery(document).ready(function(){ 
jQuery("#submit").click(function() {
     var username = jQuery("#username").val();
     var password = jQuery("#password").val();
     var dataString = 'user='+ username +'&clave='+ password;
     if(username =='' )
         {
          jQuery("#errorUsername").html("");
          jQuery("#errorPassword").html("") ;
          jQuery("#username").val('');
          jQuery("#password").val('');
          jQuery("#errorUsername").html("INGRESE UN USUARIO POR FAVOR");
        }
     else if(password =='')   
        {
         jQuery("#username").val('');
         jQuery("#password").val('');
         jQuery("#errorUsername").html("");
         jQuery("#errorPassword").html("") ;
         jQuery("#errorPassword").html("INGRESE UNA CONTRASE&Ntilde;A POR FAVOR");
     }
     else{
       jQuery('#load').show();  
       jQuery("#errorUsername").html("");
       jQuery("#errorPassword").html("") ;
       jQuery("#username").val('');
       jQuery("#password").val('');
        jQuery.ajax({
          type: "POST",
          url: "controller/cls_autentificar.php",
          data: dataString, 
          cache: false,
         success: function(response){
         if(response =='exito')
         {
            //jQuery(location).attr('href','./cuerposacademicos1.php');
			jQuery(location).attr('href','inicio.php');
			//location = "inicio.php";
			
         }
         else{
         jQuery("#errorPassword").html("Su usuario o contrase&ntilde;a son incorrectos, intente de nuevo");
         jQuery('#load').hide();    
      }
     }
 });    
}   
 return false;
});    
});/*end document*/