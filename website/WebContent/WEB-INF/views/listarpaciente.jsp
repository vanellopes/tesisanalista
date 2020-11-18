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


<link href="css/style.css" rel="stylesheet" />
<script src="js/jquery-1.7.2.min.js" type="text/javascript"
  charset="utf-8"></script>
<link href="css/jquery-ui-1.8.20.custom.css" rel="stylesheet" />
<script src="js/jquery-ui-1.8.20.custom.min.js" type="text/javascript"
  charset="utf-8"></script>
    
	<title>InstantVet | Lista de Pacientes</title>
</head>
	<body> 
	
      <jsp:include page="menu2.jsp"></jsp:include>

	
	   <div class="container" style="width: 1076px;">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
        <h2>Pacientes</h2> <p>
		<form action="verRegistroPaciente.jsp" method="get">
			<input type="submit" name="btnNuevo" id="btnNuevo" value="Nuevo Paciente" class="btn btn-primary btn-larg" />
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
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
					<td width="180">${prod.nombreCliente}</td>
					<td>${prod.nombre}</td>
					<td>${prod.fechaNacimiento}</td>
					<td>${prod.especie}</td>
					<td>${prod.genero}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
      </div>

      <footer>
        <p>&copy;  InstantVet </p>
      </footer>

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