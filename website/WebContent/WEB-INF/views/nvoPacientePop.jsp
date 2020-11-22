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
		<div class="card card-primary">
		 <div class="card-header">
              <h3 class="card-title">Registro Mascota</h3>

              <div class="card-tools">
<!--                 <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse"> -->
<!--                   <i class="fas fa-minus"></i></button> -->
              </div>
            </div>
            <div class="card-body">
			<form id="frmIngreso" name="input" action="agregarmascota"  method="post">
			<div style="width:200px">&nbsp;</div>
			<div class="form-group" hidden=true>
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">ClienteID</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name =txtClienteid id="txtClienteid" readonly="readonly" value="${requestScope.model.codigo}">
		            
		          </div>
    			</div>
	   		 <div class="form-group" >
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Cliente</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name =txtCliente id="txtCliente" readonly="readonly" value="${requestScope.model.nombre}, ${requestScope.model.apellido}">
		            
		          </div>
    			</div>
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Nombre Mascota</label>
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
		            <select  id="cboEspecie" name="cboEspecie" required>
	                  <option selected disabled>Seleccione  </option>
	                  <option value="1">Perro</option>
	                  <option value="2">Gato</option>
	                  <option value="3">Ave</option>
	                  <option value="4">Otro</option>
	                </select>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Genero</label>
		          <div class="controls">
		            <input type="radio" name="rbGenero" value="H" checked> Hembra<br>
						<input type="radio" name="rbGenero" value="M"> Macho<br>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Esterilizado</label>
		          <div class="controls">
		            <input type="radio" name="rbEsterilizado" value="S" checked> Si<br>
						<input type="radio" name="rbEsterilizado" value="N"> No<br>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Peso</label>
		          <div class="controls">
		            <input type="number" class="input-xlarge" name ="nbrPeso" min="1" max="9999" step=".01" required>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Observaciones</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name ="txtObservaciones" maxlength="200">
		          </div>
		    </div>
		    <div class="form-group">
			          <div class="controls">
			            <input type="submit" value="Confirmar" class="btn btn-success">			            
			          </div>
        		</div>
		    	    
<!-- 		    <div class="form-group"> -->
					 
<!-- 			          <div class="controls"> -->
<!-- 			          <a href="#" class="btn btn-primary btn-sm" onclick="agregarmascota();" > </a>	           -->
<!-- 			           </div> -->
<!--         		</div> -->
		</form>
		 </div>
          <!-- /.card -->
        </div>
 			</div>
		 </div>
		 </div>
		  </section>
		 </div>	 

	<jsp:include page="script.jsp"></jsp:include>
	<SCRIPT type="text/javascript">			
		function agregarmascota(){
			
			
			window.close();
		}
	</script>
	
</body>
</html>