
var objhandleRequest = new handleRequest();

$(document).ready( function(){
	$('#content').load('indexp1.jsp');
	getZoneDetails("", 0, 0);
	
	$("#activitytype").change(function(){
		loadFilteredData();
	});
	
	$("#cityid").change(function(){
		loadFilteredData();
	});
});

function loadFilteredData()
{
//	alert("3");
	var zone = parseInt($.session.get("zone"));
	console.log("zone : "+zone);
	console.log("--> "+$.session.get("response"));
	var response = JSON.parse($.session.get("response"));
    if(zone == 1 || zone == "1")
    {
    	data = response.zoneDetails1;
    }
    else if(zone == 2 || zone == "2")
    {
    	data = response.zoneDetails2;
    }
    else if(zone == 3 || zone == "3")
    {
    	data = response.zoneDetails3;
    }
    else if(zone == 4 || zone == "4")
    {
    	data = response.zoneDetails4;
    }
    else if(zone == 5 || zone == "5")
    {
    	data = response.zoneDetails5;
    }
    
//    if(data != "" && data != undefined && data != null)
//    {
    var activitytype = $("#activitytype").val();
    var cityid = $("#cityid").val();
    
    var activityName = $('#activitytype option:selected').html()
    if(activitytype != 0)
    {
    	$("#activityFilter").empty();
        $("#activityFilter").append(activityName);
    }
    else
    {
    	$("#activityFilter").empty();
        $("#activityFilter").append("All Activity");
    }
    
    
    
    
    console.log("Data : "+JSON.stringify(data));
    var zonedetails = data;
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
    var 		cityName = "";
    for(var i in zonedetails)
    {
    	if(parseInt(zonedetails[i].city) == parseInt(cityid) && parseInt(zonedetails[i].zoneid) == parseInt(zone))
    	{
		        var 		key = zonedetails[i].key;
		        var 		zoneid = zonedetails[i].zoneid;
		        var 		reportid = zonedetails[i].reportid;
		        var 		state = zonedetails[i].state;
		        var       city = zonedetails[i].city;
		        var 		importdate = zonedetails[i].importdate;
		        var 		importtime = zonedetails[i].importtime;
		        var 		total = zonedetails[i].total;
		//         MassMedia
		        tvcable = parseInt(zonedetails[i].tvcable);
		        radiofm = parseInt(zonedetails[i].radiofm);
		        newspapers = parseInt(zonedetails[i].newspapers);
		        wallpaintings = parseInt(zonedetails[i].wallpaintings);
		        
		//         ShopDisplay
		        dealerboards = parseInt(zonedetails[i].dealerboards);
		        pop = parseInt(zonedetails[i].pop);
		        
		//         Direct Central Program
		        ctp = parseInt(zonedetails[i].ctp);
		        dealermeets = parseInt(zonedetails[i].dealermeets);
		        vancampaign = parseInt(zonedetails[i].vancampaign);
		        mandimelas = parseInt(zonedetails[i].mandimelas);
		        
		//         Schemes
		        stocklist = parseInt(zonedetails[i].stocklist);
		        subdealers = parseInt(zonedetails[i].subdealers);
		        
		//         Others
		        giveaways = parseInt(zonedetails[i].giveaways);
		        misc = parseInt(zonedetails[i].misc);
		        
		        switch(parseInt(city))
		        {
				       case  43 :
				       cityName = "w1-Mumbai"; break;
				       case  44 :
				       cityName = "w2-Thane/Palghar"; break;
				       case  45 :
				       cityName = "w3-Raigad"; break;
				       case  46 :
				       cityName = "w4-Nasik/Ahmednagar"; break;
				       case  47 :
				       cityName = "w5-Pune/Solapur"; break;
				       case  48 :
				       cityName = "w6-kolapur/Satara"; break;
				       case  49 :
				       cityName = "w7-Aurangabad"; break;
				       case  50 :
				       cityName = "w8-Ratnagiri/Sindhudurg"; break;
				       case  51 :
				       cityName = "w9-Dhule/Jalgaon/Nandurbar"; break;
				       case  52 :
				       cityName = "w10-Valsad"; break;
				       case  53 :
				       cityName = "w11-Ahmedabad"; break;
				       case  54 :
				       cityName = "w12-Saurashtra"; break;
				       case  55 :
				       cityName = "w13-Surat"; break;
				       case  56 :
				       cityName = "w14-Baroda"; break;
				       case  57 :
				       cityName = "w15-Goa"; break;
				       case  58 :
				       cityName = "w16-Vidarbha"; break;
		        }
		        sampleData.push(
//		                          { Ads: cityName, tvcable: tvcable, radiofm: radiofm, newspapers: newspapers, wallpaintings: wallpaintings, dealerboards: dealerboards, pop: pop, ctp: ctp, dealermeets: dealermeets, vancampaign: vancampaign, mandimelas: mandimelas, giveaways: giveaways, misc: misc}
		                          { Ads: "Tv/Cable", tvcable: tvcable}, 
		                          { Ads: "Radio-Fm", radiofm: radiofm}, 
		                          { Ads: "News Papers", newspapers: newspapers}, 
		                          { Ads: "Wall Paintings", wallpaintings: wallpaintings}, 
		                          { Ads: "Dealer Boards", dealerboards: dealerboards}, 
		                          { Ads: "POPs", pop: pop}, 
		                          { Ads: "CTP", ctp: ctp}, 
		                          { Ads: "Dealer Meets", dealermeets: dealermeets}, 
		                          { Ads: "Van Campaign", vancampaign: vancampaign}, 
		                          { Ads: "Mandi Melas", mandimelas: mandimelas}, 
		                          { Ads: "Give Aways", giveaways: giveaways}, 
		                          { Ads: "Misc", misc: misc}
		                          );
    	}
	}
//    
//    //sampleData = [
//                      { Ads: 'W1', Running: 10, Swimming: 10, Cycling: 25, Cyc: 25 },
//                      { Ads: 'W2', Running: 25, Swimming: 25, Cycling: 25, Cyc: 25 },
//                      { Ads: 'W3', Running: 30, Swimming: 10, Cycling: 20, Cyc: 20 },
//                      { Ads: 'W4', Running: 30, Swimming: 20, Cycling: 25, Cyc: 5 },
//                      { Ads: 'W5', Running: 30, Swimming: 20, Cycling: 5, Cyc: 2 },
//                      { Ads: 'W6', Running: 30, Swimming: 20, Cycling: 15, Cyc: 15 },
//                      { Ads: 'W7', Running: 30, Swimming: 20, Cycling: 2, Cyc: 20 },
//                      { Ads: 'W8', Running: 30, Swimming: 20, Cycling: 5, Cyc: 05 },
//                      { Ads: 'W9', Running: 30, Swimming: 20 , Cycling: 21, Cyc: 6},
//                      { Ads: 'W10', Running: 30, Swimming: 20, Cycling: 18, Cyc: 2 },
//                      { Ads: 'W11', Running: 30, Swimming: 20, Cycling: 15, Cyc: 5 },
//                      { Ads: 'W12', Running: 30, Swimming: 20, Cycling: 22, Cyc: 22 },
//                      { Ads: 'W13', Running: 30, Swimming: 20, Cycling: 6, Cyc: 21 },
//                      { Ads: 'W14', Running: 30, Swimming: 20, Cycling: 5, Cyc: 18 },
//                      { Ads: 'W15', Running: 30, Swimming: 20, Cycling: 5, Cyc: 22 },
//                      { Ads: 'W16', Running: 10, Swimming: 20, Cycling: 25, Cyc: 25}
//                      
//                  ];
    console.log("sampleData : "+sampleData);
              // prepare jqxChart settings
    if(sampleData.length > 0)
    	{
    	
              var settings = {
                  title: "Investment in "+cityName+" city",
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
//                      unitInterval: 10,
                      minValue: 0,
//                      maxValue: 100,
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
              $('#chartContainer1').empty();
              $('#chartContainer1').jqxChart(settings);
//    }

    	}
    else
    	{
    		jqueryconform('Message', 'No records found for selected city.');
    	}
}

function loadPage(id, zoneid)
{
	var text = "";
	$.session.set("zone",parseInt(zoneid));
	if(id == "southzone")
	{
		text = "South Zone - Everest Impact";
		id= "westzone";
	}
	else if(id == "eastzone")
	{
		text = "East Zone - Everest Impact";
		id= "westzone";
	}
	else if(id == "westzone")
	{
		text = "West Zone - Everest Impact";
		id= "westzone";
	}
	else if(id == "northzone")
	{
		text = "North Zone - Everest Impact";
		id= "westzone";
	}
	else if(id == "centralzone")
	{
		text = "Central Zone - Everest Impact";
		id= "westzone";
	}
//	else if(id == "datatable")
//	{
//		text = "DataTable - Everest Impact";
//	}
	else if(id == "viewCampaign")
	{
		text = "View Campaign - Everest Impact";
		localStorage.setItem("impact","");
		var key = localStorage.getItem("userKey");
		objhandleRequest.getReportsByUserUploaded(key);
	}
	else if(id == "impact")
	{
		text = "Impact - Everest Impact";
		localStorage.setItem("impact","impact");
		var key = localStorage.getItem("userKey");
		objhandleRequest.getReportsByUserUploaded(key);
	}
	
	$('#subHeadding').empty();
//	$('#subHeadding').append(text);
	$('#subHeadding').hide();
	$('#content').load(id+'.jsp');
	
}

function getZoneDetails(action, zoneid, cityid)
{
	objhandleRequest.getZoneDetailsRequest(action, zoneid, cityid);
}