<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% int flag = Integer.parseInt(request.getAttribute("flag").toString()); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">		
	<title>Bus Booking System</title><link rel = "icon" href = "adv1.jpg"type = "icon">
	<link rel="stylesheet" type="text/css" href="style.css">
	
<script type="text/javascript">
	window.onload = function(){alert('message\n\nCauses : \n\n1. Check your Date of Travel\n2. Enter the From Point and To Point\n 3. From and To should not be same')}
</script>
</head>

<body>
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

<form action="Search">
<section id="hero">
	<h4>Enter the source and destination</h4>
    <label for="From">FROM:</label>
	<input type="text" placeholder="Enter from" id="From" name="From">
	<label for="To">TO:</label>
	<input type="text" placeholder="Enter TO" id="To" name="To">
	<label for="Date">Date:</label>
	<input type="Date" id="Date" name="Date">
	<br>
	<!--  <a  href="search.html" target="_blank"><button>Search</button></a> -->
	<input type="submit" value="Search" style="background-color: white">
</section>
</form>

<section id="coupons">
	<center>
	<h3>COUPONS</h3>
	<h4>Book tickets now and get coupons!</h4>
	<div class="coup-img"><img src="coupon1.png" alt=""><br><br><br><br><br>
	<img src="coupon2.jpg" alt=""><br><br><br><br><br>
	</div>
	<div class="coup-img">
	<img src="coupon3.jpg" alt=""><br><br><br><br><br><br>
	</div>
	<h2> Happy Travelling! </h2>
	<p style="font-size:48px"></p>
	</center>
</section>

<section id="TrackMybus">
	<center>
	<div class="head1">
	<h3>Track your bus now..</h3>
	</div>
	<div class="head2">
	<h4>"track your bus and you can have a safety ride enjoy the journey with your bus booking system"
	</h4>
	</div>
	<div class="map">
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.9768308573216!2d80.05949461413401!3d12.844772921125521!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a52f7daf13e1fff%3A0x7700c0307f5b52ca!2sGuduvanchery%20bus%20stand!5e0!3m2!1sen!2sin!4v1657538411740!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	</div>
	</center>
</section>

<h2>Advantages of booking in this application</h2>	

<section id="advantage">
	<div class=advbox>
	<img src="adv1.jpg"alt=""><br>
	easy to book tickets only
	</div>
	<div class=advbox>
	<img src="adv2.png"alt=""><br>
	no cancellation fee
	</div>
	<div class=advbox>
	<img src="adv3.jpg"alt=""><br>
	100% insured
	</div>
	<div class=advbox>
	<img src="adv4.png"alt=""><br>
	verified drivers
	</div>
	<div class=advbox>
	<img src="adv6.jpg"alt=""><br>
	mobile supported
	</div>
</section>

<section id="procedure">
	<div class="steps">
		<b><b>
		<paragragh><b><b>
		<u><h2>	Steps to be followed for booking tickets online:</h2><br></u>
		<h3>1.Enter the Source and Destination locations in the “From” and “To” tab respectively.<br>
		2.Enter the “Date of Journey” and hit the “Search” button to check available bus tickets online.<br>
		3.Select a bus of your choice from the list of buses that are displayed.<br>
		4.Select a seat, boarding, and dropping points and hit “Proceed to Book” for final bus booking.<br>
		5.Fill in the “Passenger Information” and “Contact Information”.<br>
		6.You can even choose to insure your bus booking so that you will be covered in case of an accident or loss of luggage and then click “Proceed to Pay”.<br>
		7.Enter the offer code (if applicable), select your mode of payment and complete the payment procedure for bus tickets online.<br>
		8.Once this is done, you will receive an M-ticket on your mobile and an e-ticket on the email ID that was entered under “Contact Information.”<br></h3>
		</paragragh>
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
	@ 2022 zohogroup All rights reserved</h4>
	</div>
</section>
</body>
</html>

