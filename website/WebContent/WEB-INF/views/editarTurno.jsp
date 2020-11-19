<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
    <title>InstantVet | Modificar Turno</title>
    
    <jsp:include page="head.jsp"></jsp:include>
    
 
    
    <style type="text/css" media="screen">
            .slides_container {
                width:950px;
                height:463px;
            }
            .slides_container div {
                width:950px;
                height:463px;
                display:block;
            }
        </style>
    

<SCRIPT type="text/javascript">
 function validar()
 {
	 var msg="";
	 var bol=true;
	 if(document.getElementById("txtCodigoPersonal").value=="") {
		 msg=msg +"Ingrese Codigo del Personal!!! \n"; 
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
	 
	 if(document.getElementById("txtDescripcion").value=="") {
		 msg=msg + "Ingrese Descripcion de la Tarea!!! \n"; 
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
 function validarFecha(fecha) 
 { 
	 try{ var fecha = fecha.split("/"); var dia = fecha[0]; var mes = fecha[1]; var ano = fecha[2]; var estado = true; if ((dia.length == 2) && (mes.length == 2) && (ano.length == 4)) { switch (parseInt(mes)) { case 1:dmax = 31;break; case 2: if (ano % 4 == 0) dmax = 29; else dmax = 28; break; case 3:dmax = 31;break; case 4:dmax = 30;break; case 5:dmax = 31;break; case 6:dmax = 30;break; case 7:dmax = 31;break; case 8:dmax = 31;break; case 9:dmax = 30;break; case 10:dmax = 31;break; case 11:dmax = 30;break; case 12:dmax = 31;break; } dmax!=""?dmax:dmax=-1; if ((dia >= 1) && (dia <= dmax) && (mes >= 1) && (mes <= 12)) { for (var i = 0; i < fecha[0].length; i++) { diaC = fecha[0].charAt(i).charCodeAt(0); (!((diaC > 47) && (diaC < 58)))?estado = false:''; mesC = fecha[1].charAt(i).charCodeAt(0); (!((mesC > 47) && (mesC < 58)))?estado = false:''; } } for (var i = 0; i < fecha[2].length; i++) { anoC = fecha[2].charAt(i).charCodeAt(0); (!((anoC > 47) && (anoC < 58)))?estado = false:''; } }else estado = false; return estado; }catch(err){ alert("Error fecha"); 
 }
 }

 function buscarpaciente(){
		window.open("buscapaciente?idcliente="+ document.getElementById("hiddencliente").value,"","width=600,height=400");
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
			<h3>Modificar Turno</h3>
			<form name="input" action="modificarTurno" method="post">			
			
				<div style="width:200px">&nbsp;</div>
				<div class="form-group" hidden>
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">IdTurno</label>
		          <div class="controls" >
		            <input name ="idTurno" id="idTurno" value="${requestScope.model.codigoTurno}" readonly="readonly" >
		          </div>
    			</div>
    			
    			<div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Cliente</label>
		          <div class="controls">
		            <input name ="txtCodigoCliente" id="txtCodigoCliente" value="${requestScope.model.nombreCliente}" readonly="readonly" >
		            <input type="hidden" id="hiddencliente" name="hiddencliente" value="${requestScope.model.cliente}">
		          </div>
    			</div>
    			
    			
    			<div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Mascota</label>
		          <div class="controls">
		              <input type="text" class="input-xlarge" name ="txtpaciente" id="txtpaciente" value="${requestScope.model.nombrePaciente}"readonly="readonly">
		            <input type="button" id="imgcliente" name="imgcliente" onclick="buscarpaciente();" >
		            <input type="hidden" id="hiddenpaciente" name="hiddenpaciente">
		          </div>
    			</div>
    			
    			<div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Observaciones</label>
		          <div class="controls">
		            <textarea class="input-xlarge"  rows="3" cols="20" name="txtDescripcion" id="txtDescripcion"  maxlength="200" value="${requestScope.model.observaciones}"></textarea>		      
		          </div>
    			</div>
			
				<div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Fecha Turno</label>
		          <div class="controls">	
		          	<input type="date" class="input-xlarge" name ="fecha" id="fecha" value="${requestScope.model.fechaTurno}" required>	
		          </div>
    			</div>
    			
    			<div class="form-group">
		          <label class="control-label" for="input01" style="float:left;width:140px">Hora Turno</label>
		          <div class="controls">	
		          	<input type="time" class="input-xlarge" name ="hora" id="hora"  value="${requestScope.model.hora}" required>
		          </div>
    			</div>
    			
    			
	    <div class="form-group">
					  <!-- Button -->
			          <div class="controls">
			            <input type="submit" value="Confirmar" class="btn btn-success" onclick="return validar();" >
			            <a href="listarTurnos" class="btn btn-danger">Cancelar</a>
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
    	    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jas-script.js"></script>


</body>

</html>