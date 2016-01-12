<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Everest Impact</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="js/bootstrap/jquery.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="js/jquery.session.js"></script>
	
    </head>

<body>

    <!-- Navigation -->
     <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">
                    <img src="images/logo.jpg">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Zones <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="centralzone.jsp">Central Zone</a>
                            </li>
                            <li>
                                <a href="eastzone.jsp">East Zone</a>
                            </li>
                            <li>
                                <a href="westzone.jsp">West Zone</a>
                            </li>
                            <li>
                                <a href="northzone.jsp">North Zone</a>
                            </li>
                            <li>
                                <a href="southzone.jsp">South Zone</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Activities <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="massmedia.jsp">Mass Media</a>
                                
                            </li>
                            <li>
                                <a href="shopdisplay.jsp">Shop Display</a>
                            </li>
                            <li>
                                <a href="directcentral.jsp">Direct Central Pgm</a>
                            </li>
                            <li>
                                <a href="schemes.jsp">Schemes</a>
                            </li>
                            <li>
                                <a href="other.jsp">Others</a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="datatable.jsp">DataTable</a>
                    </li>
                    <li>
                        <a href="impact.jsp">Impact</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Corporate Communication <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">Product Brochures</a>
                            </li>
                            <li>
                                <a href="#">Brand Manual</a>
                            </li>
                            <li>
                                <a href="#">Latest Companies</a>
                            </li>
                            <li>
                                <a href="#">Poster</a>
                            </li>
                            <li>
                                <a href="#">Exibition</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="profile.jsp">Profile</a>
                            </li>
                            <li>
                                <a href="addCampaign.jsp">Add Campaign</a>
                            </li>
                            <li>
                                <a href="viewCampaign.jsp">View Campaign</a>
                            </li>
                            <li>
                                <a href="#">Logout</a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                                <a href="help.html">Help</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

   
   
   <div id="content">	</div>
   
   
   <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                   <p>Copyright &copy; Everest Impact 2015</p>
                   
                </div>
            </div>
        </footer>

   
    <!-- /.container -->
    <div class="footer navbar-fixed-bottom" style="background-color:rgba(18, 106, 188, 0.71)">
    <img src="images/footimg.jpg">
    </div>

    
    <script type="text/javascript" src="js/json_parse.js"></script>
	<script type="text/javascript" src="js/json2.js"></script>
	<script type="text/javascript" src="js/jqueryConfirm/jquery-confirm.js"></script>
	<script type="text/javascript" src="js/handleRequest.js"></script>
	<script type="text/javascript" src="js/handleResponse.js"></script>
	<script type="text/javascript" src="js/handleMessage.js"></script>
	<script type="text/javascript" src="js/callServlet.js"></script>
	<script type="text/javascript" src="js/ready.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- Script to Activate the Carousel -->
    <script type="text/javascript" src="js/custom.js"></script>
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>
