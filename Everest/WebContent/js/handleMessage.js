var objhandleRequest = new handleRequest();
function handleSignUpResponse(response)
{
	$(".indexoverlay").show().delay(100).fadeOut();
	var action = response.status;
	var statusdesc = response.statusdesc;
	if(action == 3)
	{
		var email = response.email;
		jqueryconform("Message", "We have send OTP to " + email + " and to your registered mobile please provide us during your first login");
		$("#logintab").trigger("click");
		$("#otpLogin").show();
	}
	else
	{
		jqueryconform("Message", statusdesc);
	}
}
function handleForgetPasswordResponse(response)
{
	$(".indexoverlay").show().delay(100).fadeOut();
	var action = response.status;
	if(action == 3)
	{
		var email = response.email;
		jqueryconform("Message", "We have send your password to " + email + " please check it out");
		$("#crossClose").trigger("click");
	}
	else
	{
		var statusdesc = response.statusdesc;
		jqueryconform("Message", statusdesc);
	}
}
function handleResetPasswordResponse(response)
{
	var action = response.status;
	var statusdesc = response.statusdesc;
	if(action != 3)
	{
		jqueryconform("Message", statusdesc);
	}
	else
	{
		jqueryconform("Message", "Password changed successfully");
	}
	$(".indexoverlay").show().delay(100).fadeOut();
}
function zoneDetailsResponse(response)
{
	try
	{
		var action = response.status;
		var statusdesc = response.statusdesc;
		console.log("Response : "+JSON.stringify(response));
		if(action != 3)
		{
			jqueryconform("Message", statusdesc);
		}
		else
		{
			$.session.set("response",JSON.stringify(response));
		}
		$(".indexoverlay").show().delay(100).fadeOut();
	}
	catch(e)
	{
		console.log("zoneDetailsResponse : : Exception : "+e);
	}
}
function reportsDetailsResponse(response)
{
	try
	{
		var action = response.status;
		var statusdesc = response.statusdesc;
		console.log("Response : "+JSON.stringify(response));
		if(action != 3)
		{
			jqueryconform("Message", statusdesc);
		}
		else
		{
			var data = response.reports;
			var impact = localStorage.getItem("impact");
			if(impact == "impact")
			{
				localStorage.setItem("impact","");
				var impactdiv = "";
				for(var i in data)
				{
				
					impactdiv = impactdiv + '<div class="container well " style="width: ; height:; margin-top:20px">'+
				' <h4>Dealer meet at Mumbai</h4>'+
				'        <div class="row well" style="border:none;">'+
				'        '+
				'        <div class="col-md-6 ">'+
				'<p><strong><u>Picture:</u></strong></p>'+
				'            <img style="width: 325px; height: 178px;" src="'+data[i].eventimg+'">'+
				'        </div><!--/col-md-6-->  '+
				'        <div class="col-md-6 ">'+
				'            <p><strong><u>Overview:</u></strong></p>'+
				'        <div class="row form-group">'+
				'            <label>Total Budget  : '+data[i].totalbudget+'</label> <br>'+
				'            <label>Total People Attended  : '+data[i].totalpeopleattented+'</label><br> '+
				'            <label>Total People Enquiry  : '+data[i].totalpeopleenquiry+'</label><br>'+
//				'            <label>Total Budget:</label> <br>'+
				'         </div>'+
				'            '+
				'            <button style="margin-top:15px;">Read More</button>'+
				'        </div><!--/col-md-6--> '+
				'        </div>'+
				' </div>';
					
				
				}
				
				$("#impactDiv").empty();
				$("#impactDiv").append(impactdiv);

			}
			else
			{
				
//        	var data = [{'Category' : 'Dealer',	'Date' :'1/12/2016',	'Name' : 'Ram',	'Email' :'ram@gmail.com',	'Mobile' :'1234567890',	'Zone' :'west',	'State' :'maharashtra',	'City' :'mumbai'},
//        	            {'Category' : 'Dealer',	'Date' :'1/12/2016',	'Name' : 'Sham',	'Email' :'ram@gmail.com',	'Mobile' :'1234567890',	'Zone' :'west',	'State' :'maharashtra',	'City' :'mumbai'},
//        	            {'Category' : 'Dealer',	'Date' :'1/12/2016',	'Name' : 'Rahul',	'Email' :'ram@gmail.com',	'Mobile' :'1234567890',	'Zone' :'west',	'State' :'maharashtra',	'City' :'mumbai'},
//        	            {'Category' : 'Dealer',	'Date' :'1/12/2016',	'Name' : 'Sunil',	'Email' :'ram@gmail.com',	'Mobile' :'1234567890',	'Zone' :'west',	'State' :'maharashtra',	'City' :'mumbai'},
//        	            {'Category' : 'Dealer',	'Date' :'1/12/2016',	'Name' : 'Deva',	'Email' :'ram@gmail.com',	'Mobile' :'1234567890',	'Zone' :'west',	'State' :'maharashtra',	'City' :'mumbai'}
//        	            ];
			var source =
            {
            		localdata : data,
                dataType: "json",
                dataFields: [
                     { name: 'reportid', type: 'string' },
                     { name: 'userid', type: 'string' },
                     { name: 'zoneid', type: 'string' },
                     { name: 'totalpeopleattented', type: 'string' },
                     { name: 'totalpeopleenquiry', type: 'string' },
                     { name: 'eventimg', type: 'sting' },
                     { name: 'totalbudget', type: 'string' },
                     { name: 'body', type: 'string' },
                     { name: 'eventdate', type: 'string' },
                     { name: 'eventtime', type: 'string' },
                     { name: 'reportdate', type: 'string' },
                     { name: 'reporttime', type: 'string' }
                ]
            };
        	
        	var imagerenderer = function(row, datafield, value)
    		{
    			return '<div style="text-align: center; margin-top: 3px;"><img src="images/View.gif" style="cursor:pointer; height:20px; width:20px;" onclick=""/></div>';
    		};
    		
            var dataAdapter = new $.jqx.dataAdapter(source);
            $("#dataTable").jqxGrid(
            {
                source: dataAdapter,
                pageable: true,
                altRows: true,
                filterable: true,
                filterMode: 'advanced',
                showfilterrow:true,
                selectionmode: 'multiplecellsextended',
                width: '100%',
                columns: [
                  { text: 'Report Date', cellsAlign: 'center', align: 'center', dataField: 'reportdate', width: '20%' },
                  { text: 'Total Budget', cellsAlign: 'center', align: 'center', dataField: 'totalbudget', width: '20%' },
                  { text: 'People Attented', cellsAlign: 'center', align: 'center', dataField: 'totalpeopleattented', width: '20%' },
                  { text: 'People Made Enquery', cellsAlign: 'center', align: 'center', dataField: 'totalpeopleenquiry', width: '20%' },
                  { text: 'Event Date', cellsAlign: 'center', align: 'center', dataField: 'eventdate', width: '20%' },
                  {
              		text : "View Order",
              		menu : false,
              		sortable : false,
              		filterable : false,
              		showfilterrow : false,
              		cellsalign : "center",
              		width : "10%",
              		cellsrenderer : imagerenderer}
//                  { text: 'Email', cellsAlign: 'center', align: 'center', dataField: 'Email', width: '15%', hidden:true },
//                  { text: 'Contact Num', cellsAlign: 'center', align: 'center', dataField: 'Mobile', width: '15%' , hidden:true},
//                  { text: 'City', cellsAlign: 'center', align: 'center', dataField: 'City',width: '15%' }
                ]
            });
            
            $("#excelExport").jqxButton();
            $("#xmlExport").jqxButton();
            $("#csvExport").jqxButton();
            $("#tsvExport").jqxButton();
            $("#htmlExport").jqxButton();
            $("#jsonExport").jqxButton();
            $("#pdfExport").jqxButton();

            $("#excelExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'xls', 'jqxGrid');           
            });
            $("#xmlExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'xml', 'jqxGrid');
            });
            $("#csvExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'csv', 'jqxGrid');
            });
            $("#tsvExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'tsv', 'jqxGrid');
            });
            $("#htmlExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'html', 'jqxGrid');
            });
            $("#jsonExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'json', 'jqxGrid');
            });
            $("#pdfExport").click(function () {
                $("#dataTable").jqxGrid('exportdata', 'pdf', 'jqxGrid');
            });
		}

		}
		$(".indexoverlay").show().delay(100).fadeOut();
	}
	catch(e)
	{
		console.log("zoneDetailsResponse : : Exception : "+e);
	}
}

function reportDetailsResponse(response)
{
	try
	{
		var action = response.status;
		var statusdesc = response.statusdesc;
		if(action != 3)
		{
			jqueryconform("Message", statusdesc);
		}
		else
		{
//			location.replace("impact.jsp");
			console.log("reportDetailsResponse Exception : " + e);	
		}
	}
	catch(e)
	{
		console.log("reportDetailsResponse Exception : " + e);	
	}
	$(".indexoverlay").show().delay(100).fadeOut();
}

function uploadExcelImageResponse(response)
{
	try
	{
		var action = response.status;
		var statusdesc = response.statusdesc;
		if(action != 3)
		{
			jqueryconform("Message", statusdesc);
		}
		else
		{
			console.log("uploadExcelImageResponse Exception : " + e);	
		}
	}
	catch(e)
	{
		console.log("uploadExcelImageResponse Exception : " + e);	
	}
	$(".indexoverlay").show().delay(100).fadeOut();
}

function handleLoginResponse(response)
{
	try
	{
		var action = response.status;
		var statusdesc = response.statusdesc;
		var videos = "";
		var videoNavigation = "";
		var msg = "Your account is not yet verified. Please enter your verification code(OTP)";
		var invalidOTP = "Invalid OTP. Please check your mail for the valid OTP";
		if(action != 3)
		{
			$(".indexoverlay").hide();
			$("#loginalerts").empty();
			$("#loginalerts").append(statusdesc);
//			jqueryconform("Message", statusdesc);
		}
		else
		{
			location.replace("index.jsp");
			var key = response.key;
			localStorage.setItem("userKey", key);
			console.log("Key : "+key);
		}
		$(".indexoverlay").hide();
	}
	catch (e)
	{
		console.log("handleLoginResponse Exception : " + e);
	}
}
