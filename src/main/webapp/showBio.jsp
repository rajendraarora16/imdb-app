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
		String bioURL = request.getParameter("sid");
%>
<!DOCTYPE html>
<html>
    <head>        
        <!-- Title -->
        <title>Bollywood Bio details</title>
        
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
					
					String sqlQuery = "SELECT * FROM Bio WHERE bioURL=?";
					PreparedStatement stmt = con.prepareStatement(sqlQuery);
					stmt.setString(1, bioURL);
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
			
			<div id="main-wrapper" style="margin-left: 30px; width: 925px;">
            	<div class="row">
            		<div class="panel info-box panel-white">
                         <div class="panel-body">
                            <div class="info-box-stats">
                                <p class="counter"><%=fullName%></p>
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
                    	    	<h4><strong>Full name:</strong> <%=fullName %></h4>
                    	    	<h4><strong>Born:</strong> <%=born %></h4>
                    	    	<h4><strong>Residence:</strong> <%=residence%></h4>
                    	    	<h4><strong>Occupation:</strong> <%=occupation %></h4>
                    	    	<h4><strong>Years active:</strong> <%=yearsActive%></h4>
                    	    	<h4><strong>Religion:</strong> <%=religion%></h4>
                    	    	<h4><strong>Relatives:</strong> <%=relatives%></h4>
                    	    	<h4><strong>Description:</strong> <%=discription%></h4>
                    	    	
                    	    	<br />
                    	    	<%
                    				if(userEmail.equals(userEmailDB))
                    				{
                    			%>
                    			<div>
                    				<table>
                    					<tr>
                    						<td>
                    							<form action="deleteBiography" method="post">
                    								<input type="hidden" value=<%=bioURLDB%> name="bioURLDB" />
                    								<input type="hidden" value=<%=userEmailDB%> name="userEmailArticle" />
                    								<button style="border: 0px none rgb(245, 245, 245); height: 30px; padding: 5px;"><i class="fa fa-trash-o fa-lg"></i> Delete this Bio </button>
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
