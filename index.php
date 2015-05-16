<?php

session_start();
if(isset($_SESSION["login"])){header("Location:inicio.php");}
?>

<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<link type="text/css" rel="stylesheet" media="all" href="./css/template_1.css">
    <!--[if IE]>
    <link type="text/css" rel="stylesheet" media="all" href="/sites/www.sntalent.com/themes/snt/css/ie.css?Z" />
    <![endif]-->
    <!--[if lte IE 6]>
    <link type="text/css" rel="stylesheet" media="all" href="/sites/www.sntalent.com/themes/snt/css/ie6.css?Z" />
    <![endif]-->
	<title>Bienvenido | Sistema SAC</title> 
    <link type="text/css" rel="stylesheet" href="css/6gtrra65.css" />
    <link type="text/css" rel="stylesheet"  href="css/c7h3cyeq.css" />
    <link type="text/css" rel="stylesheet"  href="css/ezutzhxz.css" /> 
    <link type="text/css" rel="stylesheet" href="css/71wtlsja.css" />
    <link type="text/css" rel="stylesheet" href="css/style.css"> 
    <link rel="shortcut icon" href="img/favicon.ico" />
	<link type="text/css" rel="stylesheet" href="css/login.css">
    
    
    <script type="text/javascript" src="js/ajax.js"></script> 
    <script type="text/javascript" src="js/valdaciones_form.js" ></script>
    <script type="text/javascript" src="js/otros.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    
    <script type="text/javascript">
    jQuery.noConflict();
	function Condiciones(){
		open('view/condiciones.html','Condiciones','width=580,height=620,resizable=no , location=no ,status=no');
	}
    </script>
	<script type="text/javascript" src="js/login.js"></script>

</head>
	
<body class="public to-be-determined lightbox-processed tableHeader-processed">

        <div id="header">
      <div class="header-wrapper">
        <a href="#" id="sntalent_logo" title="TLogo"><img src="./img/biocafe_logo.jpg" width="70" height="90" title="UNMSM" alt="UNMSM"></a>
              
        
        <!--<div id="login_box">
            <a href="#" id="register" class="btn_tbox">Soy Empresa</a>
            <a href="#" id="login" class="btn_tbox">Iniciar sesión</a>
        </div>-->             
        
        
        
                
       </div>
  </div>

<div class="main">
    
    <div id="wrapper_log">
        
        <div id="navigation">  </div>
        <div id="leftcolumn"> </div>
        <div id="content">
            <div id="bienvenida">
                <p style="text-align:center"><span id="txtBienvenida">Bienvenido al Sistema de Acopio de Cafe.<br>
			Por favor proporcione su usuario y contraseña para acceder al sistema.<br>
		</span>
          </p></div>
            <form id="frmLogin" name="frmLogin" method="post">

            <fieldset id="inputs">
                <input id="username" type="text" name="username" placeholder="usuario">   
                <span id="errorUsername"></span>
                <input id="password" type="password" name="password" placeholder="contraseña">
                <span id="errorPassword"></span>
                  <img src="img/ajax-loader2.gif" id="load" alt="Cargando" class="hide">
            </fieldset>
            <fieldset id="actions">
                <input type="button" id="submit" value="Ingresar">
                  <span style="cursor:hand"><a onclick="Condiciones()"><font color="#000000"><b>
                  Condiciones de uso</b></font></a></span>
            </fieldset>
           </form>             
    </div><!--content-->
    <div id="rightcolumn">     </div>
        <div id="ifooter">
            <div class="infoBase">
                    <p style="text-align:center"><span id="leyenda">"Este programa es público ajeno a cualquier partido político. Queda prohibido el uso para fines distintos a los establecidos en el programa"</span></p>
            </div>
           
           
       </div><!--footer-->
     </div><!--wrapper-->
       
</div>
  
 <div class="lower-main">
      
    
  </div>


</body>

</html>