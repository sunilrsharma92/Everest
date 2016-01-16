
var objhandleRequest = new handleRequest();

$(document).ready( function(){
	$('#content').load('indexp1.jsp');
});

function loadPage(id)
{
	var text = "";
//	var id = $(idobj).attr("id");
	
	if(id == "southzone")
	{
		text = "South Zone - Everest Impact";
	}
	else if(id == "eastzone")
	{
		text = "East Zone - Everest Impact";
	}
	else if(id == "westzone")
	{
		text = "West Zone - Everest Impact";
	}
	else if(id == "northzone")
	{
		text = "North Zone - Everest Impact";
	}
	else if(id == "centralzone")
	{
		text = "Central Zone - Everest Impact";
	}
	else if(id == "datatable")
	{
		text = "DataTable - Everest Impact";
	}
	
	$('#subHeadding').empty();
	$('#subHeadding').append();
	$('#content').load(id+'.jsp');
}

function getZoneDetails()
{
	objhandleRequest.getZoneDetailsRequest();
}