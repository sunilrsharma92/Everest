$(document).ready( function(){
	$('#content').load('indexp1.jsp');

	$('ul#nav li a').click(function(){
		
		var page = $(this).attr('href');
		alert("page clicked"+page);
		
		
	  $('#content').load(+page+'.jsp');
	  alert("loaded");
		
		return false;
	});
});