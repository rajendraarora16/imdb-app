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
        
        <!-- Editor -->
        <link rel="stylesheet" type="text/css" href="./CSS/wmd.css" />
		<link rel="stylesheet" type="text/css" href="./CSS/style_editor.css" />
		<script type="text/javascript" src="./JS/showdown.js"></script>
        
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
                                <p class="counter">What's going on you think?</p>
                            	<span class="info-box-title">Share your bollywood stories with us..</span>
                            </div>
                            
                            <div class="info-box-progress">
                                <div style="border-bottom: 2px solid rgba(0, 0, 0, 0.09);" class="progress progress-xs progress-squared bs-n">
                                      <div>
                                      	
                                	  </div>
                            	</div>
                    	    </div>
                    	    <br />
                    	    <div>
                    	    	<br />
                    	    	<table>
                    	    		<tr>
                    	    			<td>
                    	    				<div>
                    	    					<form action="addNewsArticle" method="post">
                    	    						<!-- Title.. -->
													<div>
														<input type="text" name="newsTitle" style="width: 100%; border:1px solid #A9A9A9;" placeholder="Add your story title.." required="required"/>
													</div>    
													<br />                	    					
                    	    						<!-- Tell us in briefly here.. -->
													<div>
        												<div id="wmd-editor" class="wmd-panel">
															<div id="wmd-button-bar"></div>
															<textarea id="wmd-input" name="content" style="width: 100%;"></textarea>
														</div>
		
														<div id="wmd-preview" class="wmd-panel"></div><br><br>
														<script type="text/javascript" src="./JS/wmd.js"></script>
													</div>
													<input type="hidden" value=<%=userName%> name="userName" />
													<input type="hidden" value=<%=userEmail%> name="userEmail" />
    												<br><br><button style="border: 0px none rgb(245, 245, 245); height: 30px; padding: 5px;">Post my story <i class="fa fa-paper-plane"></i></button>
                    	    					</form>
                    	    				</div>
                    	    			</td>
                    	    		</tr>
                    	    	</table>
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