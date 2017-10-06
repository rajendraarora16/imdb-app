<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement"%>
   
<%
    if ((session.getAttribute("userEmail") == null) || (session.getAttribute("userEmail") == ""))
    {
%>  
<%
		response.sendRedirect("./error");
	}
    else
%>
<%
	{
		String userEmail = (String)session.getAttribute("userEmail");
		String userName = (String)session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- Title -->
        <title>Internet movies database | Dashboard</title>
        
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <meta charset="UTF-8">
        <meta name="description" content="Internet movies database" />
        <meta name="keywords" content="IMDB,dashboard" />
        <meta name="author" content="Rajendra arora" />
        
        <!-- Styles -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href="./CSS/pace-theme-flash.css" rel="stylesheet"/>
        <link href="./CSS/uniform.default.min.css" rel="stylesheet"/>
        <link href="./CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/simple-line-icons.css" rel="stylesheet" type="text/css"/>	
        <link href="./CSS/waves.min.css" rel="stylesheet" type="text/css"/>	
        <link href="./CSS/switchery.min.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/style.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/component.css" rel="stylesheet" type="text/css"/>	
        <link href="./CSS/weather-icons.min.css" rel="stylesheet" type="text/css"/>	
        <link href="./CSS/MetroJs.min.css" rel="stylesheet" type="text/css"/>	
        <link href="./CSS/toastr.min.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/custom.css" rel="stylesheet" type="text/css"/>	
        <link rel="stylesheet" href="./CSS/slider/ideal-image-slider.css">
    	<link rel="stylesheet" href="./CSS/slider/default.css">	
        	
        <!-- Theme Styles -->
        <link href="./CSS/modern.min.css" rel="stylesheet" type="text/css"/>
        
        <script src="./JS/modernizr.js"></script>
    </head>
    <body class="page-header-fixed compact-menu page-horizontal-bar">
        <div class="overlay"></div>
        
        	<!-- Menu items -->
        	<jsp:include page="./menuItems.jsp"></jsp:include>
        	
        	<div class="page-title">
        	<br /><br /><br />
            </div>
			
			
			<div id="main-wrapper" style="margin-left: 30px; width: 925px;">
            	<div class="row">
            		<div class="panel info-box panel-white">
                         <div class="panel-body">
                            <div class="info-box-stats">
                                <p class="counter">Add new Movie</p>
                            	<span class="info-box-title">Please share us new movie and its reviews</span>
                            </div>
                            
                            <div class="info-box-progress">
                                <div style="border-bottom: 2px solid rgba(0, 0, 0, 0.09);" class="progress progress-xs progress-squared bs-n">
                                      <div>
                                	  </div>
                            	</div>
                    	    </div>
                    	    <br />
                    	    <div>
                    	    	           
                    			<div class="col-md-3 center" style="width:100%;">
                            		<div class="login-box">
                                		<form class="m-t-md" action="addMoviesdb">
                                		    <input type="hidden" value=<%=userName%> name="userName" />
                                    		<input type="hidden" value=<%=userEmail%> name="userEmail" />
                                		    <div class="form-group">
                                    		    <input type="text" name="movieName" class="form-control" placeholder="Movie Name" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="imgURL" class="form-control" placeholder="Paste Poster URL image here" required>
                                        		<p class="text-center m-t-xs text-sm">Upload your poster image at <a href="http://www.imgur.com/" target="_blank">Imgur</a> and paste the url link here.</p>
                                    		</div>
                                    		
                                    		<div class="form-group">
                                        		<input type="text" name="actName" class="form-control" placeholder="Add actor/Actress name E.g: Salman khan, Shahrukh khan" required>
                                    		</div>
                                    		
                                    		<div class="form-group">
                                        		<input type="text" name="releasingDate" class="form-control" placeholder="Releasing date E.g: dd/MM/YYYY" required>
                                    		</div>
                                    		
                                    		<div class="form-group">
                                        		<input type="text" name="directorName" class="form-control" placeholder="Directed by" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="producerName" class="form-control" placeholder="Produced by" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="writerName" class="form-control" placeholder="Written by" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="screenplayName" class="form-control" placeholder="Screenplay by" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="starringName" class="form-control" placeholder="Starring" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="musicName" class="form-control" placeholder="Music by" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="productionName" class="form-control" placeholder="Production name" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="distributorName" class="form-control" placeholder="Distributed by" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="runningTime" class="form-control" placeholder="Running time" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="country" class="form-control" placeholder="Country" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="language" class="form-control" placeholder="Language" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="budget" class="form-control" placeholder="Budget" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<input type="text" name="boxofficeName" class="form-control" placeholder="Box office" required>
                                    		</div>
                                    		<div class="form-group">
                                        		<textarea name="discription" class="form-control" rows="3" cols="20" placeholder="Give us description of this Movie."></textarea>
                                    		</div>
                                    		
                                    		<button type="submit" class="btn btn-success btn-block">Publish this movie <i class="fa fa-paper-plane"></i></button>
                                		</form>
                            		</div>
                        		</div>    	           	    
                    		</div>
                    </div>
            	</div>
            </div>
		</div>	
		<footer>
        	<jsp:include page="./footer.jsp"></jsp:include>
        </footer>	
						
        <script src="./JS/jquery-2.1.4.min.js"></script>
        <script src="./JS/jquery-ui.min.js"></script>
        <script src="./JS/pace.min.js"></script>
        <script src="./JS/jquery.blockui.js"></script>
        <script src="./JS/bootstrap.min.js"></script>
        <script src="./JS/jquery.slimscroll.min.js"></script>
        <script src="./JS/switchery.min.js"></script>
        <script src="./JS/jquery.uniform.min.js"></script>
        <script src="./JS/classie.js"></script>
        <script src="./JS/waves.min.js"></script>
        <script src="./JS/modern.min.js"></script>
        
    </body>
</html>
<%
    }
%>