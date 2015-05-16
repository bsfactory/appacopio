<?php

session_start();
//if(!isset($_SESSION["login"])){header("Location:index.php");}

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
    <link type="text/css" rel="stylesheet" href="css/menu.css" />
    <link type="text/css" rel="stylesheet" href="css/style.css"> 
    <link rel="shortcut icon" href="img/favicon.ico" />
    <!-------------------------------- TAB'S -------------------------------->
    <link type="text/css" href="css/tabs/ui.all.css" rel="stylesheet" />
    <!-------------------------------- ----- -------------------------------->
	<link rel="stylesheet" href="css/jquery.fancybox.css?v=2.1.3" type="text/css" media="screen" />
    
    <script type="text/javascript" src="js/webtoolkit.md5.js"></script>
    <script type="text/javascript" src="js/ajax.js"></script> 
    <script type="text/javascript" src="js/valdaciones_form.js" ></script>
    <script type="text/javascript" src="js/otros.js"></script>
    <script type="text/javascript" src="js/jquery.min2.js"></script>
    
    <script type="text/javascript" src="js/jquery.form.js"></script>

    <script type="text/javascript" src="js/jquery.fancybox.pack.js?v=2.1.3"></script>
    
    <script type="text/javascript">
    jQuery.noConflict();
    </script>
    
    <!----------------------------- CALENDARIO ----------------------------->
    <link rel="stylesheet" type="text/css" media="all" href="js/date/calendar-blue.css" title="win2k-cold-1" />
    <script type="text/javascript" src="js/date/calendar.js"></script>
    <script type="text/javascript" src="js/date/calendar-es.js"></script>
    <script type="text/javascript" src="js/date/calendar-setup.js"></script>
    <!----------------------------------------------------------------------->
    
    <script type="text/javascript" src="js/tabs/ui/ui.core.js"></script>
	<script type="text/javascript" src="js/tabs/ui/ui.tabs.js"></script>
    
    <script type="text/javascript" src="js/jquery.addfield.js"></script>
    
    
    
    

<script language="javascript" type="text/javascript">
<!--
var addText = '';
jQuery(document).ready(function() {
	var fshowMsg = document.getElementById('change').value;
	var autodim = false;

	if (fshowMsg=="1") {

		jQuery.fancybox(
			''+addText,
			{
				'resizeOnWindowResize'	: true,
				'width'         	: '510',
				'height'        	: '200',
				'transitionIn'		: 'elastic',
				'transitionOut'		: 'elastic',			
				'modal' 			: true,
				'centerOnScroll'	: true	}
		);
	}



});

function closeview(){
	jQuery.fancybox.close();
}
function openview(){
	mostrar('u_clave','');
	jQuery.fancybox.close();
}
-->
</script>

<!-- FancyBox -->
<div id="spuSimplePoPup" style="display:none;background-image:url(img/login.jpg);width:510px">
	<div id="spu" class="spu_content" style="text-align: center;">
    <img src="img/password.png" width="100" height="100"/><br>
    	Por motivos de seguridad, se recomienda cambiar <br/>
su contraseña  <a onclick="openview()" style="font-weight:bold">cambiar ahora</a> o <a onclick="closeview()" style="font-weight:bold">cambiar más tarde</a><br>
        <!--<br><iframe width="600" height="600" src="documents/ABOGADO I.pdf"></iframe>-->
	</div>
</div>

<div id="spuSimplePoPup2" style="display:none;background-image:url(img/login.jpg);width:510px">
</div>

<script language="javascript" type="text/javascript">
<!--
addText = document.getElementById('spuSimplePoPup').innerHTML;
addText2 = document.getElementById('spuSimplePoPup2').innerHTML;
-->
</script>    
</head>
	
<body class="public to-be-determined lightbox-processed tableHeader-processed">
<input type="hidden" id="change" value="<?php echo $_SESSION["change"];?>">
<input type="hidden" id="id_ProgramaSociales" value="0" />
        <div id="header">
      <div class="header-wrapper">
        <a href="#" id="sntalent_logo" title="TLogo"><img src="./img/logo_biocafe.jpg" width="275" height="68" title="BIOCAFE" alt="BIOCAFE"></a>
              
        
        <div id="login_box">
            <!--<a href="#" id="register" class="btn_tbox">Soy Empresa</a>-->
            <!--<a href="#" id="login" class="btn_tbox">Iniciar sesión</a>-->
            <a href="logout.php" id="login" class="btn_tbox">Salir</a>
            <?php //echo $_SESSION["login"];
				echo 'Usuario';
			?>
        </div>        
        
        
        <nav id="navigation">
            <div class="item-list"><h3></h3>
                <ul class="links primary-links">
                	<li class="menu first"><a></a></li>
                    <li class="menu"><a href="inicio.php">INICIO</a></li>
                    
                    <?php //if($_SESSION["tipo"]=="3"){$v="block";}else{$v="none";} ?>
                    <li class="menu"><a onClick="mostrar('v_usuario','1')" style="display:<?php echo $v;?>">USUARIOS</a></li>
                    <li class="menu last"><a onClick="" style="display:<?php echo $v;?>">MANUAL</a></li>
                </ul>
            </div>    
		</nav>
                
       </div>
  </div>

<div class="main">
    <div id="wrapper">
          <h1 class="title" id="m_title">SISTEMA DE ACOPIO DE CAFE</h1>
     
    
    
    
    
    
<div class="panel-display zen-one-sidebar-second clearfix">

  <div class="panel-content"><div class="panel-content-inner inside panel-panel">
    <div class="panels_pane panel-pane pane-node-content">
  
  
  
  
  
  
  
  <div class="pane-content">
    <div class="left_double">

      <span class="green_line"></span>
      
      		
        <div>
      <div style="width:850px;margin:10px auto" >
    <div class="container4">
        <div class="menu4">
            <ul>
                <li class="articles"><a href="#">Gestión de Acopio</a>
                <ul>
                	<li class="add_article" id="0"><a onclick="mostrar('v_productor',0)">Listado Productores</a></li>
                    <li class="delete"><a onclick="mostrar('v_producto',0)">Listado Productos</a></li>
                    <li class="delete"><a onclick="mostrar('n_NotaIngreso',0)">Generar Nota de Ingreso</a></li>
                    <li class="delete"><a onclick="mostrar('v_producto',0)">Generar Liq. Compra</a></li>
                </ul>
                </li>
                
                <li class="users"><a href="#">Reportes</a>
                <ul>
                    <li class="add_user"><a href="#" id="0" onclick="mostrar(this,'','')">Generar Reportes</a></li>                  
                </ul>
                </li>
                
            	<li class="groups"><a href="#">Consultas</a>
                 <ul>
                    <li class="show subsubl"><a onclick="mostrar(this,'')">Consultar Ratios de Entrega</a></li>
                    <li class="show subsubl"><a onclick="mostrar(this,'','')">Consultar Existencias</a></li>
                   	<li class="show subsubl"><a onclick="mostrar(this,'')">Consultar Liq. de Compra</a></li>
                    <li class="show subsubl"><a onclick="mostrar(this,'')">Consultar Guias de Remision</a></li>
                </ul>
                </li>
                
            	<li class="settings"><a href="#">Mantenimientos</a>
                <ul> 
                    <li class="show subsubl"><a href="#" onclick="mostrar(this,'')">Administrar Tablas Secundarias</a></li>
                </ul>
                </li>
                
                <li class="settings"><a href="#">Configuración</a>
                <ul> 
                    <li class="show subsubl"><a href="#" onclick="mostrar('u_clave',0)">Cambio de Clave</a></li>
                    <li class="show subsubl"><a href="#" onclick="mostrar(this,'')">Administrar Perfiles de Usuario</a></li>
                    <li class="show subsubl"><a href="#" onclick="mostrar(this,'')">Administrar Configuración</a></li>
                </ul>
                </li>
                
                
            </ul>
        </div>
    </div>
</div>
      
      <p></p>
    </div>
    
            <div class="offer_container" id="divdata">
           
           	
            
            
            <div id="formu" style="display:block;border-collapse:collapse;border:double;border-color:#666">
            <div style="float:left"><br><img src="img/admin.jpg" width="150" height="150"></div>
            <table width="460" border="0">
                <tr><td width="454">
                    <table width="457" border="0">
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="3" style="font-weight:bold">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="3" style="font-weight:bold">USTED ES:</td>
                      </tr>
                      <tr>
                        <td width="29">&nbsp;</td>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="16">&nbsp;</td>
                        <td width="70">&nbsp;&nbsp;Datos</td>
                        <td width="14">:</td>
                        <td width="306">&nbsp;<?php echo 'ADMINISTRADOR';?></td>
                      </tr>
                      <tr>
                        <td height="16">&nbsp;</td>
                        <td>&nbsp;&nbsp;DNI</td>
                        <td>:</td>
                        <td>&nbsp;<?php echo '47339667';?></td>
                      </tr>
                      <tr>
                        <td height="16">&nbsp;</td>
                        <td>&nbsp;&nbsp;Usuario</td>
                        <td>:</td>
                        <td>&nbsp;<?php echo $_SESSION["login"];?></td>
                      </tr>
                      <tr>
                        <td height="16">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="16">&nbsp;</td>
                        <td style="font-weight:bold">&nbsp;</td>
                        <td style="font-weight:bold">&nbsp;</td>
                        <td>&nbsp;</td>
                        </tr>
                    </table>
              </td></tr>
        
            </table>
			</div>

            
            <br>
            <div id="mensaje" class="info" style="display:block">
                Bienvenido al Sistema de Acopio de Cafe.
       		</div>
            
            <!--<script>mostrar(this,'ficha','0');</script>-->
            
            </div><!---offer_container--->




</div> <!---left double---> </div>

  
  
  
  
  
  
  </div>





  </div></div> <!-- /.panel-content-inner, /.panel-content -->

  <div class="panel-sidebar-first"><div class="panel-sidebar-first-inner inside panel-panel">
    <div class="panels_pane panel-pane pane-valls-form-invitacion-pane panel_green_line" id="referral_friend">
  
  
  
  
              
              
              
              
                </div>

  
  </div>
  </div></div> <!-- /.panel-sidebar-first-inner, /.panel-sidebar-first -->

</div> <!-- /.zen-one-sidebar-second -->
       
              </div>
  
 <div class="lower-main">
      <footer id="footer">
      <div class="center_box">
        	
        <div id="footer_top">
           <!-- <div id="footer_about" class="footer_box" style="height: 20px;">
              <p class="title">Conoce ...</p>
              
            </div>
            <div id="footer_contact" class="footer_box" style="height: 20px;">
              <p class="title">Contactar</p>
              
            </div>
            <div id="footer_followus" class="footer_box" style="height: 20px;">
              <p class="title">Empresas</p>
              
              <div id="footer_sntalent_social">
                  
                    
             </div>
          </div>-->
          <!--<div id="footer_blog" class="footer_box" style="height: 20px;">
            <p class="title">Candidatos</p>

              <div id="footer_sntalent_social">
                  
                    
          </div>
        </div>-->
        <div id="footer_bottom">
          <div id="legal">
            <a id="logo_footer" href="#"><!--<img src="./img/unfv_logo_bn.png" alt="Logo">--></a>
            <p id="copyright">Copyright © 2015</p>
            <span id="legal_links">
                    <a href="#">Seguridad</a> / 
                    <a href="#">Términos y condiciones</a> 
             </span>
          </div>
        </div>	
      </div> 
    </div></footer> 
    
  </div>


</body>

</html>