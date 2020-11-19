<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<title>InstantVet | Mascotas</title>
    
</head>
<body>
	<div >
	<div class="container" style="width: 1300px;">
		<h1>Mascotas</h1> <p>
		<form action="" method="get">
		</form>
		<table  cellpadding="0" cellspacing="0" border="0"  class="table table-striped table-bordered">
			<thead>
		    	<tr>
		            <th scope="col">Nombre</th>
		            <th scope="col">Especie</th>
		            <th scope="col">Genero</th>
		            <th scope="col">Esterilizado</th>
		            <th scope="col">Peso</th>
		            <th scope="col">Fecha De NAc</th>
		            <th scope="col">Observaciones</th>
		        </tr>
	    	</thead>
	    	<tbody>
			<c:forEach items="${model.pacientes}" var="prod" varStatus="i">
			<tr>
				<td width="150">${prod.nombre}</td>
				<td>${prod.especie}</td>
				<td>${prod.genero=='H' ? 'Hembra' : 'Macho'}</td>
				<td>${prod.esterilizado}</td>
				<td>${prod.peso}</td>
				<td width="150">
			 		<fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${prod.fechaNacimiento}" pattern="dd/MM/yyyy"/></td>
				<td>${prod.observaciones}</td>
			</tr>
			</c:forEach>
			</tbody>			
		</table>
		<a href="listarcliente" class="btn btn-success">Volver</a>
	</div>
	</div>
	<jsp:include page="script.jsp"></jsp:include>
</body>
</html>