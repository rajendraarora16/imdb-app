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
		String movieURL = request.getParameter("sid");
%>
<!DOCTYPE html>
<html>
    <head>        
        <!-- Title -->
        <title>Bollywood Movie details</title>
        
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
			
			<%
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("your database connection");
					
					String sqlQuery = "SELECT * FROM movies WHERE movieURL=?";
					PreparedStatement stmt = con.prepareStatement(sqlQuery);
					stmt.setString(1, movieURL);
					ResultSet rs = stmt.executeQuery();
					while(rs.next())
					{
						String movieURLDB = rs.getString("movieURL");
						String postedBy = rs.getString("userName");
						String postedByEmail = rs.getString("userEmail");
						String movieName = rs.getString("movieName");
						String imgURL = rs.getString("imgURL");
						String actName = rs.getString("actName");
						String releasingDate = rs.getString("releasingDate");
						String directorName = rs.getString("directorName");
						String producerName = rs.getString("producerName");
						String writerName = rs.getString("writerName");
						String screenplayName = rs.getString("screenplayName");
						String starringName = rs.getString("starringName");
						String musicName = rs.getString("musicName");
						String productionName = rs.getString("productionName");
						String distributorName = rs.getString("distributorName");
						String runningTime = rs.getString("runningTime");
						String country = rs.getString("country");
						String language = rs.getString("language");
						String budget = rs.getString("budget");
						String boxofficeName = rs.getString("boxofficeName");
						String discription = rs.getString("discription");
			%>
			
			<div id="main-wrapper" style="margin-left: 30px; width: 925px;">
            	<div class="row">
            		<div class="panel info-box panel-white">
                         <div class="panel-body">
                            <div class="info-box-stats">
                                <p class="counter"><%=movieName%></p>
                            	<span class="info-box-title">Posted by <%=postedBy%>.</span>
                            </div>
                            
                            <div class="info-box-progress">
                                <div style="border-bottom: 2px solid rgba(0, 0, 0, 0.09);" class="progress progress-xs progress-squared bs-n">
                                      <div>
                                      <!-- Should be empty -->
                                	  </div>
                            	</div>
                    	    </div>
                    	    <br /><br />
                    	    <div>
                    	    	<img src="<%=imgURL%>" style="height: 560px; width: 360px;" alt="" />
                    	    </div>
                    	    <br /><br />
                    	    <div>
                    	    	<h4><strong>Movie name:</strong> <%=movieName %></h4>
                    	    	<h4><strong>actors/Actress:</strong> <%=actName %></h4>
                    	    	<h4><strong>Release dates:</strong> <%=releasingDate %></h4>
                    	    	<h4><strong>Directed by:</strong> <%=directorName %></h4>
                    	    	<h4><strong>Produced by:</strong> <%=producerName %></h4>
                    	    	<h4><strong>Written by:</strong> <%=writerName %></h4>
                    	    	<h4><strong>Screenplay by:</strong> <%=screenplayName %></h4>
                    	    	<h4><strong>Music by:</strong> <%=musicName %></h4>
                    	    	<h4><strong>Production company:</strong> <%=productionName %></h4>
                    	    	<h4><strong>Distributed by:</strong> <%=distributorName %></h4>
                    	    	<h4><strong>Running time:</strong> <%=runningTime %></h4>
                    	    	<h4><strong>Country:</strong> <%=country %></h4>
                    	    	<h4><strong>Language:</strong> <%=language %></h4>
                    	    	<h4><strong>Budget:</strong> <%=budget %></h4>
                    	    	<h4><strong>Box office:</strong> <%=boxofficeName %></h4>
                    	    	<h4><strong>description:</strong> <%=discription %></h4>
                    	    	<br />
                    	    	<%
                    				if(userEmail.equals(postedByEmail))
                    				{
                    			%>
                    			<div>
                    				<table>
                    					<tr>
                    						<td>
                    							<form action="deleteMovies" method="post">
                    								<input type="hidden" value=<%=movieURLDB%> name="movieURLDB" />
                    								<input type="hidden" value=<%=postedByEmail%> name="postedByEmail" />
                    								<button style="border: 0px none rgb(245, 245, 245); height: 30px; padding: 5px;"><i class="fa fa-trash-o fa-lg"></i> Delete this Movie </button>
                    							</form>
                    						</td>
                    					</tr>
                    				</table>
                    			</div>
                    			<%
                    				}
                    			%>
                    	    </div>
                    	</div>
            		</div>
            	</div>
			</div>	
			
			<%
					}
				}catch(Exception e){e.printStackTrace();}
			%>
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
