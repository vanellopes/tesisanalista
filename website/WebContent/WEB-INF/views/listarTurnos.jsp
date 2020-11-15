<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/DT_bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="../css/bootstrap-responsive.css" rel="stylesheet">
 <link href="css/style.css" rel="stylesheet" />
<script src="js/jquery-1.7.2.min.js" type="text/javascript"
	charset="utf-8"></script>
<link href="css/jquery-ui-1.8.20.custom.css" rel="stylesheet" />
<script src="js/jquery-ui-1.8.20.custom.min.js" type="text/javascript"
	charset="utf-8"></script>
<title>Veterinaria - Lista de Tareas asignadas</title>
</head>
<body> 

      <jsp:include page="menu.jsp"></jsp:include>
    
	 <div class="container" style="width: 1076px;">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
      
		<h2>Lista de Tareas asignadas</h2> <br />
		<form action="verRegistroTarea" method="get">
			<input type="submit" name="btnNuevo" id="btnNuevo" value="Nueva Tarea"   class="btn btn-success" />
			<a href="menuTurno.jsp" class="btn btn-success">Regresar al Menu</a>
		</form>
		<table cellpadding="0" cellspacing="0" border="0"  class="table table-striped table-bordered">
			<tr>
				<th>Fecha de la Tarea</th>
				<th>Codigo Turno</th>
				<th>Descripcion de la Tarea</th>
				<th>Doctor</th>
				<th>Cliente</th>
				<th>Direccion</th>
				<th>Telefono</th>
				<th>Paciente</th>
				<td>Editar</td>
				<td>Eliminar</td>

			</tr>
			
			<c:forEach items="${model.tareas}" var="prod" varStatus="i">
			<tr>
				<td width="100">${prod.fechaTurno}</td>
				<td>${prod.codigoTurno}</td>
				<td>${prod.descripcionTurno}</td>
				<td>${prod.doctorPaterno},${prod.nombreDoctor}</td>
				<td>${prod.apellidoPaterno},${prod.nombresPersona}</td>
				<td>${prod.direccion}</td>
				<td>${prod.telefono}</td>
				<td>${prod.codigoPaciente}</td>
				<td align="center"><a
						href="editarTarea.jsp?idTurno=${prod.codigoTurno}"> <img
							src="images/editar.jpg" alt="" title="" border="0" /></a></td>
				<td align="center"><a
						href="eliminarTarea.jsp?idTurno=${prod.codigoTurno}"><img
							src="images/delete.gif" alt="" title="" border="0" /></a></td>
			</tr>
			</c:forEach>
			
		</table>
		</div>
		 <footer>
        <p>&copy; InstantVet</p>
      </footer>
      </div>
	</body>
</html>