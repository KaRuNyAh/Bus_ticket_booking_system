<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Helpdesk</title>
	
<style>
#bodyarea {
	background-image: "service1.jpg";
	text-align: center;
	background-color: lightgrey;
}
#bodyarea div img{
	width: 80%;
	height: 400px;
}
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
	position: absolute;<!..child element..>
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
</style>
</head>

<body>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<section id="header">
	<a href="#"><img src="logo.jpg" class="logo" alt=" "></a>
	<div>
		<ul id="navbar">
			<li><a  href="index.html">Home</a></li>
			<li><a class="active" href="helpdesk.jsp">HelpDesk</a></li>
			<li><a href="manage.jsp">Manage</a></li>
			<li><a href="signin.jsp">Sign-in</a></li>
			<li><a href="signup.jsp">Sign-up</a></li>
			<li><a href="history.jsp">History</a></li>
		</ul>
   </div>
</section>

<script>
function Hello() {
	var tracker = document.getElementById("chat");
	if(tracker.value.length > 0)
		alert("Message sent !");
	else
		alert("The Message Box is Empty! Please type some chat so that our team can help you out!");
	}
</script>

<section id="bodyarea">
	<h1> 24/7 help desk</h1>
	<p>Clarify your queries right now...</p>
	<label for="chat with us">Chat Box:</label>
    <input type="text" id="chat" name="name">
    <input type = "button" onclick = "Hello();" name = "ok" value = "Click Me" />€‹
    <p>or</p>
    <a href="https://mail.google.com/mail/?view=cm&fs=1&to=bus@zoho.gmail.com">mail us at    
    <span class="material-symbols-outlined">mail</span>
    <important>bus@zoho.gmail.com</important></a>
	<div>
	<img src="service1.jpg"alt=""><br>			
	</div>
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