<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
  <!DOCTYPE html >
 <html>
 <head>
 <jsp:include page="head.jsp"></jsp:include>  
	  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">  
  
	<title>InstantVet | Lista de Pacientes</title>
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
            <form action="registroPaciente" method="get">
				<input type="submit" name="btnNuevo" id="btnNuevo" value="Nueva Mascota"  class="btn btn-success" />
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
                <h3 class="card-title">Lista de Mascotas</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
				<thead>	
					<tr>
						<th>Cliente</th>
						<th>Nombre</th>
						<th>Fecha Nacimiento</th>
						<th>Especie</th>
						<th>Genero</th>	
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model.pacientes}" var="prod" varStatus="i">
					<tr>
						<td width="250px">${prod.nombreCliente}</td>
						<td>${prod.nombre}</td>
<%-- 						<td>${prod.fechaNacimiento}</td> --%>
						<td width="180">
						<fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${prod.fechaNacimiento}" pattern="dd/MM/yyyy"/></td>
						<td>${prod.especie}</td>
						<td>${prod.genero=='H' ? 'Hembra' : 'Macho'}</td>
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

	
	</body>
</html>