<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <jsp:include page="head.jsp"></jsp:include>
    <title>InstantVet</title>
    <style type="text/css" media="screen"> 
            .slides_container {
                width:950px; 
                height:463px;
           }
           .slides_container div{                 
           width:950px; 
               height:463px; 
                display:block; 
           } 
       </style>
  </head>
  <body>
    <div><jsp:include page="menu2.jsp"/> </div>
  
     	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">  
    
    <div class="container" style="width: 1076px;">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
        <h2>SV Veterinaria</h2>
      
        <div id="slides">
            <div class="slides_container">
                <div>
                    <img src="../images/nuevas/1.jpg">
                </div>
                <div>
                    <img src="../images/nuevas/2.jpg">
                </div>
                <div>
                    <img src="../images/nuevas/3.jpg">
                </div>
            </div>
        </div>
      </div>

      <footer>
        <p>&copy; InstantVet</p>
      </footer>
	 <!-- Control Sidebar -->
	  <aside class="control-sidebar control-sidebar-dark">
	    <!-- Control sidebar content goes here -->
	  </aside>
	  <!-- /.control-sidebar -->
    </div> 
    </div>
    <jsp:include page="script.jsp"></jsp:include>

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../js/slides.min.jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script language="javascript">

    $(function(){
        $("#slides").slides({
        	play: 5000,			

        });
    });
    
    </script>
    
    
  </body>
</html>