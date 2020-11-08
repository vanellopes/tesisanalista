<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <!DOCTYPE html >
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
  <!-- Le styles -->
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/DT_bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="../css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
 
	<title>Lista de Clientes</title>
	
	<script type="text/javascript" >
	function confirmar(){
		if(confirm("Desea realizar esta acci�n?")){
			return true;
		}else{
			return false;
		}
	}
	</script>
	
</head>
	<body> 
	   
      <jsp:include page="menu.jsp"></jsp:include>
	
	   <div class="container" style="width: 1076px;">
<div>
			<H1><% if(request.getAttribute("mensaje")!=null){ %>
				<%= request.getAttribute("mensaje")%>
		<%	} %>
			</H1>
	</div>
      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
        <h2>Prospectos</h2>
              
		<form action="verRegistroCliente.jsp" method="get">
			<a class="btn btn-primary btn-larg" data-toggle="modal" href="#myModal" id="btnNew" flag="Prospecto">Nuevo</a>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
			<thead>	
				<tr>
					<th>Nombre</th>
					<th>Apellido Paterno</th>
					<th>Apellido Materno</th>
					<th>Direccion</th>
					<th>Telefono</th>
					<th>Editar</th>
					<th>Cliente</th>
					<td>Eliminar</td>
	
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${model.clientes}" var="prod" varStatus="i">
				<tr>
					<td width="100">${prod.nombre}</td>
					<td>${prod.apellidopaterno}</td>
					<td>${prod.apellidomaterno}</td>
					<td>${prod.direccion}</td>
					<td>${prod.telefono}</td>
					<td align="center"><a
							href="editarCliente.jsp?id=${prod.codigo}"> <img
								src="<%=request.getContextPath()%>/images/editar.jpg" alt="" title="" border="0" />
						</a></td>
					<td><a href="CambiarCliente.jsp?id=${prod.codigo }" onclick="return confirmar();">Actualizar</a>
					</td>
					<td align="center"><a
							href="eliminarCliente.jsp?id=${prod.codigo}"><img
								src="<%=request.getContextPath()%>/images/delete.gif" alt="" title="" border="0" onclick="return confirmar();" /></a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
      </div>

      <footer>
        <p>&copy;  InstantVet </p>
      </footer>
      
      
      <div class="modal hide" id="myModal">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal">�</button>
	    <h3>Ingresar Nuevo Prospecto</h3>
	  </div>
	  <div class="modal-body">
	    <p>Loading...</p>
	  </div>
	  <div class="modal-footer">
	    <!-- 
	    <a href="#" class="btn" data-dismiss="modal">Close</a>
	    <a href="#" class="btn btn-primary">Save changes</a>
	     -->
	  </div>
      
      

    </div> 
    
    
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" charset="utf-8" language="javascript" src="../js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8" language="javascript" src="../js/DT_bootstrap.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jas-script.js"></script>
	
	</body>
</html>