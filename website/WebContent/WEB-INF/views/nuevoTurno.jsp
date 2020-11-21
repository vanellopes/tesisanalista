<!DOCTYPE html >
 <html>
 <head>
 
  <jsp:include page="head.jsp"></jsp:include>

<title>InstantVet | Nuevo Turno</title>



</head>
<body>
	<jsp:include page="menu2.jsp"></jsp:include>
<!-- Content Wrapper. Contains page content -->
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
              <h3 class="card-title">Registro Turno</h3>

              <div class="card-tools">
<!--                 <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse"> -->
<!--                   <i class="fas fa-minus"></i></button> -->
              </div>
            </div>
            <div class="card-body">
			<form name="input" action="registrarTurno" method="post">			
			
				<div style="width:200px">&nbsp;</div>
    			
    			<div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:120px">Cliente</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name =txtCliente id="txtCliente" readonly="readonly" required>
		            <a class="btn btn-primary btn-sm" onclick="buscarcliente();" data-toggle="tooltip" data-placement="right" title="Buscar cliente">
                              <i class="fa fa-search-plus"></i> </a>
		            <input type="hidden" id="hiddencliente" name="hiddencliente" value="0">
		          </div>
    			</div>
    			
    			<div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:120px">Mascota</label>
		          <div class="controls">
		              <input type="text" class="input-xlarge" name ="txtpaciente" id="txtpaciente" readonly="readonly">
		              <a class="btn btn-primary btn-sm" onclick="buscarpaciente();" data-toggle="tooltip" data-placement="right" title="Buscar mascota">
                              <i class="fa fa-search-plus"></i> </a>
		            <input type="hidden" id="hiddenpaciente" name="hiddenpaciente">
		          </div>
    			</div>
    			
    			
    			<div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:120px">Area Turno</label>
		          <div class="controls">
						<input type="radio" name="rbTipoTurno" value="V" checked> Veterinaria<br>
						<input type="radio" name="rbTipoTurno" value="P"> Peluqueria<br>
		          </div>
    			</div>
    			<div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:120px">Observaciones</label>
		          <div class="controls">
		            <textarea class="input-xlarge"  rows="3" cols="20" name="txtDescripcion" id="txtDescripcion"  maxlength="200"></textarea>
		      
		          </div>
    			</div>
			
				<div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:120px">Fecha Turno</label>
		          <div class="controls">	
		          	<input type="date" class="input-xlarge" name ="fecha" id="fecha" required>	
		          </div>
    			</div>
    			
    			<div class="form-group">
		          <label class="control-label" for="input01" style="float:left;width:120px">Hora Turno</label>
		          <div class="controls">	
		          	<input type="time" class="input-xlarge" name ="hora" id="hora" required>
		          </div>
    			</div>
    			
    			<div class="form-group">
					  <!-- Button -->
			          <div class="controls">
			          <a href="main.jsp" class="btn btn-danger">Cancelar</a>
			            <input type="submit" value="Confirmar" class="btn btn-success" onclick="return validar();" >
			            
			          </div>
        		</div>
			
			</form>
			 </div>
          <!-- /.card -->
        </div>
	</div>
	 </div>
	</div>
		  </section>
		 </div>
		 
		

		 <footer>
        		<p>&copy; InstantVet</p>
      	  </footer>
		 
   	 
    <jsp:include page="script.jsp"></jsp:include>
    	    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jas-script.js"></script>
<SCRIPT type="text/javascript">
 function validar()
 {  
	 var msg="";
	 var bol=true;
	 
	 if(document.getElementById("txtCodigoCliente").value=="") {
		 msg=msg +"Ingrese Codigo del Cliente!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtCodigoPaciente").value=="") {
		 msg=msg +"Ingrese Codigo del Mascota!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtDescripcion").value=="") {
		 msg=msg + "Ingrese Descripcion de la Tarea!!! \n"; 
		 bol=false;
	 }
	 
	 if(document.getElementById("txtFecha").value=="") {
		 msg=msg + "Ingrese la Fecha de la Tarea!!! \n"; 
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
		window.open("buscacliente","","toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=600,height=600");
	}

	function buscarpaciente(){
		window.open("buscapaciente?idcliente="+ document.getElementById("hiddencliente").value,"","toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=600,height=600");
	}
</SCRIPT>

</body>
</html>