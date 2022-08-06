<%@page import="com.busticket.BusTicket"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<% BusTicket ticket = null; %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>manage</title>
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

</style>
</head>

<body>
<%
if(session.getAttribute("username")==null){
	response.sendRedirect("signin.jsp");
}
else {
	ticket = (BusTicket) BusTicket.getBusTicket(session.getAttribute("username").toString());
}
%>


<section id="body" ><br>
	<div class="box">
	<h1 style="font-size:3.0vw; text-align: center; margin-bottom: 20px"><%= ticket.getFrom() %> => <%= ticket.getTo() %></h1>
	</div>
	<div class="category" style="display: flex; flex-direction: row; justify-content: space-between;">
	<div style="margin: 30px">
		<h2>Bus Name</h2>
		<h4><%= ticket.getBus_name() %></h4>
		<br>
		<h2>Bus Number</h2>
		<h4><%= ticket.getBusno() %></h4>
	</div>
	<div style="margin: 30px">
		<h2>Boarding Time</h2>
		<h4><%= ticket.getDep_time() %></h4>
		<br>
		<h2>Destination Time</h2>
	<h4><%= ticket.getArr_time() %></h4>
	</div>
	<div style="margin: 30px">
		<h2>Seat Numbers</h2>
		<h4><%= ticket.getTick_count()%> Ticket(s) -> <%= ticket.getSeat_no() %></h4>
		<br>
		<h2>Amount</h2>
		<h4><%= ticket.getFare() %>/-</h4>
	</div>
	<div style="margin: 30px">
		<img alt="Image Qr Scan" src="qr.jpg">
	</div>
	</div>
</section>
<form action="Cancel">
	<input type="hidden" style="dsiplay: none;" name="ticketId" id="ticketid" value="<%out.print(ticket.getTicket_id()); %>" />
	<h3>Are you sure you want to cancel...<button onclick="cancel()">Cancel</button></h3>
</form>
<script>
function cancel() {
	 alert("Ticket cancelled !\nThank you!");
}
document.getElementById("ticketid").value = <%=ticket.getTicket_id()%>;
</script>

</body>
</html>