<%@page import="com.busticket.BusTicket"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<% ArrayList<BusTicket> tickets = null; %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ticket</title>
	
<script type="text/javascript">
$(docuent).ready(function(){
	function disablePrev(){ window.history.forward()}
		window.onload = diablePrev();
		window.onpageshow = function(evt) {if(evt.persisted) disableBack()}
	});
</script>
	
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

<%
if(session.getAttribute("username")==null){
	response.sendRedirect("signin.jsp");
}
else {
	tickets = (ArrayList<BusTicket>) BusTicket.getAllTicket(session.getAttribute("username").toString());
}
%>
</style>
<!--<link rel="stylesheet" type="text/css" href="history.css">-->
</head>

<body>
<section id="header">
	<a href="#"><img src="logo.jpg" class="logo" alt=" "></a>
	<div>
		<ul id="navbar">
			<li><a  href="index.html">Home</a></li>
			<li><a href="helpdesk.jsp">HelpDesk</a></li>
			<li><a  href="manage.jsp">Manage</a></li>
			<li><a href="signin.jsp">Sign-in</a></li>
			<li><a href="signup.jsp">Sign-up</a></li>
			<li><a href="history.jsp">History</a></li>
		</ul>
    </div>
</section><br>
<% if(tickets!=null){
int size=tickets.size()-1 ;
 for(int i=size;i>=0;i--) { %>
	<section id="body" ><br>
	<div class="box">
	<h1 style="font-size:3.0vw; text-align: center; margin-bottom: 20px"><%= tickets.get(i).getFrom() %> => <%= tickets.get(i).getTo() %></h1>
	</div>
	<div class="category" style="display: flex; flex-direction: row; justify-content: space-between;">
	<div style="margin: 30px">
		<h2>Bus Name</h2>
		<h4><%= tickets.get(i).getBus_name() %></h4>
		<br>
		<h2>Bus Number</h2>
		<h4><%= tickets.get(i).getBusno() %></h4>
	</div>
	<div style="margin: 30px">
		<h2>Boarding Time</h2>
		<h4><%= tickets.get(i).getDep_time() %></h4>
		<br>
		<h2>Destination Time</h2>
	<h4><%= tickets.get(i).getArr_time() %></h4>
	</div>
	<div style="margin: 30px">
		<h2>Seat Numbers</h2>
		<h4><%= tickets.get(i).getTick_count()%> Ticket(s) -> <%= tickets.get(i).getSeat_no() %></h4>
		<br>
		<h2>Amount</h2>
		<h4><%= tickets.get(i).getFare() %>/-</h4>
	</div>
	<div style="margin: 30px">
		<img alt="Image Qr Scan" src="qr.jpg">
	</div>
	</div>
</section>
<% } } else {%>
	<h2> No Tickets have been booked!</h2>
<% } %>


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