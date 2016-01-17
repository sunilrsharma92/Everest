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
                    { Ads: 'Mass Media', Running: 10, Swimming: 10, Cycling: 25, Cyc: 25 },
                    { Ads: 'Shop Display', Running: 25, Swimming: 25 },
                    { Ads: 'Direct Central Pgm', Running: 30, Swimming: 10, Cycling: 20, Cyc: 20 },
                    { Ads: 'Schemes', Running: 30, Swimming: 20 },
                    { Ads: 'Other', Running: 10, Swimming: 20}
                    
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
                                    { dataField: 'Cyc', displayText: 'tv/cable',color :'red' },
                                    { dataField: 'Running', displayText: 'tv',color :'#B20000' },
                                    { dataField: 'Swimming', displayText: 'Shop', color :'#AF3535' },
                                    { dataField: 'Cycling', displayText: 'schene', color :'#BD8080'}
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
    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                    West Zone Everest Impact
                </h3>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a>
                    </li>
                    <li class="active">West Zone</li>
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
                <select class="form-control textbox"  placeholder="Filter By Zone">
										<option value="0">Filter By Zone</option>
										<option value="1">Central</option>
										<option value="2">East</option>
										<option value="3">West</option>
										<option value="4">North</option>
										<option value="5">South</option>
														
			</select>
            </div>
            </div><!--/col-md-3-->
            <div class="col-md-2">
                <div class="dropdown">
                    <select class="form-control textbox"  placeholder="Filter By City">
                    <option value="43">w1-Mumbai</option>
                    <option value="44">w2-Thane/Palghar</option>
                    <option value="45">w3-Raigad</option>
                    <option value="46">w4-Nasik/Ahmednagar</option>
                    <option value="47">w5-Pune/Solapur</option>
                    <option value="48">w6-kolapur/Satara</option>
                    <option value="49">w7-Aurangabad</option>
                    <option value="50">w8-Ratnagiri/Sindhudurg</option>
                    <option value="51">w9-Dhule/Jalgaon/Nandurbar</option>
                    <option value="52">w10-Valsad</option>
                    <option value="53">w11-Ahmedabad</option>
                    <option value="54">w12-Saurashtra</option>
                    <option value="55">w13-Surat</option>
                    <option value="56">w14-Baroda</option>
                    <option value="57">w15-Goa</option>
                    <option value="58">w16-Vidarbha</option>
                 </select>
            </div>
            </div><!--/col-md-3-->
            <div class="col-md-2">
                <input type="button" name="Submit" value="Submit">
            </div><!--/col-md-3-->
        </div><!--/row-->
      
                
            </div>

</body>

</html>
