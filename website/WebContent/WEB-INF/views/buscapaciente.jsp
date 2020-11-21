<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>  
	  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">  
	<title>InstantVet | Busqueda de Mascotas</title>
	<style type="text/css">
	      body {
	        padding-top: 60px;
	        padding-bottom: 40px;
	      }
    </style>

</head>
<body>
<div class="wrapper">
		<h1>Listado de Mascotas</h1> <p>
		<form action="" method="get">
		</form>
		<table id="example2" class="table table-bordered table-striped">
			<thead>
		    	<tr>
		            <th scope="col">Nombre</th>		            
		        	<th scope="col">Especie</th>
		            <th scope="col">Seleccionar</th>
		        </tr>
	    	</thead>
			<tbody>
			<c:forEach items="${model.pacientes}" var="prod" varStatus="i">
			<tr>
				<td>${prod.nombre}</td>
				<td width="100">${prod.especie}</td>
				<td><a href="#" onclick='seleccionarpaciente("${prod.codigoPaciente}","${prod.nombre}");'>Seleccionar</a></td>
			</tr>
			</c:forEach>
			</tbody>
			
		</table>
		
<!-- 		<div class="form-group"> -->
<!-- 		  Button -->
<!--           <div class="controls"> -->
<!--             <input type="submit" value="Agregar Mascota" class="btn btn-success" href="nuevoPaciente" > -->
            
<!--           </div> -->
<!--         </div> -->
		</div>
	  <!-- /.content-wrapper -->
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
	<script type="text/javascript" language="javascript">
		function seleccionarpaciente(codigo,nombre){
			window.opener.document.getElementById("hiddenpaciente").value=codigo;
			window.opener.document.getElementById("txtpaciente").value=nombre;
			window.close();
		}
	</script>		
</body>
</html>