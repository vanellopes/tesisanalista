<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="head.jsp"></jsp:include>  
	  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">  
	   
	<title>InstantVet | Lista de Turnos</title>
</head>
<body> 
<div class="wrapper">
    <jsp:include page="menu2.jsp"></jsp:include>
     <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <form action="registroTurno" method="get">
				<input type="submit" name="btnNuevo" id="btnNuevo" value="Nuevo Turno"   class="btn btn-success" />
				<a href="main.jsp" class="btn btn-success">Regresar al Inicio</a>
			</form>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
    <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Lista de Turnos</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Fecha y hora </th>
					<th>Area</th>
					<th>Cliente</th>
					<th>Mascota</th>
					<th>Telefono de contacto</th>	
					<th>Estado</th>			
					<th>Observaciones</th>
					<th></th>
                  </tr>
                  </thead>
                  <tbody>
					<c:forEach items="${model.turnos}" var="tur" varStatus="i">
						<tr>
<%-- 						<td>${tur.fechaTurno}</td> --%>
						<td width="150">
						 <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${tur.fechaTurno}" pattern="dd/MM/yyyy, HH:mm"/></td>
							<td>${tur.tipoTurno=='V' ? 'Veterinaria' : 'Peluqueria'}</td>
							<td>${tur.nombreCliente}</td>
							<td>${tur.nombrePaciente}</td>
							<td>${tur.telefono}</td>
							<td>${tur.estadoTurno}</td>
							<td>${tur.observaciones}</td>	
							<td ><a data-toggle="tooltip" data-placement="right" title="Confirmar"
								href="confirmarTurno?idTurno=${tur.codigoTurno}">
								<span style="color: blue;">
								 	 <i class="far fa-check-circle"  onclick="return confirmar();"></i>
								</span>
								</a>
								<a data-toggle="tooltip" data-placement="right" title="Finalizar"
								href="finalizarAtencionTurno?idTurno=${tur.codigoTurno}">
								<span style="color: green;">
								 	 <i class="fas fa-check-circle"  onclick="return confirmar();"></i>
								</span>
								</a>
								<a data-placement="right" title="Cancelar"
								href="cancelarTurno?idTurno=${tur.codigoTurno}">
								<span style="color: red;">
								 	 <i class="fas fa-times-circle"  onclick="return confirmar();"></i>
								</span></a>
								<a data-placement="right" title="Modificar"
								href="editarTurno?idTurno=${tur.codigoTurno}"> 
								<span style="color: gray;">
								 	 <i class="fas fa-pencil-alt"  onclick="return confirmar();"></i>
								</span></a></td>
						</tr>
						</c:forEach>                  
                    
                  </tbody>
                 
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 </div>
 <!-- Control Sidebar -->
	  <aside class="control-sidebar control-sidebar-dark">
	    <!-- Control sidebar content goes here -->
	  </aside>
	  <!-- /.control-sidebar -->
 <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; InstantVet .</strong> 
  </footer>
	 <!-- jQuery -->
	<script src="../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables -->
	<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script src="../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../dist/js/demo.js"></script>
	<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    });
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>

	<script type="text/javascript" >
			function confirmar(){
				if(confirm("Esta Seguro que quiere realizar la accion seleccionada ?")){
					return true;
				}else{
					return false;
				}
			}
	 </script>
	
	</body>
</html>