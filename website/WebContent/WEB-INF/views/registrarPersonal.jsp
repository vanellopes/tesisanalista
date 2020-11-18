<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<title>Veterinaria - Mantenimiento de Personales ::.. Agregar nuevo Personal</title>


<script>
	/*$(function() {
		$( "#datepicker" ).datepicker({ autoSize: true });
	});
	*/
</script>


</head>
<body>

	<div class="center_content">
	<h3>Mantenimiento de Personales</h3>
	<form action="registrarPersonal.html" method="post">
		<table>
		
			<tr>
				<td>Nombre</td>
				<td><input name = "txtnombre"></td>
			</tr>
			<tr>
				<td>Ap. Paterno</td>
				<td><input name ="txtApellido"></td>
			</tr>
			<tr>
				<td>Ap. Materno</td>
				<td><input name ="txtApellidoMaterno"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input name ="txtEmail"></td>
			</tr>
			<tr>
				<td>Telefono</td>
				<td><input name ="txtTelefono"></td>
			</tr>
			<tr>
				<td>Usuario</td>
				<td><input name ="txtUsuario"></td>
			</tr>
			<tr>
			<td>Contrase�a</td>
				<td><input name ="txtPassword" type="password"></td>
			</tr>
		</table>
	</form>
	</div>
	<!-- end of center content -->
	<jsp:include page="script.jsp"></jsp:include>
</body>
</html>