<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EverestImpact - Login</title>
  <link rel="stylesheet" href="js/jqueryConfirm/jquery-confirm.css">
  <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
  <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
  @import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
  @import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	/*background-image: url(http://ginva.com/wp-content/uploads/2012/07/city-skyline-wallpapers-008.jpg);*/
	background-image: url('images/rsz_slide2 (1).jpg');
	background-size: cover;
	-webkit-filter: blur(7px);
    -moz-filter: blur(7px);
    -o-filter: blur(7px);
    -ms-filter: blur(7px);
    filter: blur(7px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(50% - 35px);
	left: calc(48% - 255px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: calc(50% - 75px);
	left: calc(50% - 50px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #000;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #000;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=button]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover{
	opacity: 0.8;
}

.login input[type=button]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=button]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}

#loading-img {
	background: url(loader_img/spinner.gif) center center no-repeat;
	background-size: 100px 100px;
	height: 50%;
	z-index: 100000;
}

.indexoverlay {
	display: none;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 1000000;
}

.content
{
	color: black !important;
}

.container {
    width: 39%;
    margin: 0px auto;
}

    </style>

    <% session.invalidate(); %>
    
  </head>

  <body>

	<div class="indexoverlay" style="margin-top: 17%;">
	<div id="loading-img"></div>
	</div>
		
    <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>Everest<span>Impact</span></div>
		</div>
		<br>
		<div class="login">
				<input type="text" placeholder="Username" name="user" id="emailLogin"><br>
				<input type="password" placeholder="Password" name="password" id="passLoginTemp"><br>
				<input type="text" placeholder="OTP" name="otp" id="otpLogin" style="display:none;"><br>
				<div id="loginalerts"></div><br>
				<input type="button" value="Login" onclick="login();">
		</div>
    
    
    <script type="text/javascript" src="js/json_parse.js"></script>
	<script type="text/javascript" src="js/json2.js"></script>
	<script type="text/javascript" src="js/jqueryConfirm/jquery-confirm.js"></script>
    
    <script type="text/javascript" src="js/handleRequest.js"></script>
	<script type="text/javascript" src="js/handleResponse.js"></script>
	<script type="text/javascript" src="js/handleMessage.js"></script>
	<script type="text/javascript" src="js/callServlet.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    
    
  </body>
</html>