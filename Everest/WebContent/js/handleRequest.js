function handleRequest()
{
	this.handleLogin = handleLogin;
	this.handleRegisteration = handleRegisteration;
	this.handleResetPassword = handleResetPassword;
	this.handleSubmitReportDetails = handleSubmitReportDetails;
	this.handleForgotPwd = handleForgotPwd;
	this.getZoneDetailsRequest = getZoneDetailsRequest;
	function handleLogin(emailLogin, passLogin, userType, otpLogin)
	{
		try
		{
			var login = {};
			login.emailLogin = emailLogin;
			login.passLogin = passLogin;
			login.userType = userType;
			login.otpLogin = otpLogin;
			login.command = 1051;
			var strJsonMsgForLogin = JSON.stringify(login);
			console.log("handleRequest     handleLogin     strJsonMsgForLogin : " + strJsonMsgForLogin);
			handleAllListResponse(strJsonMsgForLogin);
		}
		catch (e)
		{
			console.log("handleRequest handleLogin Exception :: " + e);
		}
	}
	function handleRegisteration(passSignUp, mobileKey, emailKey, userType)
	{
		try
		{
			var signUp = {};
			signUp.passSignUp = passSignUp;
			signUp.mobileKey = mobileKey;
			signUp.emailKey = emailKey;
			signUp.userType = userType;
			signUp.command = 1052;
			var strJsonMsgForSignUp = JSON.stringify(signUp);
			console.log("handleRequest     handleRegisteration     strJsonMsgForSignUp : " + strJsonMsgForSignUp);
			handleAllListResponse(strJsonMsgForSignUp);
		}
		catch (e)
		{
			console.log("handleRequest handleRegisteration Exception :: " + e);
		}
	}
	function handleForgotPwd(emailForgotPwd, userType)
	{
		try
		{
			var forgotPwd = {};
			forgotPwd.emailForgotPwd = emailForgotPwd;
			forgotPwd.userType = userType;
			forgotPwd.command = 1054;
			var strJsonMsgForForgotPwd = JSON.stringify(forgotPwd);
			console.log("handleRequest     handleForgotPwd     strJsonMsgForForgotPwd : " + strJsonMsgForForgotPwd);
			handleAllListResponse(strJsonMsgForForgotPwd);
		}
		catch (e)
		{
			console.log("handleRequest handleForgotPwd Exception :: " + e);
		}
	}
	function handleResetPassword(password1, userType, email)
	{
		try
		{
			var resetPwd = {};
			resetPwd.pwd = password1;
			resetPwd.email = email;
			resetPwd.userType = userType;
			resetPwd.command = 1056;
			var strJsonMsgForResetPwd = JSON.stringify(resetPwd);
			handleAllListResponse(strJsonMsgForResetPwd);
			console.log("handleRequest     handleResetPassword     strJsonMsgForResetPwd : " + strJsonMsgForResetPwd);
		}
		catch (e)
		{
			console.log("handleRequest handleResetPassword Exception ::" + e);
		}
	}
	function handleSubmitReportDetails(selectCat, peopleAtt, peopEnq, totBud, eventDate, eventTime, editor)
	{
		try
		{
			var report = {};
			report.selectCat = selectCat;
			report.peopleAtt = peopleAtt;
			report.peopEnq = peopEnq;
			report.totBud = totBud;
			report.eventDate = eventDate;
			report.eventTime = eventTime;
			report.editor = editor;
			report.command = 9001;
			var strJsonMsgForReport = JSON.stringify(report);
			handleAllListResponse(strJsonMsgForReport);
			console.log("handleRequest     handleSubmitReportDetails     strJsonMsgForReport : " + strJsonMsgForReport);
		}
		catch (e)
		{
			console.log("handleRequest handleSubmitReportDetails Exception ::" + e);
		}
	}
	function getZoneDetailsRequest(action, zoneid, cityid)
	{
		try
		{
			var getZoneDetails = {};
			getZoneDetails.command = 1057;
			getZoneDetails.action = action;
			getZoneDetails.zoneid = +zoneid;
			getZoneDetails.cityid = +cityid;
			var strJsonMsgForZoneDetails = JSON.stringify(getZoneDetails);
			handleAllListResponse(strJsonMsgForZoneDetails);
			console.log("handleRequest     getZoneDetailsRequest     strJsonMsgForResetPwd : " + strJsonMsgForZoneDetails);
		}
		catch (e)
		{
			console.log("handleRequest getZoneDetailsRequest Exception ::" + e);
		}
	}
}