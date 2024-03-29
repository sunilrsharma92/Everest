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

    <title>Everest Impact-West Zone</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
                                <a href="activity.jsp">Mass Media</a>
                                
                            </li>
                            <li>
                                <a href="#">Shop Display</a>
                            </li>
                            <li>
                                <a href="#">Direct Central Pgm</a>
                            </li>
                            <li>
                                <a href="#">Schemes</a>
                            </li>
                            <li>
                                <a href="#">Others</a>
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
                                <a href="#">Profile</a>
                            </li>
                            <li>
                                <a href="#">Logout</a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                                <a href="help.jsp">Help</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Add New Activity
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a>
                    </li>
                    <li class="active">Activity</li>
                </ol>
            </div>
            </div>
        <!-- /.row -->
        <h4>Dealer meet at Mumbai</h4>
        <div class="row well" style="border:none;">
        
        <div class="col-md-6 ">

            <img src="https://placehold.it/350x150image">
            <span class="btn btn-default btn-file" style="width: 350px; border-radius: 0;">Browse <input type="file"></span>
        </div><!--/col-md-6-->  
        <div class="col-md-6 ">
            <p><strong><u>Pre-requiste:</u></strong></p>
            <textarea class="form-control" rows="8" id="comment"></textarea>
        </div><!--/col-md-6--> 
        </div>
        <div class="row well">
             <strong>Report about Meet:</strong>
             <textarea class="form-control" rows="8" id="comment"></textarea>
         </div><!--/row--> 
         <div class="row well">
         <div class="col-md-2">
             <strong>Upload images:</strong>
         </div><!--/col-md-3-->
          <div class="col-md-3">
             <span class="btn btn-default btn-file">Browse <input type="file"></span>
         </div><!--/col-md-3-->
         <div class="col-md-1">
             
         </div><!--/col-md-1-->

          <div class="col-md-2">
             <strong>Upload excel data:</strong>
         </div><!--/col-md-3--> 
         <div class="col-md-3">
             <span class="btn btn-default btn-file">Browse <input type="file"></span>
         </div><!--/col-md-3-->
             
             
             
         </div><!--/row--> 
        *On submitting the Branch Manage will get notified via email and sms.<input type="button" name="Submit" value="Submit Report">
        
        
</div>
                        
            </div>
</div>
        <!-- Portfolio Section -->

        <hr>
<div class="container">
    
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                   <p>Copyright &copy; Everest Impact 2015</p>
                    
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->
<div class="footer navbar-fixed-bottom" style="background-color:rgba(18, 106, 188, 0.71)">
    <img src="images/footimg.jpg">
    </div>
    <!-- jQuery -->
    <script src="js/bootstrap/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>
