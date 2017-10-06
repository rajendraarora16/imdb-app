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
		response.sendRedirect("./login");
	}
    else
%>
<%
	{
		String userEmail = (String)session.getAttribute("userEmail");
		String userName = (String)session.getAttribute("userName");
		String searchItem = request.getParameter("search");
%>
    
<!DOCTYPE html>
<html>
    <head>
        
        <!-- Title -->
        <title>Searching result at IMDB</title>
        
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
            		<%
						try{
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection("your database connection");
				
							String sqlQuery = "SELECT *, COUNT(*) AS numberOfRows FROM movies WHERE movieName LIKE ?";
							PreparedStatement stmt = con.prepareStatement(sqlQuery);
							stmt.setString(1, '%'+searchItem+'%');
							ResultSet rs = stmt.executeQuery();
					
							while(rs.next())
							{
								String movieURL = rs.getString("movieURL");
								String userNameDB = rs.getString("userName");
								String movieName = rs.getString("movieName");
								String searchNumber = rs.getString("numberOfRows");
								
								if(movieName == null || movieURL == null)
								{
									//Do nothing
								}
								else
					%>
                         <div class="panel-body">
                            <div class="info-box-stats">
                                <p class="counter">Search results <%=searchNumber%> found</p>
                            </div>
                            
                            <div class="info-box-progress">
                                <div style="border-bottom: 2px solid rgba(0, 0, 0, 0.09);" class="progress progress-xs progress-squared bs-n">
                                      <div>
                                      <!-- Should be empty -->
                                	  </div>
                            	</div>
                    	    </div>
                    	    <br />
                    	    <div>
    							<h3>
    								<a href="./movieDetails?sid=<%=movieURL%>"><%=movieName%></a>
    							</h3>                	    	      	
    							<span style="color:#B0B0B0;">Posted by <%=userNameDB%>.</span>    
                    		</div>
                    	</div>
                    	<%
								}
							}catch(Exception e){e.printStackTrace();}
						%>
						<br />
		                <p style="text-align: center;">No more result found!</p>
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
