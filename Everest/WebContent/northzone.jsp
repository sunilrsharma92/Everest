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

    <title>Everest Impact-North Zone</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="js/bootstrap/jquery.js"></script>
	
    <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="js/jqx/jqxcore.js"></script>
    <script type="text/javascript" src="js/jqx/jqxdata.js"></script>
    <script type="text/javascript" src="js/jqx/jqxdraw.js"></script>
    <script type="text/javascript" src="js/jqx/jqxchart.core.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // prepare chart data as an array
            var sampleData = [
                    { Day: 'W1', Enquiry: 1, Confirmed: 2, Ad_Campaign: 3 },
                    { Day: 'W2', Enquiry: 2, Confirmed: 2.5, Ad_Campaign: 0 },
                    { Day: 'W3', Enquiry: 3, Confirmed: 0, Ad_Campaign: 2.5 },
                    { Day: 'W4', Enquiry: 4, Confirmed: 2.5, Ad_Campaign: 4.5 },
                    { Day: 'W5', Enquiry: 5, Confirmed: 2.0, Ad_Campaign: 2.5 },
                    { Day: 'W6', Enquiry: 6, Confirmed: 0, Ad_Campaign: 3.0 },
                    { Day: 'W7', Enquiry: 7, Confirmed: 0, Ad_Campaign: 3.0 },
                    { Day: 'W8', Enquiry: 8, Confirmed: 0, Ad_Campaign: 3.0 },
                    { Day: 'W9', Enquiry: 9, Confirmed: 6.0, Ad_Campaign: 3.0 },
                    { Day: 'W10', Enquiry: 10, Confirmed: 0, Ad_Campaign: 3.0 },
                    { Day: 'W11', Enquiry: 3.0, Confirmed: 0, Ad_Campaign: 3.0 },
                    { Day: 'W12', Enquiry: 3.0, Confirmed: 0, Ad_Campaign: 3.0 },
                    { Day: 'W13', Enquiry: 3.0, Confirmed: 0, Ad_Campaign: 3.0 },
                    { Day: 'W14', Enquiry: 6.0, Confirmed: 4.5, Ad_Campaign: 0 }
                ];
            // prepare jqxChart settings
            var settings = {
                title: "Quaterly Ad Campaign citywise performance",
                description: "Time spent in vigorous exercise by activity",
                enableAnimations: true,
                showLegend: true,
                padding: { left: 5, top: 5, right: 5, bottom: 5 },
                titlePadding: { left: 90, top: 0, right: 0, bottom: 10 },
                source: sampleData,
                xAxis:
                    {
                        dataField: 'Day',
                        unitInterval: 1,
                        axisSize: 'auto',
                        tickMarks: {
                            visible: fa,
                            interval: 1,
                            color: '#BCBCBC'
                        },
                        gridLines: {
                            visible: false,
                            interval: 1,
                            color: '#BCBCBC'
                        }
                    },
                valueAxis:
                {
                    unitInterval: 1,
                    minValue: 0,
                    maxValue: 10,
                    title: { text: 'No of Ad Campaigns' },
                    labels: { horizontalAlignment: 'right' },
                    tickMarks: { color: '#BCBCBC' }
                },
                colorScheme: 'scheme06',
                seriesGroups:
                    [
                        {
                            type: 'stackedcolumn',
                            columnsGapPercent: 50,
                            seriesGapPercent: 0,
                            series: [
                                    { dataField: 'Enquiry', displayText: 'Enquiry' },
                                    { dataField: 'Confirmed', displayText: 'Confirmed' },
                                    { dataField: 'Ad_Campaign', displayText: 'Ad_Campaign' }
                                ]
                        }
                    ]
            };
            // setup the chart
            $('#chartContainer').jqxChart(settings);
        });
    </script>
    <style type="text/css">
    body{
    	height: auto;
    }
    .col-md-2{
    	width: ;
    	height: 50px;
    	/*background-color: red;
    	border: 2px solid #FFF;*/
    }
    img{
    	opacity: 0.5;
    }
    img:hover{
    	opacity: 1;
    }
    h5{
    	    margin-top: -55px;
    /* margin-left: 52px; */
    text-align: center;
    font-size: 30px;
    color: black;
    }

    </style>

</head>

<body class='default'>

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
                <a class="navbar-brand" href="index.html">
                    <img src="images/logo.jpg">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Zones <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="centralzone.html">Central Zone</a>
                            </li>
                            <li>
                                <a href="eastzone.html">East Zone</a>
                            </li>
                            <li>
                                <a href="westzone.html">West Zone</a>
                            </li>
                            <li>
                                <a href="northzone.html">North Zone</a>
                            </li>
                            <li>
                                <a href="southzone.html">South Zone</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Activities <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="activity.html">Mass Media</a>
                                
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
                        <a href="datatable.html">DataTable</a>
                    </li>
                    <li>
                        <a href="impact.html">Impact</a>
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
                                <a href="help.html">Help</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div class="container">
    	<div class="col-lg-12">
    		<h1 class="page-header">
    			North Zone - Everest Impact
    		</h1>
    		<ol class="breadcrumb">
    			<li><a href="index.html">Home</a>
    			</li>
    			<li class="active">North Zone</li>
    		</ol>

    	</div>
    	<div id='chartContainer' style="width:850px; height:500px;"/>

    	<div class="row">
    		
    			<h4>For more details.Click below </h4>
    			<div class="col-md-2">
    				<a href=""><img src="images/mumbai.jpg" width="100%" height="100px" >
    					<h5>Mumbai</h5></a>
   				</div><!--/col-md-2-->
       			
    		</div>
    	</div></div>

<div class="container">
	<footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Everest Impact 2015</p>
                    
                </div>
            </div>
        </footer>
</div><!--end of container-->
<div class="footer navbar-fixed-bottom" style="background-color:rgba(18, 106, 188, 0.71)">
    <img src="images/footimg.jpg">
    </div>
</body>

</html>