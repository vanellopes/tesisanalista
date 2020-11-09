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
	
<title>Veterinaria - Lista de Vacunas Programadas</title>
</head>
<body>

      <jsp:include page="menu.jsp"></jsp:include>
    
    <div class="container" style="width: 1076px;">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
       
	
		<h2>Lista de Vacunas Programada</h2> <br />
		<form action="verRegistroVacuna" method="get"> 
			<input type="submit" name="btnNuevo" id="btnNuevo" value="Nueva Vacuna" class="btn btn-success"/>
			<a href="menuCita.jsp" class="btn btn-success">Regresar al Menu</a>
		</form>
		<table cellpadding="0" cellspacing="0" border="0"  class="table table-striped table-bordered">
			<tr>
				<th>Programacion de la Vacuna</th>
				<th>Codigo Cita</th>
				<th>Nombre Vacuna</th>
				<th>Doctor</th>
				<th>Cliente</th>
				<th>Direccion</th>
				<th>Telefono</th>
				<th>Paciente</th>
				<th>Notas</th>
				<td>Editar</td>
				<td>Eliminar</td>

			</tr>
			
			<c:forEach items="${model.vacunas}" var="prod" varStatus="i">
			<tr>
				<td width="100">${prod.fechaCita}</td>
				<td>${prod.codigoCita}</td>
				<td>${prod.nombreVacuna}</td>
				<td>${prod.doctor},${prod.nombreDoctor}</td>
				<td>${prod.apellido},${prod.nombresPersona}</td>
				<td>${prod.direccion}</td>
				<td>${prod.telefono}</td>
				<td>${prod.codigoPaciente}</td>
				<td>${prod.descripcionCita}</td>
				<td align="center"><a
						href="editarVacuna.jsp?idCita=${prod.codigoCita}"> <img
							src="<%=request.getContextPath() %>/images/editar.jpg" alt="" title="" border="0" /></a></td>
				<td align="center"><a
						href="eliminarVacuna?idCita=${prod.codigoCita}"><img
							src="<%=request.getContextPath() %>/images/delete.gif" alt="" title="" border="0" /></a></td>
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