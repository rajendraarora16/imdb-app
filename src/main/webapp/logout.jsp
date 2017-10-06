<%
session.setAttribute("userEmail", null);
session.invalidate();
%>
<!-- this application is built by Rajendra Arora for Tinyowl.-->
<!DOCTYPE html>
<html>
    <head>
        
        <!-- Title -->
        <title>Successfully logged out!</title>
        
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <meta charset="UTF-8">
        <meta name="description" content="IMDB" />
        <meta name="keywords" content="Imdb, dashboard" />
        <meta name="author" content="Rajendra arora" />
        
        <link href='https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href="./CSS/pace-theme-flash.css" rel="stylesheet"/>
        <link href="./CSS/uniform.default.min.css" rel="stylesheet"/>
        <link href="./CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/simple-line-icons.css" rel="stylesheet" type="text/css"/>	
        <link href="./CSS/waves.min.css" rel="stylesheet" type="text/css"/>	
        <link href="./CSS/switchery.min.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/style.css" rel="stylesheet" type="text/css"/>	
        
        <link href="./CSS/modern.min.css" rel="stylesheet" type="text/css"/>
        
        <script src="./JS/modernizr.js"></script>        
    </head>
     <body class="page-error">
        <main class="page-content">
            <div class="page-inner">
                <div id="main-wrapper">
                    <div class="row">
                        <div class="col-md-4 center">
                            <h1 class="text-xxl text-primary text-center">Logged out!</h1>
                            <div class="details">
                                <h3>you have successfully logged out your account, you can manage your account by <a href="login">login</a> again.</h3>
                                <p>You will be redirected to home page within 3 seconds, Or <a href="home">click</a> here for manually.</p>
                            </div>
                        </div>
                    </div><!-- Row -->
                </div><!-- Main Wrapper -->
            </div><!-- Page Inner -->
        </main><!-- Page Content -->
		<footer>
        	<jsp:include page="./footer.jsp"></jsp:include>
        </footer>
        <!-- Javascripts -->
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

