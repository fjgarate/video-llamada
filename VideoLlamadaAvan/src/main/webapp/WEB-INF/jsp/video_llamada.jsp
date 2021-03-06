<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="shortcut icon" href="/img/kurento.png" type="image/png" />

<link rel="stylesheet"
	href="/webjars/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/webjars/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/webjars/ekko-lightbox/dist/ekko-lightbox.min.css">
<link rel="stylesheet" href="/webjars/demo-console/index.css">
<link rel="stylesheet" href="/css/kurento.css">
<link rel="stylesheet" href="/webjars/demo-console/index.css">

<script src="/webjars/jquery/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/webjars/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
<script src="/webjars/draggabilly/draggabilly.pkgd.min.js"></script>
<script src="/webjars/adapter.js/adapter.js"></script>
<script src="/webjars/demo-console/index.js"></script>

<script src="/js/kurento-utils.js"></script>
<script src="/js/index.js"></script>
<title>video llamada </title>
<script>
var to="${to}";

var from="${from}"
</script>
    <script src="js/index.js"></script>
    <title>Video conferencia</title>
     <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding 
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }*/
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
i.mysize{
	font-size:2em;
	}
	div.mysize{
	font-size:2em;
	}
  </style>
<script>
function desconexion(){
	var confirmar=confirm("Desconectar");  
	if(confirmar){
		$('#acceso').toggle();
		$('#acceso2').toggle();
		document.getElementById("usuario_llamar").innerHTML = "<img title='conectado' height=20px width=20px style='margin-right:10px' src='img/status-available.png' /><b>"+to+"</b><i class='glyphicon glyphicon-remove' style='color:red;font-size:1em'  data-toggle='tooltip' title='desconectado'></i> ";
		document.getElementById('saludo').innerHTML = "<span style='font-size:25px;margin:10px'> "+from+"</span><span style='color:#E81123;font-size:12px'>desconectado</span>";
		setRegisterState(NOT_REGISTERED);
		var message = {
			id : 'desconexion',
			name : from
		};
		sendMessage(message);
		}
	}
function conexion(){
	var confirmar=confirm("Conectar");  
	if(confirmar){
		$('#acceso').toggle();
		$('#acceso2').toggle();
		/*document.getElementById("usuario_llamar").innerHTML = "<img title='conectado' height=20px width=20px style='margin-right:10px' src='img/status-available.png' /><b>"+to+"</b><i class='glyphicon glyphicon-remove' style='color:red;font-size:1em'  data-toggle='tooltip' title='desconectado'></i> ";
		document.getElementById('saludo').innerHTML = "<span style='font-size:25px;margin:10px'> "+from+"</span><span style='color:#E81123;font-size:12px'>desconectado</span>";
*/
		setRegisterState(REGISTERING);
		var message = {
			id : 'register',
			name : from
		};
		sendMessage(message);
	}
}
</script>
</head>
<body>
	<header>
     <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"></button>
            <span style="font-size:30px;padding-left:400px" class="navbar-brand" >Sala de espera virtual</span>
          </div>
          <div class="collapse navbar-collapse"
            id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
              <li>
             <!--   <a href="https://github.com/Kurento/kurento-tutorial-node/tree/develop/kurento-one2one-call">
                  <span class="glyphicon glyphicon-file"></span> Source Code</a>-->
              </li>
            </ul>
          </div>
        </div>
      </div>
	</header>
    <div class="container">
      <div class="page-header">
        <div id="saludo"></div>
          <div onclick="conexion()" style="display:none" id="acceso2" class="conex"></div>
        <div onclick="desconexion()" id="acceso" class="desco"></div>
      </div>
      <div class="row">
		  
		  <div id="usuarios" class="col-md-4"> 
			  <div class="usuario" id="usuario">
					<p id="usuario_llamar"></p>
					<div class='iconos_llamadas'>
				  	<!--   <a id='call' href='#'style='display:none'  class=''> <img height='35' width='35' class='icon_enable' id='icono_llamar' src='img/call.png' data-toggle='tooltip' title='llamar' alt='llamar' /></a>-->
					<!--   <a href='#' id='terminate' style='display:none' ><img   data-toggle='tooltip' title='colgar' height='35' width='35'id='icono_colgar' class='icono_enable' src='img/hangup.png' /></a>-->
                   <!--    <a id='calling' style="display:none" height='35' width='35' href='#' class="animate" ><img  id='ima' src='img/calling.png' data-toggle='tooltip' title='llamanado' alt='llamando' /></a>-->
					</div>
			 </div>
		  </div>
		
  
        <div class="col-md-8">
          <div id="videoBig">
            <video id="videoOutput" autoplay width="640px" height="480px" poster="img/webrtc.png_"></video>
          </div>
          <div id="videoSmall">
            <video id="videoInput" autoplay width="240px" height="180px" poster="img/webrtc.png_"></video>
          </div>
          <div id="controls" style="display:none"> 
          <div class="panel_controls"   ></div>
        <!--  <img class="controls2" style="margin-left:400px" height='45' width='45'  id='icono_llamar' src='img/hangup3.png' data-toggle='tooltip' title='colgar' alt='colgar' />
        -->
          <span class="incons_controls" style="margin-left:400px;color:#E81123">
			<i id="terminate" class=" glyphicon glyphicon-phone-alt mysize"  data-toggle='tooltip' title='colgar'></i> 
		  </span>
		     <span class="incons_controls" style="margin-left:330px;color:#FFFFFF">
			<div id="cam" onclick="cambia_video()" class="fa fa-video-camera mysize"  data-toggle='tooltip' title='video habilitado'></div> 
		  </span>
		       <span class="incons_controls" style="margin-left:270px;color:#FFFFFF">
			<i id="micro" onclick="cambia_audio()" class="fa fa-microphone mysize"  data-toggle='tooltip' title='audio habilidado'></i> 
		  </span>
		     <span class="incons_controls" style="margin-left:210px;color:#FFFFFF">
			<i id="full" onclick="full()" class="full fa fa-expand mysize"  data-toggle='tooltip' title='pantalla completa'></i> 
			<i id="full" style="display:none" onclick="full()" class="full fa fa-compress  mysize"  data-toggle='tooltip' title='minimiza'></i> 
		  </span>
		</div> 
        </div>
       </div>
    </div>

    <footer>
      <div class="foot-fixed-bottom">
        <div class="container text-center">
      
        </div>
      </div>
    </footer>

  </body>
</html>