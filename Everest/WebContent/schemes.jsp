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
    <script type="text/javascript">
        $(document).ready(function () {
            // prepare chart data as an array
            var sampleData = [
                    { Ads: 'W1', Running: 10, Swimming: 10, Cycling: 25, Cyc: 25 },
                    { Ads: 'W2', Running: 25, Swimming: 25, Cycling: 25, Cyc: 25 },
                    { Ads: 'W3', Running: 30, Swimming: 10, Cycling: 20, Cyc: 20 },
                    { Ads: 'W4', Running: 30, Swimming: 20, Cycling: 25, Cyc: 5 },
                    { Ads: 'W5', Running: 30, Swimming: 20, Cycling: 5, Cyc: 2 },
                    { Ads: 'W6', Running: 30, Swimming: 20, Cycling: 15, Cyc: 15 },
                    { Ads: 'W7', Running: 30, Swimming: 20, Cycling: 2, Cyc: 20 },
                    { Ads: 'W8', Running: 30, Swimming: 20, Cycling: 5, Cyc: 05 },
                    { Ads: 'W9', Running: 30, Swimming: 20 , Cycling: 21, Cyc: 6},
                    { Ads: 'W10', Running: 30, Swimming: 20, Cycling: 18, Cyc: 2 },
                    { Ads: 'W11', Running: 30, Swimming: 20, Cycling: 15, Cyc: 5 },
                    { Ads: 'W12', Running: 30, Swimming: 20, Cycling: 22, Cyc: 22 },
                    { Ads: 'W13', Running: 30, Swimming: 20, Cycling: 6, Cyc: 21 },
                    { Ads: 'W14', Running: 30, Swimming: 20, Cycling: 5, Cyc: 18 },
                    { Ads: 'W15', Running: 30, Swimming: 20, Cycling: 5, Cyc: 22 },
                    { Ads: 'W16', Running: 10, Swimming: 20, Cycling: 25, Cyc: 25}
                    
                ];
            // prepare jqxChart settings
            var settings = {
                title: "Upto till Date Overview",
                description: "Overview of Activities",
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
                            visible: false,
                            interval: 1,
                            color: '#BCBCBC'
                        }
                    },
                valueAxis:
                {
                    unitInterval: 10,
                    minValue: 0,
                    maxValue: 100,
                    title: { text: 'Investments(in lacs)' },
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
                                    { dataField: 'Cyc', displayText: 'TV/Cable',color :'red' },
                                    { dataField: 'Running', displayText: 'Radio/FM',color :'#B20000' },
                                    { dataField: 'Swimming', displayText: 'Newspaper', color :'#AF3535' },
                                    { dataField: 'Cycling', displayText: 'Wall Painting', color :'#BD8080'}
                                ]
                        }
                    ]
            };
            // setup the chart
            $('#chartContainer').jqxChart(settings);
        });
    </script>

    
</head>

<body>

   

<!--*********************************************************************************************************************************  -->
 <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                   Overview of Schemes
                </h3>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a>
                    </li>
                    <li class="active">Schemes</li>
                </ol>
            </div>
            </div>
        <!-- /.row -->
<div class="container">
	
	<div id='chartContainer' style="width:100%; height:500px"/>

</div>




<!--***********************************************************************************************************************************  -->
      </body>
</html>