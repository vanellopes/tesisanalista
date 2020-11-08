<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <!DOCTYPE html >
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
  <!-- Le styles -->
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/DT_bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="../css/bootstrap-responsive.css" rel="stylesheet">
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/base/jquery-ui.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<title>Veterinaria - Citas para Vacunas</title>

<SCRIPT type="text/javascript">
 function validar()
 {
	 var msg="";
	 var bol=true;
	 if(document.getElementById("txtCodigoDoctor").value=="") {
		 msg=msg +"Ingrese Codigo del Doctor!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtCodigoCliente").value=="") {
		 msg=msg +"Ingrese Codigo del Cliente!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtCodigoPaciente").value=="") {
		 msg=msg +"Ingrese Codigo del Paciente!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtVacuna").value=="") {
		 msg=msg + "Ingrese nombre de la Vacuna!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtFecha").value=="") {
		 msg=msg + "Ingrese la Fecha de la Vacuna!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtFecha").value != "")
     {
		if(validarFecha(document.getElementById("txtFecha").value) == false)
		{
			 msg=msg + "Error en la fecha \n"; 
			 bol=false;
		}
     }
	 
	 if(msg.toString().length!=0){
		 alert(msg);
	 }
	 return bol;
 }
 /*function validarFecha(fecha) 
 { 
	 try{ var fecha = fecha.split("/"); var dia = fecha[0]; var mes = fecha[1]; var ano = fecha[2]; var estado = true; if ((dia.length == 2) && (mes.length == 2) && (ano.length == 4)) { switch (parseInt(mes)) { case 1:dmax = 31;break; case 2: if (ano % 4 == 0) dmax = 29; else dmax = 28; break; case 3:dmax = 31;break; case 4:dmax = 30;break; case 5:dmax = 31;break; case 6:dmax = 30;break; case 7:dmax = 31;break; case 8:dmax = 31;break; case 9:dmax = 30;break; case 10:dmax = 31;break; case 11:dmax = 30;break; case 12:dmax = 31;break; } dmax!=""?dmax:dmax=-1; if ((dia >= 1) && (dia <= dmax) && (mes >= 1) && (mes <= 12)) { for (var i = 0; i < fecha[0].length; i++) { diaC = fecha[0].charAt(i).charCodeAt(0); (!((diaC > 47) && (diaC < 58)))?estado = false:''; mesC = fecha[1].charAt(i).charCodeAt(0); (!((mesC > 47) && (mesC < 58)))?estado = false:''; } } for (var i = 0; i < fecha[2].length; i++) { anoC = fecha[2].charAt(i).charCodeAt(0); (!((anoC > 47) && (anoC < 58)))?estado = false:''; } }else estado = false; return estado; }catch(err){ alert("Error fecha"); 
 }
 }*/
 function buscarcliente(){
		window.open("buscacliente","","width=600,height=600");
	}

	function buscarpaciente(){
		window.open("buscapaciente?idcliente="+ document.getElementById("hiddencliente").value,"","width=600,height=400");
	}
</SCRIPT>

</head>
<body>

      <jsp:include page="menu.jsp"></jsp:include>

    
    <div class="container" style="width: 1076px;">
	
	      <!-- Main hero unit for a primary marketing message or call to action -->
	      <div class="hero-unit">
	      	<h3>Registro de Vacunas</h3>
			<form name="input" action="registrarVacuna" method="post">
			    
			    <div style="width:200px">&nbsp;</div>
			    
				<div class="control-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:100px">Codigo Doctor</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name = "txtCodigoDoctor" id="txtCodigoDoctor">
		          </div>
    			</div>
    			
    			<div class="control-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:100px">Codigo Cliente</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name =txtCliente id="txtCliente" readonly="readonly" >
		            <input type="button" id="imgcliente" name="imgcliente" onclick="buscarcliente();" >
		            <input type="hidden" id="hiddencliente" name="hiddencliente" value="0">
		          </div>
    			</div>
    			
    			<div class="control-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:100px">Codigo Paciente</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name ="txtpaciente" id="txtpaciente" readonly="readonly">
		            <input type="button" id="imgcliente" name="imgcliente" onclick="buscarpaciente();" >
		            <input type="hidden" id="hiddenpaciente" name="hiddenpaciente"">
		          </div>
    			</div>
    			
    		   <div class="control-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:100px">Nombre de Vacuna</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name ="txtVacuna" id="txtVacuna">
		          </div>
    			</div>
    			
    			<div class="control-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:100px">Notas</label>
		          <div class="controls">
		            <textarea class="input-xlarge" rows="3" cols="20" name="txtDescripcion" id="txtDescripcion"></textarea>
		      
		          </div>
    			</div>
    			
    		   <div class="control-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:100px">Fecha Vacuna</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name ="txtFecha" id="txtFecha">
		      
		          </div>
    			</div>
    			
    			
    			
    			<div class="control-group">
					  <!-- Button -->
			          <div class="controls">
			            <input type="submit" value="Crear Cita" class="btn btn-success" onclick="return validar();" >
			          </div>
        		</div>
				
			</form>

	      </div>
	      
	      <footer>
        		<p>&copy; InstantVet</p>
      	  </footer>
	      
	      
	</div>

	
	    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jas-script.js"></script>

</body>
</html>