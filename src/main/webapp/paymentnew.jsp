<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta
	name="viewport"
	content="width=device-width,initial-scale=1.0"/>
	<title>payment</title>
	<link rel="stylesheet" href="style.css"class="css" />
	<script type="text/javascript">history.forward();</script>
<%

if(session.getAttribute("username")==null){
	response.sendRedirect("signin.jsp");
}
%>
</head>
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
div.container{
	border-style:double;
	border-color:black;
	border-width:5px;
	margin:20px
	display:flex;
	width:90%;
	height:400px;
}
</style>

<script>
function Hello() {
	var tracker = document.getElementById("cardno");
    var holdername= document.getElementById("cardholdername");
	var cvvno= document.getElementById("cvvno");
	var expirydate = document.getElementById("expirydate");
	if((tracker.value.length == 16)&&(cvvno.value.length!=0)&&(holdername.value.length!=0)&&(expirydate.value.length!=0))
	else
		alert("Please check whether you have entered the following details correctly:\n->cardnumber\n->cardholdername\n->cvvno\n->expirydate!");
}
</script>
<section id="header">
	<a href="#"><img src="logo.jpg" class="logo" alt=" "></a>
	<div>
		<ul id="navbar">
			<li><a class="active" href="index.html">Home</a></li>
			<li><a href="helpdesk.jsp">HelpDesk</a></li>
			<li><a href="manage.jsp">Manage</a></li>
			<li><a href="signin.jsp">Sign-in</a></li>
			<li><a href="signup.jsp">Sign-up</a></li>
		    <li><a href="history.jsp">History</a></li>
		</ul>
	</div>
</section>
<body>
<center>
<br/>
	<div class="container">
	<center>
	<center>

	<div class="card-details"><br /><br />
	<u>	<p>Pay using Credit or Debit card</p></u><br>
	<form action="Ticket">
		<div class="card-number">
		<label> Card Number </label>
		<input type="text" class="card-number-field" name="cardno" id="cardno" placeholder="###-###-###"/>
		</div>
		<br /><br />
		<div class="date-number">
		<label> Expiry Date </label>
		<input type="date" class="date-number-field" name="expirydate" placeholder="DD-MM-YY" />
		</div><br /><br />
		<div class="cvv-number">
		<label> CVV number </label>
		<input type="text" class="cvv-number-field" name="cvvno" placeholder="xxx" />
		</div><br /><br />
		<div class="nameholder-number">
		<label> Card Holder name </label>
		<input type="text" class="card-name-field" name="cardholdername" placeholder="Enter your Name"/>
		</div>
		<br /><br /><br /><br />
		<div style="display: flex; flex-direction: row; align-items: center;">
		<input type="submit" value="Submit" onclick="Hello();">
		</form>
		</div>
		</center>
		</div>
	</div>
</center>
	</center>
	<br/>
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
			Ⓒ 2022 zohogroup All rights reserved</h4>
</div>
	</section>
</body>
</html>
    