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

    <link rel="stylesheet" href="js/jqx/jqx.base.css" type="text/css" />
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
                    { Ads: 'Mass Media', Running: 30, Swimming: 0, Cycling: 25 },
                    { Ads: 'Shop Display', Running: 25, Swimming: 25, Cycling: 0 },
                    { Ads: 'Direct Central Pgm', Running: 30, Swimming: 0, Cycling: 25 },
                    { Ads: 'Schemes', Running: 30, Swimming: 20, Cycling: 40 },
                    { Ads: 'Other', Running: 0, Swimming: 20, Cycling: 25 }
                    
                ];
            // prepare jqxChart settings
            var settings = {
                title: "Quaterly Overview",
                description: "Types of ads spent in vigorous exercise by activity",
                enableAnimations: true,
                showLegend: true,
                padding: { left: 5, top: 5, right: 5, bottom: 5 },
                titlePadding: { left: 90, top: 0, right: 0, bottom: 10 },
                source: sampleData,
                xAxis:
                    {
                        dataField: 'Ads',
                        unitInterval: 1,
                        axisSize: 'auto',
                        tickMarks: {
                            visible: true,
                            interval: 1,
                            color: '#B20000'
                        },
                        gridLines: {
                            visible: true,
                            interval: 1,
                            color: '#BCBCBC'
                        }
                    },
                valueAxis:
                {
                    unitInterval: 10,
                    minValue: 0,
                    maxValue: 100,
                    title: { text: 'Types of ads' },
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
                                    { dataField: 'Running', displayText: 'Running',color :'#B20000' },
                                    { dataField: 'Swimming', displayText: 'Swimming', color :'#AF3535' },
                                    { dataField: 'Cycling', displayText: 'Cycling', color :'#BD8080'}
                                ]
                        }
                    ]
            };
            // setup the chart
            $('#chartContainer').jqxChart(settings);
        });
    </script>
<style type="text/css">
    .col-md-2 img{
        opacity: 0.4;
    }
    .col-md-2 img:hover{
        opacity: 1;
    }
    .col-md-2 h5{
            margin-top: -70px;
    /* margin-left: 52px; */
    text-align: center;
    font-size: 20px;
    color: black;

    }
    .fix{
        width: 150px;
    }

</style>
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
                        <a href="gallery.jsp">DataTable</a>
                    </li>
                    <li>
                        <a href="contact.jsp">Impact</a>
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
                    West Zone-Mumbai Everest Impact
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a>
                    </li>
                    <li><a href="index.jsp">West Zone</a>
                    </li>
                    <li class="active">Mumbai</li>
                </ol>
            </div>
            </div>
        <!-- /.row -->



        <div class="row" style="margin-top:10px; margin-bottom:10px">
            <h4><strong>Total Performance</strong></h4>
            <div id='chartContainer' style="width:850px; height:500px"/>
        </div><!--/row-->
         <div class="row" style="margin:15px 0px 15px 0px;">
            <h5><strong> Filter Ad Campaign Details:</strong></h5>
            <div class="col-md-2">
                <div class="dropdown">
                  <button class="btn btn-default dropdown-toggle fix" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                  Select Activity
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="#">Mass Media</a></li>
                    <li><a href="#">Shop Display</a></li>
                    <li><a href="#">Direct Central pgm</a></li>
                    <li><a href="#">Schemes</a></li>
                    <li><a href="#">Others</a></li>
                </ul>
            </div>
            </div><!--/col-md-3-->
            <div class="col-md-2">
                <div class="dropdown">
                  <button class="btn btn-default dropdown-toggle fix" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                  Zone
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="#">Central</a></li>
                    <li><a href="#">East</a></li>
                    <li><a href="#">West</a></li>
                    <li><a href="#">North</a></li>
                   
                    <li><a href="#">South</a></li>
                </ul>
            </div>
            </div><!--/col-md-3-->
            <div class="col-md-2">
                <div class="dropdown">
                  <button class="btn btn-default dropdown-toggle fix" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                  City
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="#">w1-Mumbai</a></li>
                    <li><a href="#">w2-Thane/Palghar</a></li>
                    <li><a href="#">w3-Raigad</a></li>
                    <li><a href="#">w4-Nasik/Ahmednagar</a></li>
                    <li><a href="#">w5-Pune/Solapur</a></li>
                    <li><a href="#">w6</a></li>
                    <li><a href="#">w7-Aurangabad</a></li>
                    <li><a href="#">w8-Ratnagiri/Sindhudurg</a></li>
                    <li><a href="#">w9-Dhule/Jalgaon/Nandurbar</a></li>
                    <li><a href="#">w10-Valsad</a></li>
                    <li><a href="#">w11-Ahmedabad</a></li>
                    <li><a href="#">w12-Saurashtra</a></li>
                    <li><a href="#">w13-Surat</a></li>
                    <li><a href="#">w14-Baroda</a></li>
                    <li><a href="#">w15-</a></li>
                    <li><a href="#">w16-Vidarbha</a></li>
                    
                </ul>
            </div>
            </div><!--/col-md-3-->
            <div class="col-md-2">
                <input type="button" name="Submit" value="Submit">
            </div><!--/col-md-3-->
        </div><!--/row-->
        
                
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
<!--     <script src="js/bootstrap/jquery.js"></script> -->

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
