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
		   
      <jsp:include page="menu.jsp"></jsp:include>
	
	<div>
			<H1><% if(request.getAttribute("mensaje")!=null){ %>
				<%= request.getAttribute("mensaje")%>
		<%	} %>
			</H1>
	</div>
	
	
	<div class="container" style="width: 1076px;">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
        <h2>Clientes</h2>
		<form action="verRegistroCliente.jsp" method="get">
			<a href="Menu.jsp">Menu</a>
			<div style="display:none"><a class="btn btn-primary btn-larg" data-toggle="modal" href="#myModal"  id="btnNew">Nuevo</a></div>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
		<thead>
		    	<tr>
		        	<th>Nombres</th>
		            <th>Apellidos</th>
		            <th>Num Documento</th>
		            <th>Direccion</th>
					<th>Telefono</th>
					<th>Editar</th>
					<th>Eliminar</th>
		        </tr>
	    	</thead>
	    	<tbody>
			<c:forEach items="${model.clientes}" var="prod" varStatus="i">
			<tr>
				<td width="100">${prod.nombre}</td>
				<td>${prod.apellido}</td>
				<td>${prod.numDocumento}</td>
				<td>${prod.direccion}</td>
				<td>${prod.telefono}</td>
				<td align="center"><a
						href="editarClienteC.jsp?id=${prod.codigo}"> <img
							src="<%=request.getContextPath()%>/images/editar.jpg" alt="" title="" border="0" onclick="return confirmar();" />
					</a></td>
				<td align="center"><a
						href="eliminarClienteC.jsp?id=${prod.codigo}"><img
							src="<%=request.getContextPath()%>/images/delete.gif" alt="" title="" border="0" onclick="return confirmar();" /></a>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		
		<footer>
        <p>&copy; InstantVet </p>
       </footer>
		
		
	<div class="modal hide" id="myModal">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal">�</button>
	    <h3>Modificar cliente/h3>
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
     <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jas-script.js"></script>
		
		
		
	</body>
</html>