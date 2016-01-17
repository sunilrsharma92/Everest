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
            
              var data = $.session.get("zonedetails");
            
            var zonedetails = JSON.parse(data);
            var sampleData = [];
            
            var 		tvcable = 0;
            var 		radiofm = 0;
            var 		newspapers = 0;
            var 		wallpaintings = 0;
            
            var 		dealerboards = 0;
            var 		pop = 0;
            
            var 		ctp = 0;
            var 		dealermeets = 0;
            var 		vancampaign = 0;
            var       mandimelas = 0;
            
            var 		stocklist = 0;
            var 		subdealers = 0;
            
            var 		giveaways = 0;
            var 		misc = 0;
            
            for(var i in zonedetails)
            {
	            var 		key = zonedetails[i].key;
	            var 		state = zonedetails[i].state;
	            var       city = zonedetails[i].city;
	            var 		importdate = zonedetails[i].importdate;
	            var 		importtime = zonedetails[i].importtime;
	            var 		total = zonedetails[i].total;
// 	            MassMedia
	            tvcable = tvcable + parseInt(zonedetails[i].tvcable);
	            radiofm = radiofm + parseInt(zonedetails[i].radiofm);
	            newspapers = newspapers + parseInt(zonedetails[i].newspapers);
	            wallpaintings = wallpaintings + parseInt(zonedetails[i].wallpaintings);
	            
// 	            ShopDisplay
	            dealerboards = dealerboards + parseInt(zonedetails[i].dealerboards);
	            pop = pop + parseInt(zonedetails[i].pop);
	            
// 	            Direct Central Program
	            ctp = ctp + parseInt(zonedetails[i].ctp);
	            dealermeets = dealermeets + parseInt(zonedetails[i].dealermeets);
	            vancampaign = vancampaign + parseInt(zonedetails[i].vancampaign);
	            mandimelas = mandimelas + parseInt(zonedetails[i].mandimelas);
	            
// 	            Schemes
	            stocklist = stocklist + parseInt(zonedetails[i].stocklist);
	            subdealers = subdealers + parseInt(zonedetails[i].subdealers);
	            
// 	            Others
	            giveaways = giveaways + parseInt(zonedetails[i].giveaways);
	            misc = misc + parseInt(zonedetails[i].misc);
            	
//             sampleData.push(
//             	{ Ads: 'Mass Media', tvcable: tvcable, radiofm: radiofm, newspapers: newspapers, wallpaintings: wallpaintings },
//                 { Ads: 'Shop Display', dealerboards: dealerboards, pop: pop },
//                 { Ads: 'Direct Central Pgm', ctp: ctp, dealermeets: dealermeets, vancampaign: vancampaign, mandimelas: mandimelas },
//                 { Ads: 'Schemes', stocklist: stocklist, subdealers: subdealers },
//                 { Ads: 'Other', giveaways: giveaways, misc: misc}
//             );
            
			 }
            
            console.log("sampleData : "+sampleData);
            console.log("\n tvcable  : "+tvcable+"\n radiofm :  "+radiofm+"\n newspapers  : "+newspapers+"\n wallpaintings :  "+wallpaintings+
            					"\n dealerboards  : "+dealerboards+"\n pop :  "+pop+
            					"\n ctp : "+ctp+"\n dealermeets :  "+dealermeets+"\n vancampaign  : "+vancampaign+"\n mandimelas :  "+mandimelas+
            					"\n giveaways : "+giveaways+"\n misc :  "+misc);
            sampleData = [
                          
										{ Ads: 'Mass Media', tvcable: tvcable, radiofm: radiofm, newspapers: newspapers, wallpaintings: wallpaintings },
										{ Ads: 'Shop Display', dealerboards: dealerboards, pop: pop },
										{ Ads: 'Direct Central Pgm', ctp: ctp, dealermeets: dealermeets, vancampaign: vancampaign, mandimelas: mandimelas },
										{ Ads: 'Schemes', stocklist: stocklist, subdealers: subdealers },
										{ Ads: 'Other', giveaways: giveaways, misc: misc}

//                     { Ads: 'Mass Media', Running: tvcable, Swimming: radiofm, Cycling: newspapers, Cyc: wallpaintings },
//                     { Ads: 'Shop Display', Running: dealerboards, Swimming: pop },
//                     { Ads: 'Direct Central Pgm', Running: ctp, Swimming: dealermeets, Cycling: vancampaign, Cyc: mandimelas },
//                     { Ads: 'Schemes', Running: stocklist, Swimming: subdealers },
//                     { Ads: 'Other', Running: giveaways, Swimming: misc}
                    
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
//                     unitInterval: 10,
                    minValue: 0,
//                     maxValue: 100,
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
                                    { dataField: 'tvcable', displayText: 'Tv/Cable',color :'red' },
                                    { dataField: 'radiofm', displayText: 'Radio-Fm',color :'#B20000' },
                                    { dataField: 'newspapers', displayText: 'News Paper', color :'#AF3535' },
                                    { dataField: 'wallpaintings', displayText: 'Wall Paintings', color :'#BD8080'},
                                    
                                    { dataField: 'dealerboards', displayText: 'Dealer Boards',color :'red' },
                                    { dataField: 'pop', displayText: 'POP"s',color :'#B20000' },
                                    
                                    { dataField: 'ctp', displayText: 'CTP',color :'red' },
                                    { dataField: 'dealermeets', displayText: 'Dealer Meets',color :'#B20000' },
                                    { dataField: 'vancampaign', displayText: 'Van Campaign', color :'#AF3535' },
                                    { dataField: 'mandimelas', displayText: 'Mandi Melas', color :'#BD8080'},
                                    
                                    { dataField: 'stocklist', displayText: 'StockList', color :'#AF3535' },
                                    { dataField: 'subdealers', displayText: 'Sub Dealers', color :'#BD8080'},
                                    
                                    { dataField: 'giveaways', displayText: 'Give Aways', color :'#AF3535' },
                                    { dataField: 'misc', displayText: 'Misc', color :'#BD8080'}
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
                <h1 class="page-header">
                    West Zone Everest Impact
                </h1>
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
                    <option value="0">Filter By City</option>
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
