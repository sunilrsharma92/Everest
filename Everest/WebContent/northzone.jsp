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
    
    <div class="container">
    	<div class="col-lg-12">
    		<h1 class="page-header">
    			North Zone - Everest Impact
    		</h1>
    		<ol class="breadcrumb">
    			<li><a href="index.jsp">Home</a>
    			</li>
    			<li class="active">North Zone</li>
    		</ol>

    	</div>
    	<div id='chartContainer' style="width:850px; height:500px;"/>

    	<div class="row">
    		
    			<h4>For more details.Click below </h4>
    			<div class="col-md-2">
    				<a href="#"><img src="images/mumbai.jpg" width="100%" height="100px" >
    					<h5>Mumbai</h5></a>
   				</div><!--/col-md-2-->
       			
    		</div>
    	</div></div>

</body>

</html>
