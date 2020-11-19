<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>InstantVet | Busqueda de Clientes</title>
 <jsp:include page="head.jsp"></jsp:include>
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="../css/bootstrap-responsive.css" rel="stylesheet">
<script type="text/javascript" language="javascript">
	function seleccionarcliente(codigo,nombre,apellido,materno){
		window.opener.document.getElementById("hiddencliente").value=codigo;
		window.opener.document.getElementById("txtCliente").value=apellido + ',' + ' ' + nombre;
		window.close();
	}
</script>
</head>
<body>
	<div >
		<h1>Listado de Clientes</h1> <p>
		<form action="" method="get">
		</form>
		<table  cellpadding="0" cellspacing="0" border="0"  class="table table-striped table-bordered">
			<thead>
		    	<tr>
		            <th scope="col">Nombre y Apellido</th>
		            <th scope="col">Num Documento</th>
		            <th scope="col">Telefono</th>
		            <th scope="col">Seleccionar</th>
		        </tr>
	    	</thead>
	    	<tbody>
			<c:forEach items="${model.clientes}" var="prod" varStatus="i">
			<tr>
				<td width="150">${prod.apellido}, ${prod.nombre}</td>
				<td>${prod.numDocumento}</td>
				<td>${prod.telefono}</td>
				<td><a href="#" onclick='seleccionarcliente("${prod.codigo}","${prod.nombre}","${prod.apellido}","${prod.numDocumento}");'>Seleccionar</a></td>
			</tr>
			</c:forEach>
			</tbody>
			
		</table>
	</div>
	
</body>
</html>