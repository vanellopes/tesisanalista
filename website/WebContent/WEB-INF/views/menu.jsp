<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>

</head>
<body>
<div class="navbar navbar-fixed-top bg-success" > 
    <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          
          <a class="brand" href="#">InstantVet</a>
           <div class="btn-group pull-right">
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
              <i class="icon-user"></i> ${sessionScope.username}
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li><a href="#">Profile</a></li>
              <li class="divider"></li>
              <li><a href="Login.jsp">Sign Out</a></li>
            </ul>
          </div>
          
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><a href="main.jsp">Inicio</a></li>
              <ul class="nav">
				  <li class="dropdown">
					    <a href="#"
					          class="dropdown-toggle"
					          data-toggle="dropdown">
					          Turnos
					          <b class="caret"></b>
					    </a>
					    <ul class="dropdown-menu">
					    	<li><a href="registroTurno">Registrar Turno</a></li>					    	
					    	<li><a href="listarTurnos">Ver Todos los Turnos</a></li>	
					    	<li><a href="listarTurnosVet">Ver Turnos Veterinaria</a></li>					    	
					    	<li><a href="listarTurnosPel">Ver Turnos Peluqueria</a></li>	
					      
						</ul>
				 </li>
				</ul>
				
              <ul class="nav">
                <li class="dropdown">
                    <a href="#"
                          class="dropdown-toggle"
                          data-toggle="dropdown">
                          Clientes/Mascotas
                          <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">                     
                      <li><a href="registroTurno">Nuevo Cliente</a></li>
                       <li><a href="listarcliente2.jsp">Listar Clientes</a></li>
                       <li><a href="registroTurno">Nueva Mascota</a></li>
                       <li><a href="listarcliente2.jsp">Listar Mascotas</a></li>
                       </ul>
                  </li>
              </ul>
              <ul class="nav">
				  <li class="dropdown">
					    <a href="#"
					          class="dropdown-toggle"
					          data-toggle="dropdown">
					          Personal
					          <b class="caret"></b>
					    </a>
					    <ul class="dropdown-menu">
					    	<li><a href="registroTurno">Nuevo Personal</a></li>
                      		 <li><a href="listarcliente2.jsp">Listar Personal</a></li>					      
						</ul>
				 </li>
				</ul> 
            </ul>
          </div><!--/.nav-collapse -->
        </div>
    </div>
</div>
</body>
</html>


