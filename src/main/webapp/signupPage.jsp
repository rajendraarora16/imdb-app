<!DOCTYPE html>
<html>
    <head>
        
        <!-- Title -->
        <title>IMDB | Create account - Sign up!</title>
        
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
    <body class="page-register">
        <main class="page-content">
            <div class="page-inner">
                <div id="main-wrapper">
                    <div class="row">
                        <div class="col-md-3 center">
                            <div class="login-box">
                                <a href="index.html" class="logo-name text-lg text-center">Internet Movie Database</a>
                                <p class="text-center m-t-md">Create a IMDB's account</p>
                                <form class="m-t-md" action="registration" onsubmit="document.getElementById('submit').disabled=true;document.getElementById('submit').value='Please wait...';">
                                    <div class="form-group">
                                        <input type="text" name="name" class="form-control" placeholder="Name" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" name="email" class="form-control" placeholder="Email" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <input type="password" name="confirmPassword" class="form-control" placeholder="Password" required>
                                    </div>
                                   
                                    <input type="submit" class="btn btn-success btn-block m-t-xs" id="submit" value="Create my account" />
                                    <p class="text-center m-t-xs text-sm">Already have an account?</p>
                                    <a href="login" class="btn btn-default btn-block m-t-xs">Login</a>
                                </form>
                                <p class="text-center m-t-xs text-sm">2015 &copy; by Rajendra Arora.</p>
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
