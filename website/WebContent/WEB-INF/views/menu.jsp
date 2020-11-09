<div class="navbar navbar-fixed-top"> 
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
              <li><a href="listarcliente.jsp">nada aqui</a></li>
              <li><a href="listarcliente2.jsp">Clientes original</a></li>
              <ul class="nav">
                <li class="dropdown">
                    <a href="#"
                          class="dropdown-toggle"
                          data-toggle="dropdown">
                          Clientes list
                          <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a href="verRegistroVacuna">Crear cita para vacunación</a></li>
                      <li><a href="verRegistroTarea">Crear tarea en el calendario</a></li>
                      <li><a href="listarVacuna">Ver calendario con las vacunas programadas</a></li>
                      <li><a href="listarTarea">Ver calendario con las tareas asignadas</a></li>
                      <li><a href="verRegistroNombreVacuna">Registrar Nombre de Vacuna</a></li>
                      
                  </ul>
                  </li>
              </ul>
              <li><a href="listarpaciente.jsp">Pacientes</a></li>
      		  <li><a href="listardoctor.jsp">Veterinarios</a></li>
            <li><a href="listarfacturas.jsp">Facturacion</a></li>
            <li><a href="menuCita.jsp">Turnos menu</a></li>
	                		   <li>
					<ul class="nav">
					  <li class="dropdown">
						    <a href="#"
						          class="dropdown-toggle"
						          data-toggle="dropdown">
						          Turnos list
						          <b class="caret"></b>
						    </a>
						    <ul class="dropdown-menu">
						    	<li><a href="verRegistroVacuna">Crear cita para vacunación</a></li>
						    	<li><a href="verRegistroTarea">Crear tarea en el calendario</a></li>
						    	<li><a href="listarVacuna">Ver calendario con las vacunas programadas</a></li>
						    	<li><a href="listarTarea">Ver calendario con las tareas asignadas</a></li>
						    	<li><a href="verRegistroNombreVacuna">Registrar Nombre de Vacuna</a></li>
						      
							</ul>
  						</li>
					</ul>
	           
	           </li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
    </div>
</div>