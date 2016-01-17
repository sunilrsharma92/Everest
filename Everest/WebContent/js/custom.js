
var objhandleRequest = new handleRequest();

$(document).ready( function(){
	$('#content').load('indexp1.jsp');
	getZoneDetails("", 0, 0);
});

function loadPage(id)
{
//	var text = "";
//	var id = $(idobj).attr("id");
	
//	if(id == "southzone")
//	{
//		text = "South Zone - Everest Impact";
//	}
//	else if(id == "eastzone")
//	{
//		text = "East Zone - Everest Impact";
//	}
//	else if(id == "westzone")
//	{
//		text = "West Zone - Everest Impact";
//	}
//	else if(id == "northzone")
//	{
//		text = "North Zone - Everest Impact";
//	}
//	else if(id == "centralzone")
//	{
//		text = "Central Zone - Everest Impact";
//	}
//	else if(id == "datatable")
//	{
//		text = "DataTable - Everest Impact";
//	}
//	else if(id == "viewCampaign")
//	{
//		text = "View Campaign - Everest Impact";
//	}
//	else if(id == "impact")
//	{
//		text = "Impact - Everest Impact";
//	}
	
	$('#subHeadding').empty();
//	$('#subHeadding').append(text);
	$('#content').load(id+'.jsp');
}

function getZoneDetails(action, zoneid, cityid)
{
	objhandleRequest.getZoneDetailsRequest(action, zoneid, cityid);
}