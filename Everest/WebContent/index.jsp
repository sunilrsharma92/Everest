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
	<% 
	if((String)session.getAttribute("login") == null)
	{
		response.sendRedirect("Login.jsp");
	}
	%>
    <link  type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
    <link  type="text/css" rel="stylesheet" href=clockpicker/bootstrap-clockpicker.min.css" />
    
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="js/jqueryConfirm/jquery-confirm.css">
    <link rel="stylesheet" href="jqwidgets/css/jqx.base.css" type="text/css" />
    
    <link href="css/style.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="js/bootstrap/jquery.js"></script>
    
	
    </head>

<body>
	<div class="indexoverlay" style="margin-top: 17%;display:none;">
	<div id="loading-img"></div>
	</div>
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
                        <a class="dropdown-toggle" data-toggle="dropdown">Zones <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a onclick="loadPage('centralzone');">Central Zone</a>
                            </li>
                            <li>
                                <a onclick="loadPage('eastzone');">East Zone</a>
                            </li>
                            <li>
                                <a onclick="loadPage('westzone');">West Zone</a>
                            </li>
                            <li>
                                <a onclick="loadPage('northzone');">North Zone</a>
                            </li>
                            <li>
                                <a onclick="loadPage('southzone');">South Zone</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">Activities <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a onclick="loadPage('massmedia');">Mass Media</a>
                                
                            </li>
                            <li>
                                <a onclick="loadPage('shopdisplay');">Shop Display</a>
                            </li>
                            <li>
                                <a onclick="loadPage('directcentral');">Direct Central Pgm</a>
                            </li>
                            <li>
                                <a onclick="loadPage('schemes');">Schemes</a>
                            </li>
                            <li>
                                <a onclick="loadPage('other');">Others</a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                        <a onclick="loadPage('datatable');">DataTable</a>
                    </li>
                    <li>
                        <a onclick="loadPage('impact');">Impact</a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">Corporate Communication <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a>Product Brochures</a>
                            </li>
                            <li>
                                <a>Brand Manual</a>
                            </li>
                            <li>
                                <a>Latest Companies</a>
                            </li>
                            <li>
                                <a>Poster</a>
                            </li>
                            <li>
                                <a>Exibition</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">My Account<b class="caret"></b></a>
                        <ul class="dropdown-menu">
<!--                             <li> -->
<!--                                 <a onclick="loadPage('profile');">Profile</a> -->
<!--                             </li> -->
                            <li>
                                <a onclick="loadPage('addCampaign');">Add Campaign</a>
                            </li>
                            <li>
                                <a onclick="loadPage('viewCampaign');">View Campaign</a>
                            </li>
                            <li>
                                <a href="Login.jsp">Logout</a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                                <a onclick="loadPage('help');">Help</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

   
<!--    *************************************************************************************************** -->
   <div id="contentofIndexp1">	
   <div class="container" style="margin-top:15px;">
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="images/rsz_slide2 (1).jpg" >
        <h4 align="center">This is header</h4>
        <p align="center">This is paragraph with description</p>
      </div>

      <div class="item">
        <img src="images/rsz_slide4.jpg">
        <h4 align="center">Kolhapur</h4>
        <p align="center">Subdealer Conference</p>
      </div>
    
      <div class="item">
        <img src="images/rsz_slide3.jpg">
        <h4 align="center">This is header</h4>
        <p align="center">This is paragraph with description</p>
      </div>

      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" id="subHeadding" style="font-size: 23px; margin: 20px 0px 20px;">
                    Welcome to Everest Impact
                </h1>
            </div>
            <div id="content">
            
        </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Section -->
        <hr>
 </div>
   </div>
   <!--    *************************************************************************************************** -->
   
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

    <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="js/jquery.session.js"></script>
    <script type="text/javascript" src="js/json_parse.js"></script>
	<script type="text/javascript" src="js/json2.js"></script>
	<script type="text/javascript" src="js/jqueryConfirm/jquery-confirm.js"></script>
    
    <script type="text/javascript" src="jqwidgets/js/jqxcore.js"></script>
	<script type="text/javascript" src="jqwidgets/js/jqxdraw.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxchart.core.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxlistbox.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxmenu.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxgrid.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxgrid.filter.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxgrid.pager.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxgrid.selection.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxgrid.columnsresize.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxcalendar.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxcheckbox.js"></script>
	<script type="text/javascript" src="jqwidgets/js/jqxswitchbutton.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxdata.js"></script>
    
    <script type="text/javascript" src="jqwidgets/js/jqxdropdownbutton.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxcolorpicker.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxwindow.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxeditor.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxtooltip.js"></script>
    
    <script type="text/javascript" src="jqwidgets/js/jqxdata.export.js"></script>
    <script type="text/javascript" src="jqwidgets/js/jqxgrid.export.js"></script>
    
    <script type="text/javascript" src="jqwidgets/js/jqxgrid.sort.js"></script>
    <script type="text/javascript" src="jqwidgets/js/demos.js"></script>
    
    
	<script type="text/javascript" src="js/handleRequest.js"></script>
	<script type="text/javascript" src="js/handleResponse.js"></script>
	<script type="text/javascript" src="js/handleMessage.js"></script>
	<script type="text/javascript" src="js/callServlet.js"></script>
	<script type="text/javascript" src="js/custom.js"></script>
	<script type="text/javascript" src="js/ready.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="clockpicker/bootstrap-clockpicker.min.js"></script>
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>
