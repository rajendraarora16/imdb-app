<!-- This application is made by Rajendra Arora. Visit here: http://about.me/rajendraarora16 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement"%>    
<%
    if (!(session.getAttribute("userEmail") == null) || (session.getAttribute("userEmail") == "")) 
    {
    	response.sendRedirect("./index");
%>
<%
	}
    else
%>
<%
	{
%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- Title -->
        <title>Internet movies database</title>
        
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
        	<div class="navbar">
				<table>
    				<tr>
    					<td>
        					<div class="navbar-inner container" style="width: 195px;">
            					<div class="logo-box">
                   					<a href="index" class="logo-text"><span>IMDB </span></a>
            					</div>
            				</div>
            			</td>
            			<td>
            				<form action="search" method="post">
            					<div>
            						<table>
            							<tr>
            								<td>
            									<div>
            										<input type="text" style="width: 338px; height: 30px; padding: 5px; border: 1px solid rgb(245, 245, 245);" name="search" placeholder="Search Actors, Actress and Movies.." />
            									</div>
            								</td>
            								<td>
            									<div>
            										<button style="border: 0px none rgb(245, 245, 245); height: 30px; padding: 5px; width: 35px;"><i class="fa fa-search"></i></button>
            									</div>
            								</td>
            							</tr>
            						</table>           					
								</div>
            				</form>
            			</td>
            			<td>
            				<div style="margin-left: 110px; font-size: 20px; margin-top: 22px;">
            					<p>Howdy, Stranger! Please <a href="login">Signin</a> or <a href="signup">Signup</a> Today.</p>
            				</div>
            			</td>
					</tr>
				</table>
			</div>
		    <!-- Menu item end! -->    	
        	
        	<div class="page-title">
        	<br /><br /><br />
                <div class="container">
            	</div>
            </div>
			
			
			<div id="main-wrapper" style="margin-left: 30px;">
            	<div class="row">
            		<div class="panel info-box panel-white">
                         <div class="panel-body">
                            <div class="info-box-stats">
                                <p class="counter">Top Bollywood Movies of the year</p>
                            	<span class="info-box-title">India's top 10 bollywood movies</span>
                            </div>
                            
                            <div class="info-box-progress">
                                <div style="border-bottom: 2px solid rgba(0, 0, 0, 0.09);" class="progress progress-xs progress-squared bs-n">
                                      <div>
                                	  </div>
                            	</div>
                    	    </div>
                    	    <br />
                    	    <div>
                    	    	 <div id="slider">
        							<a href="./movieDetails?sid=TAdcksZ0"><img src="https://i.ytimg.com/vi/AP3fjiUWZds/maxresdefault.jpg" alt=""></a>
        							<a href="./movieDetails?sid=Ziy5NLBU"><img data-src="http://www.mind-fresher.com/wp-content/uploads/2015/09/sing-is-bling.jpg" src="" alt=""></a>
        							<a href="./movieDetails?sid=oC3kuP9U"><img data-src="http://ssaritasiingh.com/wp-content/uploads/2015/08/704628974-Piku-Poster.jpg" src="" alt=""></a>
    								<a href="./movieDetails?sid=UNvDRK44"><img data-src="http://images.jagran.com/ShaandaarB_1308.jpg" src="" alt=""></a>
    							</div>
                    	    </div>   
                    	    <script src="./JS/ideal-image-slider.js"></script>
    						<!-- Create your slider -->
        					<script type="text/javascript">
    							var slider = new IdealImageSlider.Slider({
    								height: 400,
    	    						selector: '#slider',
    	    						interval: 2000,
    	    						effect: 'slide'
    							});
    							slider.start();
    						</script>
    						               	    
                    	</div>
                    </div>
            	</div>
            </div>
			
			
			<div id="main-wrapper" style="margin-left: 30px;">
            	<div class="row">
            		<div class="panel info-box panel-white">
                         <div class="panel-body">
                            <div class="info-box-stats">
                                <p class="counter">Bollywood Latest News</p>
                            	<span class="info-box-title">India top bollywood activity this month</span>
                            </div>
                            
                            <div class="info-box-progress">
                                <div class="progress progress-xs progress-squared bs-n">
                                      <div>
                                	  </div>
                            	</div>
                    	    </div>
                    	    <br/>
                    	    <div>
                    	    	<%
								try{
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = DriverManager.getConnection("your database connection");
				
									String sqlQuery = "SELECT * FROM newsArticle";
									PreparedStatement stmt = con.prepareStatement(sqlQuery);
									ResultSet rs = stmt.executeQuery();
				
									while(rs.next())
									{
										String newsURL = rs.getString("newsURL");
										String userName = rs.getString("userName");
										String userEmailDB = rs.getString("userEmail");
										String title = rs.getString("title");
										String article = rs.getString("article");
										String articleDate = rs.getString("articleDate");
								%>
                    	    	<table>
                    	    		<tr>
                    	    			<td>
                    	    				<div>
                    	    					<h1 class="panel-title" style="color: rgb(19, 108, 178); font-size: 25px;"><a href="./News?sid=<%=newsURL%>"><%=title%></a></h1>
                    	    					<table>
                    	    						<tr>
                    	    							<td>
                    	    								<span class="info-box-title">Posted by <%=userName %> on <%=articleDate%>.</span>
                    	    							</td>
                    	    						</tr>
                    	    					</table>
                    	    				</div><br />
                    	    			</td>
                    	    		</tr>
                    	    	</table>
                    	    	<%
									}
								}catch(Exception e){e.printStackTrace();}
                    	    	%> 
                    	    </div>
                    	</div>
                    </div>
            	</div>
            </div>
			
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
  
