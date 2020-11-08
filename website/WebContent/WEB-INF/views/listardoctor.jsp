<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <!DOCTYPE html >
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
 
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link href="css/style.css" rel="stylesheet" />
<script src="js/jquery-1.7.2.min.js" type="text/javascript"
	charset="utf-8"></script>
<link href="css/jquery-ui-1.8.20.custom.css" rel="stylesheet" />
<script src="js/jquery-ui-1.8.20.custom.min.js" type="text/javascript"
	charset="utf-8"></script>
	<title>Lista de Doctores</title>

</head>
	<body> 

      <jsp:include page="menu.jsp"></jsp:include>
	
	   <div class="container" style="width: 1076px;">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
		<h2>Doctores</h2> <p>
		<form action="verRegistroDoctor.jsp" method="get">
			<input type="submit" name="btnNuevo" id="btnNuevo" value="Nuevo" class="btn btn-primary btn-larg"/>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Apellido Paterno</th>
					<th>Apellido Materno</th>
					<th>Email</th>
					<th>Telefono</th>
					<th>Usuario</th>
					<th>Grupo</th>
					<td>Editar</td>
					<td>Eliminar</td>
	
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${model.doctores}" var="prod" varStatus="i">
				<tr>
					<td width="100">${prod.nombre}</td>	
					<td>${prod.paterno}</td>
					<td>${prod.materno}</td>
					<td>${prod.email}</td>
					<td>${prod.telefono}</td>
					<td>${prod.usuario}</td>
					<td>${prod.grupo}</td>			
					<td align="center"><a
							href="editarDoctor.jsp?doctorID=${prod.doctorID}"> <img
								src="/HelloWorldSpring3/images/editar.jpg" alt="" title="" border="0" />
						</a></td>
					<td align="center"><a
							href="eliminarDoctor.jsp?doctorID=${prod.doctorID}"><img
								src="/HelloWorldSpring3/images/delete.gif" alt="" title="" border="0" /></a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<footer>
        <p>&copy; InstantVet </p>
      </footer>

    </div> 
    
    
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" charset="utf-8" language="javascript" src="../js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8" language="javascript" src="../js/DT_bootstrap.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script language="javascript">

    $(function(){
        $('.row').each(function(){

    		$(this).find('.span6').first().css('width', '354px');
        });
    });
    
    </script>
		
	</body>
</html>