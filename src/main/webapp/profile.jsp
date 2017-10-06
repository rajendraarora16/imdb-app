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
		String userJoinDate = (String)session.getAttribute("userJoinDate");
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
                                <p class="counter">Rajendra Arora</p>
                            	<span class="info-box-title">Joined on <%=userJoinDate%>.</span>
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
                    	    	<h2>Recently news posted by you:</h2>
                    	    </div>
                    	    <br />
                    	    <%
								try{
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = DriverManager.getConnection("your database connection");
				
									String sqlQuery = "SELECT * FROM newsArticle WHERE userEmail=? ORDER BY title ASC";
									PreparedStatement stmt = con.prepareStatement(sqlQuery);
									stmt.setString(1, userEmail);
									ResultSet rs = stmt.executeQuery();
				
									while(rs.next())
									{
										String newsURL = rs.getString("newsURL");
										String userNameDB = rs.getString("userName");
										String userEmailDB = rs.getString("userEmail");
										String title = rs.getString("title");
										String article = rs.getString("article");
										String articleDate = rs.getString("articleDate");
							%>
                    	    <div>
                    	    	<table>
                    	    		<tr>
                    	    			<td>
                    	    				<div>
                    	    					<h1 class="panel-title" style="color: rgb(19, 108, 178); font-size: 25px;"><a href="./News?sid=<%=newsURL%>"><%=title%></a></h1>
                    	    					<table>
                    	    						<tr>
                    	    							<td>
                    	    								<span class="info-box-title">Posted by you on <%=articleDate%>.</span>
                    	    							</td>
                    	    						</tr>
                    	    					</table>
                    	    				</div><br />
                    	    			</td>
                    	    		</tr>
                    	    	</table>	      	    
                    		</div>
                    		<%
									}
								}catch(Exception e){e.printStackTrace();}
                    	    %> 
                    	    <div>
                    	    	<p style="color:#B0B0B0;">No more news here.</p>
                    	    </div>
                    	    <br />
                    	    
                    	    <div>
                    	    	<div>
                    	    		<h2>Recently Biography posted by you:</h2>
                    	    	</div>
                    	    	<br />
                    	    	<%
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("your database connection");
					
					String sqlQuery = "SELECT * FROM Bio WHERE userEmail=?";
					PreparedStatement stmt = con.prepareStatement(sqlQuery);
					stmt.setString(1, userEmail);
					ResultSet rs = stmt.executeQuery();
					while(rs.next())
					{
						String bioURLDB = rs.getString("bioURL");
						String postedBy = rs.getString("userName");
						String userEmailDB = rs.getString("userEmail");
						String fullName = rs.getString("fullName");
						String imgURL = rs.getString("imgURL");
						String born = rs.getString("born");
						String residence = rs.getString("residence");
						String occupation = rs.getString("occupation");
						String yearsActive = rs.getString("yearsActive");
						String religion = rs.getString("religion");
						String relatives = rs.getString("relatives");
						String discription = rs.getString("discription");
			%>
                    	    	<div>
                    	    		<table>
                    	    			<tr>
                    	    				<td>
                    	    					<div>
                    	    						<h1 class="panel-title" style="color: rgb(19, 108, 178); font-size: 25px;"><a href="./Bio?sid=<%=bioURLDB%>"><%=fullName%></a></h1>
                    	    						<table>
                    	    							<tr>
                    	    								<td>
                    	    									<span class="info-box-title">Posted by you.</span>
                    	    								</td>
                    	    							</tr>
                    	    						</table>
                    	    					</div><br />
                    	    				</td>
                    	    			</tr>
                    	    		</table>	      	    
                    			</div>
                    			<%
					}
				}catch(Exception e){e.printStackTrace();}
			%>
			 <div>
             	<p style="color:#B0B0B0;">No more biography here.</p>
			 </div>
             <br />
             				<div>
                    	    	<div>
                    	    		<h2>Recently Movies posted by you:</h2>
                    	    	</div>
                    	    	<br />
                    	    	<%
									try{
										Class.forName("com.mysql.jdbc.Driver");
										Connection con = DriverManager.getConnection("your database connection");
					
										String sqlQuery = "SELECT * FROM movies WHERE userEmail=?";
										PreparedStatement stmt = con.prepareStatement(sqlQuery);
										stmt.setString(1, userEmail);
										ResultSet rs = stmt.executeQuery();
										while(rs.next())
										{
											String movieURLDB = rs.getString("movieURL");
											String postedBy = rs.getString("userName");
											String movieName = rs.getString("movieName");
								%>	
								<div>
                    	    		<table>
                    	    			<tr>
                    	    				<td>
                    	    					<div>
                    	    						<h1 class="panel-title" style="color: rgb(19, 108, 178); font-size: 25px;"><a href="./movieDetails?sid=<%=movieURLDB%>"><%=movieName%></a></h1>
                    	    						<table>
                    	    							<tr>
                    	    								<td>
                    	    									<span class="info-box-title">Posted by you.</span>
                    	    								</td>
                    	    							</tr>
                    	    						</table>
                    	    					</div><br />
                    	    				</td>
                    	    			</tr>
                    	    		</table>	      	    
                    			</div>
                    			<%
										}
									}catch(Exception e){e.printStackTrace();}
                    			%>
                    			<div>
             						<p style="color:#B0B0B0;">No more movies here.</p>
			 					</div>
             					<br />
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