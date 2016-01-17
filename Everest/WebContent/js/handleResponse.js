function handleAllListResponse(jsonMsg)
{
	try
	{
		callServlet(jsonMsg, function(strJsonResponse)
		{
			if(strJsonResponse != null && strJsonResponse.length > 10)
			{
				var response = JSON.parse(strJsonResponse);
				var command = response.command;
				var status = parseInt(response.status);
				writeLogAjax("command : " + command + " status : " + status + " JSON Response FROM SERVLET :  " + JSON.stringify(response), 1);
				listResponseHandler(response, command, status);
			}
			else
			{
				$(".indexoverlay").show().delay(100).fadeOut();
				$.confirm(
				{
				title : "Alert Message !",
				backgroundDismiss : false,
				content : "Sorry..!! Connection to server is lost. Please Re-Login to your account",
				confirm : function()
				{
					try
					{
						writeLogAjax("***********************************No Response FROM SERVLET***********************************", 0);
						logoutUser();
					}
					catch (e)
					{
						console.log("video.js : Exception : " + e);
					}
				},
				cancle : function()
				{
				}
				});
			}
		});
	}
	catch (e)
	{
		console.log("handleAllListResponse(jsonMsg) Exception : " + e);
		writeLogAjax("handleAllListResponse(jsonMsg) Exception : " + e, 0);
	}
}
function listResponseHandler(response, command, status)
{
	try
	{
		switch (status)
		{
			case 3:
				switch (command)
				{
					case 2051:
						handleLoginResponse(response);
						break;
					case 2052:
						handleSignUpResponse(response);
						break;
					case 2054:
						handleForgetPasswordResponse(response);
						break;
					case 2055:
						break;
					case 2056:
						handleResetPasswordResponse(response);
						break;
					case 2057:
						zoneDetailsResponse(response);
						break;
					case 9002:
						reportDetailsResponse(response);
						break;
					case 9003:
						reportDetailsResponse(response);
						break;
					case 9004:
						reportDetailsResponse(response);
						break;
					case 2058:
						break;
				}
				break;
			case 1:
				break;
			case 2:
				switch (command)
				{
					case 1051:
						handleLoginResponse(response);
						break;
					case 1052:
						handleSignUpResponse(response);
						break;
					case 1054:
						handleForgetPasswordResponse(response);
						break;
					case 1055:
						handleSaveUserDetailsResponse(response);
						break;
					case 1056:
						break;
					case 1057:
						handleNewVideosForAddsResponse(response);
						break;
					case 1058:
						handleWalletUpdateResponse(response);
						break;
					case 5002:
						reportDetailsResponse(response);
						break;
					case 5003:
						reportDetailsResponse(response);
						break;
					case 5004:
						reportDetailsResponse(response);
						break;
				}
				break;
			case 4:
				switch (command)
				{
					case 2058:
						handleCustomerAuthentication(response);
						break;
				}
				break;
			case 5:
				switch (command)
				{
					case 1058:
						handleCustomerAuthentication(response);
						break;
				}
				break;
			case 6:
				switch (command)
				{
					case 1058:
						try
						{
							console.log(JSON.stringify(response));
						}
						catch (e)
						{
							console.log("Command : 1058 :: Exception : " + e);
						}
						break;
				}
				break;
			case 10:
				switch (command)
				{
					case 1052:
						handleSignUpResponse(response);
						break;
					case 1051:
						handleLoginResponse(response);
						break;
				}
				break;
			case 11:
				switch (command)
				{
					case 1052:
						handleSignUpResponse(response);
						break;
				}
				break;
			case 12:
				switch (command)
				{
					case 1052:
						handleSignUpResponse(response);
						break;
				}
				break;
			default:
				break;
		}
	}
	catch (e)
	{
		console.log("handleResponse Exception : " + e);
	}
}