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
			$.session.set("zonedetails",JSON.stringify(response.zoneDetails));
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
		}
		$(".indexoverlay").hide();
	}
	catch (e)
	{
		console.log("handleLoginResponse Exception : " + e);
	}
}
