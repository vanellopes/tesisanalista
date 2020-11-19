<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="head.jsp"></jsp:include>    
	   
	<title>InstantVet | Lista de Turnos</title>
</head>
<body> 

    <jsp:include page="menu2.jsp"></jsp:include>
     <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <form action="registroTurno" method="get">
				<input type="submit" name="btnNuevo" id="btnNuevo" value="Nuevo Turno"   class="btn btn-success" />
				<a href="main.jsp" class="btn btn-success">Regresar al Inicio</a>
			</form>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
    <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Lista de Turnos</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
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
                  </thead>
                  <tbody>
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
                    
                  </tbody>
                 
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
     <footer>
        <p>&copy; InstantVet</p>
      </footer>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 
		
<jsp:include page="script.jsp"></jsp:include>
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