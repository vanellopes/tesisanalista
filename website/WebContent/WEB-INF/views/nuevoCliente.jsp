<!DOCTYPE html >
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<title>InstantVet | Nuevo Cliente</title>

</head>
<body>
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
              <h3 class="card-title">Registro Cliente</h3>

              <div class="card-tools">
<!--                 <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse"> -->
<!--                   <i class="fas fa-minus"></i></button> -->
              </div>
            </div>
            <div class="card-body">
			<form id="frmIngreso" name="input" action="registrarCliente" method="post">
			<div style="width:200px">&nbsp;</div>
    		
    		<div class="form-group">
	          <!-- Text input-->
	          <label class="control-label" for="input01" style="float:left;width:140px">Num Documento</label>	          
	          <div class="controls">
	            <input type="number" class="input-xlarge" id="txtDNI" name="txtDNI"  max="99999999" min="1" required>
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
		          <label class="control-label" for="input01" style="float:left;width:140px">Apellido</label>
		          <div class="controls">
		            <input type="text"  class="input-xlarge"  name="txtApellido" id="txtApellido" maxlength="30" required>
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Fecha Nac</label>
		          <div class="controls">	
		          	<input type="date" class="input-xlarge" name ="fecha" id="fecha" >		      
		          </div>
    		</div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Telefono</label>
		          <div class="controls">
		            <input type="number" class="input-xlarge" name ="txtTelefono" min="1" max="9999999999" required >
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Direccion</label>
		          <div class="controls">
		            <input type="text" class="input-xlarge" name ="txtDireccion" maxlength="200">
		          </div>
		    </div>
		    
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Email</label>
		          <div class="controls">
		            <input type="email" class="input-xlarge" name ="txtEmail" maxlength="50">
		          </div>
		    </div>
<!-- 		    <div class="form-group"> -->
<!-- 	          <label class="control-label" for="input01" style="float:left;width:140px">Agregar Mascota</label> -->
<!-- 	          <div class="controls"> -->
<!-- 	            <input type="submit" value="+" class="btn btn-info" name =txtmascota id="txtmascota" readonly="readonly" > -->
                     
<!-- 	            <input type="hidden" id="hiddenmascota" name="hiddenMnombre"> -->
<!-- 	          </div> -->
<!--    			</div> -->
   			
		    <div class="form-group">
		          <!-- Text input-->
		          <label class="control-label" for="input01" style="float:left;width:140px">Agregar Mascota</label>
		          <div class="controls">
						<input type="radio" name="rbAgregarMascota" value="S" checked> Si<br>
						<input type="radio" name="rbAgregarMascota" value="N"> No<br>
		          </div>
    			</div>
		    
		    <div class="form-group">
					  <!-- Button -->
			          <div class="controls">
			          	<a href="main.jsp" class="btn btn-danger">Cancelar</a>
			            <input type="submit" value="Confirmar" class="btn btn-success">			            
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
		   <aside class="control-sidebar control-sidebar-dark">
	    <!-- Control sidebar content goes here -->
	  </aside>
		  	 
		 </div>
		 <!-- Control Sidebar -->
	 
	  <!-- /.control-sidebar -->
	<SCRIPT type="text/javascript">
	function buscarcliente(){
		window.open("buscacliente","","toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=600,height=600");
	}
		function agregarpaciente(){
			window.open("agregarmascota","","toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=600,height=600");
		}
		
	</SCRIPT>
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jas-script.js"></script>
	<jsp:include page="script.jsp"></jsp:include>
</body>
</html>