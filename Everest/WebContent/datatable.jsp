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
    
    
    
    <!--*************************************************************************************************************************  -->
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxdata.js"></script> 
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxdatatable.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="js/demos.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            
            // prepare the data
            var source =
            {
                dataType: "xml",
                dataFields: [
                     { name: 'Name', type: 'string' },
                     { name: 'Mobile No', type: 'number' },
                     { name: 'Date', type: 'date' },
                     { name: 'Email', type: 'string' },
                     { name: 'City', type: 'string' },
                     { name: 'State', type: 'sting' },
                     { name: 'Zone', type: 'string' },
                     { name: 'Category', type: 'string' },
                     { name: 'Address', type: 'string' }
                ], 
                url: '../sampledata/orderdetailsextended.xml',
                root: 'DATA',
                record: 'ROW'
            };
            var dataAdapter = new $.jqx.dataAdapter(source, {
                loadComplete: function () {
                    // data is loaded.
                }
            });
            // create jqxDataTable.
            $("#dataTable").jqxDataTable(
            {
                source: dataAdapter,
                pageable: true,
                altRows: true,
                filterable: true,
                height: 400,
                filterMode: 'advanced',
                width: 850,
                columns: [
                  { text: 'Name', cellsAlign: 'center', align: 'center', dataField: 'Name', width: 200 },
                  { text: 'Date', cellsAlign: 'center', align: 'center', dataField: 'Date', width: 200 },
                  { text: 'Zone', cellsAlign: 'center', align: 'center', dataField: 'Zone', width: 100 },
                  { text: 'Category', cellsAlign: 'center', align: 'center', dataField: 'Category', width: 200 },
                  { text: 'State', cellsAlign: 'center', align: 'center', dataField: 'State', width: 120 },
                  { text: 'City', cellsAlign: 'center', align: 'center', dataField: 'City',width: 120 }
                ]
            });
        });
    </script>	
    <!--**************************************************************************************************************************  -->
    
    
    
    
    
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
    

<!--*******************************************************************************************************************************  -->
<div class="container">
<div id="dataTable"></div></div>
<!--*******************************************************************************************************************************  -->

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
