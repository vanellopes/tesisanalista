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

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<title>Veterinaria - Vacunas</title>

<SCRIPT type="text/javascript">
 function validar()
 {
	 var msg="";
	 var bol=true;
	 if(document.getElementById("txtNombreVacuna").value=="") {
		 msg=msg +"Ingrese Nombre Vacuna!!! \n"; 
		 bol=false;
	 } 
	 
	 if(msg.toString().length!=0){
		 alert(msg);
	 }
	 return bol;
 }
</SCRIPT>

</head>
<body>

      <jsp:include page="menu.jsp"></jsp:include>
    
	<div class="container" style="width: 1076px;">
	
	      <!-- Main hero unit for a primary marketing message or call to action -->
	      <div class="hero-unit">
	      	<h3>Registro de Vacunas</h3>
			<form name="input" action="registrarNombreVacuna" method="post">
			    
			    <div style="width:200px">&nbsp;</div>
			    
				<div class="control-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:100px">Nombre Vacuna</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name = "txtNombreVacuna" id="txtNombreVacuna">
		          </div>
    			</div>
    			
    			<div class="control-group">
					  <!-- Button -->
			          <div class="controls">
			            <input type="submit" value="Crear Vacuna" class="btn btn-success" onclick="return validar();" >
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
    <script type="text/javascript" charset="utf-8" language="javascript" src="../js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8" language="javascript" src="../js/DT_bootstrap.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jas-script.js"></script>

</body>
</html>