$(document).ready(function()
{
	try
	{
		$("#passLoginTemp, #emailLogin").keypress(function(e)
		{
			if(e.which == 13)
			{
				login();
			}
		});
		$("#emailSignUp, #mobile, #passSignUp, #repass").keypress(function(e)
		{
			if(e.which == 13)
			{
				signUp();
			}
		});
		
	}
	catch (e)
	{
		console.log("ready.js Exception : " + e);
	}
});
function logoutUser()
{
	try
	{
		$.session.remove("");
	}
	catch (e)
	{
		console.log("Logout Exception : " + e);
	}
}
function jqueryconform(title, message)
{
	$.alert(
	{
	title : title + " !",
	backgroundDismiss : false,
	content : message,
	confirm : function()
	{
	}
	});
}
function resetPassword()
{
	$(".customeroverlay").show();
	var password1 = $("#password1").val();
	var password2 = $("#password2").val();
	var userType = $.session.get("userType");
	var loginData = $.session.get("loginData");
	var sessionData = JSON.parse(loginData);
	var email = sessionData.emailId;
	objhandleRequest.handleResetPassword(password1, userType, email);
}
function login()
{
	var emailLogin = $("#emailLogin").val();
	var passLogin = $("#passLoginTemp").val();
	var otpLogin = $("#otpLogin").val();
	var userType = "customer";
	$("#loginalerts").empty();
	if(emailLogin == "")
	{
		document.getElementById("loginalerts").innerHTML = "Please enter your login email";
		return false;
	}
	else
	{
		if(!emailValidation(emailLogin))
		{
			document.getElementById("loginalerts").innerHTML = "Invalid email address.";
			return false;
		}
		else
		{
			if(passLogin == "")
			{
				document.getElementById("loginalerts").innerHTML = "Please enter your login password";
				return false;
			}
			else
			{
				console.log("emailLogin : " + emailLogin + "  passLogin : " + passLogin + "  userType : " + userType + "  otpLogin : " + otpLogin);
				writeLogAjax("emailLogin : " + emailLogin + "  passLogin : " + passLogin + "  userType : " + userType + "  otpLogin : " + otpLogin, 1);
				$(".indexoverlay").show();
				objhandleRequest.handleLogin(emailLogin, passLogin, userType, otpLogin);
				return true;
			}
		}
	}
}
function signUp()
{
	var passSignUp = $("#passSignUp").val();
	var repass = $("#repass").val();
	var mobileKey = $("#mobile").val();
	var emailKey = $("#emailSignUp").val();
	var userType = "customer";
	$("#signupalerts").empty();
	if(emailKey == "")
	{
		document.getElementById("signupalerts").innerHTML = "Please enter your email";
		return false;
	}
	else
	{
		if(!emailValidation(emailKey))
		{
			document.getElementById("signupalerts").innerHTML = "Invalid email address.";
			return false;
		}
		else
		{
			if(mobileKey == "")
			{
				document.getElementById("signupalerts").innerHTML = "Please enter your mobile number";
				return false;
			}
			else
			{
				if(passSignUp == "")
				{
					document.getElementById("signupalerts").innerHTML = "Please enter your password";
					return false;
				}
				else
				{
					if(repass == "")
					{
						document.getElementById("signupalerts").innerHTML = "Please re-enter your password";
						return false;
					}
					else
					{
						if(passSignUp != repass)
						{
							document.getElementById("signupalerts").innerHTML = "Conform password should be same as new password";
							return false;
						}
						else
						{
							console.log("passSignUp" + passSignUp + "mobileKey" + mobileKey + "emailKey" + emailKey + "userType" + userType);
							writeLogAjax("passSignUp" + passSignUp + "mobileKey" + mobileKey + "emailKey" + emailKey + "userType" + userType, 1);
							$(".indexoverlay").show();
							objhandleRequest.handleRegisteration(passSignUp, mobileKey, emailKey, userType);
							return true;
						}
					}
				}
			}
		}
	}
}
function forgotPwd()
{
	var emailForgotPwd = $("#emailForgotPwd").val();
	var userType = "customer";
	$("#forgetpassalerts").empty();
	if(emailForgotPwd == "")
	{
		document.getElementById("forgetpassalerts").innerHTML = "Please enter your email to get your new password";
		return false;
	}
	else
	{
		if(!emailValidation(emailForgotPwd))
		{
			document.getElementById("forgetpassalerts").innerHTML = "Invalid email address.";
			return false;
		}
		else
		{
			console.log("emailForgotPwd : " + emailForgotPwd + "   userType" + userType);
			writeLogAjax("emailForgotPwd : " + emailForgotPwd + "   userType" + userType, 1);
			$(".indexoverlay").show();
			objhandleRequest.handleForgotPwd(emailForgotPwd, userType);
			return true;
		}
	}
}
function showDiv(id)
{
	try
	{
		console.log("id : " + id);
		for (var i = 0; i <= 2; i++)
		{
			var idval = i + "" + 0;
			console.log("idval : " + idval);
			if(i == id)
			{
				$("#" + idval).show();
				$("#" + i).css("background-color", "green");
			}
			else
			{
				$("#" + idval).hide();
				$("#" + i).css("background-color", "");
			}
		}
	}
	catch (e)
	{
		console.log("showDiv(id) Exception : " + e);
	}
}
function validateElements(action, e, objid)
{
	var id = $(objid).attr("id");
	var keyCode = e.which ? e.which : e.keyCode;
	var number = keyCode >= 48 && keyCode <= 57;
	var phoneno = /^\d{10}$/;
	var backspace = keyCode == 8;
	var space = keyCode == 32;
	var singlequt = keyCode == 222;
	var deletebutton = keyCode == 127;
	var arrowKey = keyCode >= 37 && keyCode <= 40;
	var bigAlpha = keyCode >= 64 && keyCode <= 90;
	var smallAlpha = keyCode >= 97 && keyCode <= 122;
	var ret = false;
	var value = $("#" + id).val();
	if(action == "num")
	{
		ret = (number || backspace || deletebutton || arrowKey);
	}
	else
	{
		if(action == "char")
		{
			ret = (backspace || space || deletebutton || arrowKey || bigAlpha || smallAlpha);
		}
		else
		{
			if(action == "email")
			{
				ret = emailValidation(value);
			}
		}
	}
	return ret;
}
function emailValidation(value)
{
	var add = value;
	var ampisthere = false;
	var spacesthere = false;
	var textbeforeamp = false;
	var textafteramp = false;
	var dotafteramp = false;
	var othererror = false;
	for (var i = 0; i < add.length; ++i)
	{
		if(add.charAt(i) == "@")
		{
			if(ampisthere)
			{
				othererror = true;
			}
			ampisthere = true;
		}
		else
		{
			if(!ampisthere)
			{
				textbeforeamp = true;
			}
			else
			{
				if(add.charAt(i) == ".")
				{
					dotafteramp = true;
				}
				else
				{
					textafteramp = true;
				}
			}
		}
		if(add.charAt(i) == " " || add.charAt(i) == ",")
		{
			spacesthere = true;
		}
	}
	if(spacesthere || !ampisthere || !textafteramp || !textbeforeamp || !dotafteramp || othererror)
	{
		return false;
	}
	else
	{
		return true;
	}

}

function submitReportDetails()
{
	$(".customeroverlay").show();
	var selectCat = $("#selectCat").val();
	var peopleAtt = $("#peopleAtt").val();
	var peopEnq = $("#peopEnq").val();
	var totBud = $("#totBud").val();
	var eventDate = $("#eventDate").val();
	var eventTime = $("#eventTime").val();
	var editor = $("#editor").val();
	
	objhandleRequest.handleSubmitReportDetails(selectCat, peopleAtt, peopEnq, totBud, eventDate, eventTime, editor);
}
var objhandleRequest = new handleRequest();