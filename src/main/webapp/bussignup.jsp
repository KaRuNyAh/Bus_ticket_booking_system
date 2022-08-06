<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bus</title>
	<!--<link rel="stylesheet" type="text/css" href="showmyticket.css">-->
<style>
#header{
	display: flex;
	align-items:center ;
	justify-content: space-between;
	padding: 20px 80px;
	height: 10vh;
	background: wheat;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.06);
	z-index: 999;
	position: sticky;
	top: 0;
    left: 0;
}
#navbar{
	display: flex;
	align-items: center;
	justify-content: center;
}
#navbar li {
	list-style: none;
	padding: 0 20px;
	position: relative;
}
#navbar li a{
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	color: black;
	transition: 0.3s ease;
}
#navbar li a:hover,
#navbar li a.active{
	color: deepskyblue;
}
#navbar li a.active::after,
#navbar li a:hover::after{
	content: " ";
	width: 30%;
	height: 2px;
	background: #088178;
	position: absolute;
	bottom: -4px;
	left: 20px;
}
#footer{
	box-sizing: 20px 40px;
	background-color:black;
	color: white;
	display: flex;
	flex-direction: row;
}
#footer div{
	padding: 40px;
}
#showmyticket div{
	align-items: center;
	display: flex;
	padding-left: 500px;
	padding-right: 370px;
	border-color: grey;
	border-radius: 20px;
	border-style: solid ;
	height: 50px;
}
#body {
	box-sizing:20px 40px;
	border-style:double;
	border-color:black;
	height:400px;
	width:80%;
	margin-left:100px;
}
.box{
	box-sizing:40px 30px;
	width:85%;
	margin-left:80px;
	border-style:dotted;
	border-color:red;
	height:100px;
}
.button {
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
#buttons{
align-items:center;
padding-top:20px;
padding-bottom:20px;
}


.button1 {background-color: #4CAF50;} 
.button2 {background-color: #008CBA;} 
.button1 {background-color: #4CAF50;} 
.button2 {background-color: #008CBA;} 
</style>
</head>
<body>
<section id="header">
<a href="#"><img src="logo.jpg" class="logo" alt=" "></a>
<div>
		<ul id="navbar">
			<li><a  href="index.html">Home</a></li>
			<li><a href="helpdesk.jsp">HelpDesk</a></li>
			<li><a class="active" href="manage.jsp">Manage</a></li>
			<li><a href="signin.jsp">Sign-in</a></li>
			<li><a href="signup.jsp">Sign-up</a></li>
			<li><a href="history.jsp">History</a></li>
		</ul>
</div>
</section>
<section id="driver" >
<form action="">


</form></section>
<section id="buttons">
<center>
<div>
<form action="addbus.jsp"><button class="button button1" >Add bus</button></form><br>
<form action="adddriver.jsp"><button class="button button2">Add driver</button></form><br>
<form action="addsession.jsp"><button class="button button1">Add session</button></form><br>
</center></div>
</section>
<section id="footer" >
	<div>
	<h5>About Us</h5><br>
	<p>contact us</p>
	<p>Mobile Version</p>
	<p>Agent Registeration</p>
	</div>
	<div>
	<h5>Traveller Tools</h5><br>
	<p>Track My Bus</p>
	<p>Cancellation</p>
	<p>Print E Ticket</p>
	<p>FAQ</p>
	</div>
	<div>
	<h5>Terms and Conditions<h5><br>
	<p>Privacy policy</p>
	<p>cookie policy</p>
	</div>
	<div>
	<h4>online booking system successfully running over 10 years.with 2 million happy customers globally.
	offers bus ticket booking through its website,iOS and Android mobile apps for all major routes.<br>
	@’¸ 2022 zohogroup All rights reserved</h4>
	</div>
</section>
</body>
</html>