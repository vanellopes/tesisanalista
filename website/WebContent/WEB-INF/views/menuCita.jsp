<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>InstantVet</title>
    
    <!-- Le styles -->
    <link href="../css/bootstrap.css" rel="stylesheet">
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
    
    
    
    <style type="text/css" media="screen">
            .slides_container {
                width:950px;
                height:463px;
            }
            .slides_container div {
                width:950px;
                height:463px;
                display:block;
            }
        </style>
    
  </head>
  <body>
    <div><jsp:include page="menu.jsp"></jsp:include> </div>
       
    
    <div class="container" style="width: 1076px;">
    <h1>Veterinaria - Citas de vacunas y tareas</h1> <p>
  </div>
   <div>
     <table>
                <tr>
					<td>
					  <form action="verRegistroVacuna" method="get">
			          <input type="submit" name="btnCrearCita" id="btnCrearCita" value="Crear cita para vacunaci�n" />
		              </form>
					</td>
				</tr>
				<tr>
					<td>
					  <form action="verRegistroTarea" method="get">
			          <input type="submit" name="btnCrearTarea" id="btnCrearTarea" value="Crear tarea en el calendario" />
		              </form>
					</td>
				</tr>
				<tr>
					<td>
					  <form action="listarVacuna" method="get">
			          <input type="submit" name="btnListarVacunas" id="btnListarVacunas" value="Ver calendario con las vacunas programadas" />
		              </form>
                    </td>
				</tr>
				<tr>
					<td>
					  <form action="listarTarea" method="get">
			          <input type="submit" name="btnListarTareas" id="btnListarTareas" value="Ver calendario con las tareas asignadas" />
		              </form>
					</td>
				</tr>
				<tr>
					<td>
					  <form action="verRegistroNombreVacuna" method="get">
			          <input type="submit" name="btnVacuna" id="btnVacuna" value="Registrar Nombre de Vacuna" />
		              </form>
					</td>
				</tr>
			</table>
			<a href="Menu.jsp">Retornar al Menu</a>
  </div>
</body>
</html>