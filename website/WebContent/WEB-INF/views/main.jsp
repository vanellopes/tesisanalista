<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>InstantVet</title>
    <jsp:include page="include.jsp" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
<!--     Le styles -->
   <link href="../css/bootstrap.css" rel="stylesheet">
    <style type="text/css"> 
      body { 
         padding-top: 60px; 
       padding-bottom: 40px; 
     } 
     </style> 
<    <link href="../css/bootstrap-responsive.css" rel="stylesheet">

<!--     Le HTML5 shim, for IE6-8 support of HTML5 elements --> 
<!--      [if lt IE 9]> -->
<!-- <      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> --> 
<!--      <![endif] --> 
    
    
    
    <style type="text/css" media="screen"> 
            .slides_container {
                width:950px; 
                height:463px;
           }
           .slides_container div                 
           width:950px; 
               height:463px; 
                display:block; 
           } 
       </style>
    
  </head>
  <body>
    <div><jsp:include page="menu.jsp"/> </div>
       
    
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
        
        
        
        <p><a class="btn btn-primary btn-large">Learn more &raquo;</a></p>
      </div>

      <footer>
        <p>&copy; InstantVet</p>
      </footer>

    </div> 
    

    
    
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