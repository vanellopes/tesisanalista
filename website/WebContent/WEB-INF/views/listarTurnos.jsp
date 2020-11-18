<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.css" rel="stylesheet"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.js"></script>
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
<title>InstantVet | Lista de Turnos</title>
</head>
<body> 

      <jsp:include page="menu.jsp"></jsp:include>
    
	 <div class="container" style="width: 1300px;">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
      
		<h2>Lista de Turnos</h2> <br />
		<form action="registroTurno" method="get">
			<input type="submit" name="btnNuevo" id="btnNuevo" value="Nuevo Turno"   class="btn btn-success" />
			<a href="main.jsp" class="btn btn-success">Regresar al Inicio</a>
		</form>
		<table cellpadding="0" cellspacing="0" border="0"  class="table table-striped table-bordered">
			<tr>
				<th>Fecha y hora </th>
				<th>Area</th>
				<th>Cliente</th>
				<th>Paciente</th>
				<th>Telefono de contacto</th>	
				<th>Estado</th>			
				<th>Observaciones</th>
				<td>Confirmar</td>
				<td>Finalizar</td>
				<td>Cancelar</td>
				<td>Modificar</td>
			</tr>
			
			<c:forEach items="${model.turnos}" var="tur" varStatus="i">
			<tr>
			<td width="150">
			 <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${tur.fechaTurno}" pattern="dd/MM/yyyy, HH:mm"/></td>
				<td>${tur.tipoTurno=='V' ? 'Veterinaria' : 'Peluqueria'}</td>
				<td>${tur.nombreCliente}</td>
				<td>${tur.nombrePaciente}</td>
				<td>${tur.telefono}</td>
				<td>${tur.estadoTurno}</td>
				<td>${tur.observaciones}</td>	
				<td align="center"><a
						href="confirmarTurno?idTurno=${tur.codigoTurno}">
						<img src="../images/bootstrapIcons/check-circle-fill.svg" onclick="return confirmar();" alt="" title="" border="0" />
						</a></td>
				<td align="center"><a
						href="finalizarAtencionTurno?idTurno=${tur.codigoTurno}">
						<img src="../images/bootstrapIcons/check-circle-fill.svg" onclick="return confirmar();" alt="" title="" border="0"/>
						</a></td>
				<td align="center"><a
						href="cancelarTurno?idTurno=${tur.codigoTurno}">
						<img src="../images/bootstrapIcons/x-circle-fill.svg" onclick="return confirmar();" alt="" title="" border="0" /></a></td>
				<td align="center"><a
						href="editarTurno?idTurno=${tur.codigoTurno}"> 
						<img src="../images/bootstrapIcons/pencil-fill.svg" alt="" title="" border="0" /></a></td>						
			</tr>
			</c:forEach>
			
		</table>
		</div>
		 <footer>
        <p>&copy; InstantVet</p>
      </footer>
      </div>

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