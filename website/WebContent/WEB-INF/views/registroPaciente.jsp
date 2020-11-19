<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>

<title>InstantVet | Nuevo Mascota</title>
<SCRIPT type="text/javascript">
 function validar(){
	 var msg="";
	 var bol=true;
	 if(document.getElementById("txtNombre").value=="") {
		 msg="Ingrese Nombre del Cliente!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtApellido").value=="") {
		 msg=msg + "Ingrese Apellido Paterno del Cliente!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtApellidoMaterno").value=="") {
		 msg=msg + "Ingrese Apellido Materno del Cliente!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtEmail").value!=""){
		 valor=document.getElementById("txtEmail").value;
			    re=/^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$/;
			    if(!re.exec(valor))    {
			    	 msg=msg + "Email Incorrecto!!! \n"; 
			    	 bol=false;
			    }
	 }
	 

	 
	 if(document.getElementById("txtUsuario").value=="") {
		 msg=msg + "Ingrese usuario del Personal!!! \n"; 
		 bol=false;
	 }
	 
	 if(msg.toString().length!=0){
		 alert(msg);
	 }
	 return bol;
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
		<h3>Registro de Mascota</h3>
			<form id="frmIngreso" name="input" action="registrarPaciente.html"  method="post">
			<div style="width:200px">&nbsp;</div>
			<div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Cliente</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name =txtCliente id="txtCliente" readonly="readonly" >
		            <input type="button" id="imgcliente" name="imgcliente" onclick="buscarcliente();" >
		            <input type="hidden" id="hiddencliente" name="hiddencliente" value="0">
		          </div>
    			</div>

    		   
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Nombre</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name="txtNombre" id="txtNombre" maxlength="30" required>
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
		          <label class="control-label" for="input01" style="float:left;width:140px">Especie</label>
		          <div class="controls">
		            <select class="form-control custom-select" required>
	                  <option selected disabled>Seleccione </option>
	                  <option>Perro</option>
	                  <option>Gato</option>
	                  <option>Ave</option>
	                  <option>Otro</option>
	                </select>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Genero</label>
		          <div class="controls">
		            <input type="radio" name="rbTipoTurno" value="H" checked> Hembra<br>
						<input type="radio" name="rbTipoTurno" value="M"> Macho<br>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Esterilizado</label>
		          <div class="controls">
		            <input type="radio" name="rbTipoTurno" value="S" checked> Si<br>
						<input type="radio" name="rbTipoTurno" value="N"> No<br>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Peso</label>
		          <div class="controls">
		            <input type="number" class="input-xlarge" name ="txtTelefono" min="1" max="99999999" required>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Observaciones</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name ="txtDireccion" maxlength="200">
		          </div>
		    </div>
		    
		    	    
		    <div class="form-group">
					  <!-- Button -->
			          <div class="controls">
			          <a href="main.jsp" class="btn btn-danger">Cancelar</a>
			            <input type="submit" value="Confirmar" class="btn btn-success" onclick="return validar();" >			          
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