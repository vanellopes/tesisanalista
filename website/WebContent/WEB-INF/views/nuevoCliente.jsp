<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<!--  <!-- Le styles -->
<!--   <link href="../css/bootstrap.css" rel="stylesheet"> -->
<!--   <link href="../css/DT_bootstrap.css" rel="stylesheet"> -->
  
<!--   <link href="../css/bootstrap-responsive.css" rel="stylesheet"> -->
<!--   <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/base/jquery-ui.css" rel="stylesheet"> -->
    
<title>InstantVet | Nuevo Cliente</title>

<SCRIPT type="text/javascript">

function verificarRegistroCliente(){	
	document.getElementById("frmValidar").src = "consultarServicioReniec?txtDNI=" + document.getElementById("txtDNI").value;
	document.getElementById("frmValidar").reload();
	document.getElementById("frmValidar").contentWindow.navigate("consultarServicioReniec");	
	
}

function window_onload(){
	
	if(document.getElementById("_error").value == "0"){
		alert("EL DNI no existe!!!");
	}
	
}

</SCRIPT>

</head>
<body onload="window_onload()">
 	<jsp:include page="menu2.jsp"></jsp:include>
     <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
           
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <section class="content">
      <div class="container" style="width: 1076px;">


            <!-- Main content -->
       <div class="invoice p-3 mb-3">
	
	      <!-- Main hero unit for a primary marketing message or call to action -->
	      <div class="hero-unit" >
      <h3>Registro de Cliente</h3>
			<form id="frmIngreso" name="input" action="registrarCliente" method="post">
			<div style="width:200px">&nbsp;</div>
    		
    		<div class="form-group">
	          <!-- Text input-->
	          <label class="control-label" for="input01" style="float:left;width:140px">Num Documento</label>	          
	          <div class="controls">
	            <input type="number" class="input-xlarge" id="txtDNI" name="txtDNI"  max="99999999" required>
	           </div>
    		</div>
    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Nombre</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name="txtNombre" id="txtNombre" required>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Apellido</label>
		          <div class="controls">
		            <input type="text"  class="input-xlarge" value="${requestScope.model.apellido}" name="txtApellido" id="txtApellido" required>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Fecha Nac</label>
		          <div class="controls">	
		          	<input type="date" class="input-xlarge" name ="fecha" id="fecha" required>		      
		          </div>
    		</div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Telefono</label>
		          <div class="controls">
		            <input type="number" class="input-xlarge" name ="txtTelefono" required>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Direccion</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name ="txtDireccion">
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Email</label>
		          <div class="controls">
		            <input type="email" class="input-xlarge" name ="txtEmail">
		          </div>
		    </div>
		    
		    <div class="form-group">
					  <!-- Button -->
			          <div class="controls">
			            <input type="submit" value="Confirmar" class="btn btn-success" onclick="return validar();" >
			            <a href="main.jsp" class="btn btn-danger">Cancelar</a>
			          </div>
        		</div>
		    
<!-- 		    <div class="form-group"> -->
<!-- 				  Button -->
<!-- 		          <div class="controls"> -->
<!-- 		            <input type="submit" value="Ingresar" class="btn btn-success" > -->
<%-- 		            <input type="hidden" id="_error" value="${requestScope.model.error}" /> --%>
<!-- 		          </div> -->
<!--         	</div> -->
		
		</form>
 			</div>
		 </div>
		 </div>
		  </section>
		 </div>
		 

	<jsp:include page="script.jsp"></jsp:include>
</body>
</html>