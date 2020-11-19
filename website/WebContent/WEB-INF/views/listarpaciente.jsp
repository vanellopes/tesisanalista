<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <!DOCTYPE html >
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
  <jsp:include page="head.jsp"></jsp:include>
  
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
            <form action="#" method="get">
				<input type="submit" name="btnNuevo" id="btnNuevo" value="Nueva Mascota"   class="btn btn-success" />
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
					<th>Fecha Nac</th>
					<th>Especie</th>
					<th>Genero</th>	
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${model.pacientes}" var="prod" varStatus="i">
				<tr>
					<td width="250px">${prod.nombreCliente}</td>
					<td>${prod.nombre}</td>
					<td width="150">
					<fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${prod.fechaNacimiento}" pattern="dd/MM/yyyy, HH:mm"/></td>
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
     <footer>
        <p>&copy; InstantVet</p>
      </footer>
    <!-- /.content -->
  </div>
    <jsp:include page="script.jsp"></jsp:include>
    		
		    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" charset="utf-8" language="javascript" src="../js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8" language="javascript" src="../js/DT_bootstrap.js"></script>
    <script src="../js/bootstrap.js"></script>
     <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jas-script.js"></script>

	
	</body>
</html>