<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <!DOCTYPE html >
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
  <jsp:include page="head.jsp"></jsp:include>
  <!-- Le styles -->
  <link href="../css/bootstrap.css" rel="stylesheet">
  <link href="../css/DT_bootstrap.css" rel="stylesheet">
  
  <link href="../css/bootstrap-responsive.css" rel="stylesheet">
	<title>InstantVet | Lista de Clientes</title>
<script type="text/javascript" >
	function confirmar(){
		if(confirm("Desea realizar esta acción?")){
			return true;
		}else{
			return false;
		}
	}
</script>
<style type="text/css">
#gradient-style
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 800px;
	text-align: left;
	border-collapse: collapse;
}
#gradient-style th
{
	font-size: 13px;
	font-weight: normal;
	padding: 8px;
	background: #b9c9fe url('table-images/gradhead.png') repeat-x;
	border-top: 2px solid #d3ddff;
	border-bottom: 1px solid #fff;
	color: #039;
}
#gradient-style td
{
	padding: 8px; 
	border-bottom: 1px solid #fff;
	color: #669;
	border-top: 1px solid #fff;
	background: #e8edff url('table-images/gradback.png') repeat-x;
}
#gradient-style tfoot tr td
{
	background: #e8edff;
	font-size: 12px;
	color: #99c;
}
#gradient-style tbody tr:hover td
{
	background: #d0dafd url('table-images/gradhover.png') repeat-x;
	color: #339;
}
</style>
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
                <h3 class="card-title">Lista de Clientes</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
				<thead>
		    	<tr>
		        	<th>Nombres y Apellido</th>		            
		            <th>Num Documento</th>
		            <th>Direccion</th>
					<th>Telefono</th>
					<th>Email</th>
					<th>Ver Mascotas</th>
		        </tr>
	    	</thead>
	    	<tbody>
			<c:forEach items="${model.clientes}" var="prod" varStatus="i">
			<tr>
				<td width="180">${prod.apellido}, ${prod.nombre}</td>				
				<td>${prod.numDocumento}</td>
				<td>${prod.direccion}</td>
				<td>${prod.telefono}</td>
				<td>${prod.email}</td>
				<td align="center"><a
						href="verpaciente?idcliente=${prod.codigo}"><i class="fas fa-paw" src="<%=request.getContextPath()%>"></i></a>
				</td>				
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
  <!-- /.content-wrapper -->
		
		<jsp:include page="script.jsp"></jsp:include>
		

		
		
		
	</body>
</html>