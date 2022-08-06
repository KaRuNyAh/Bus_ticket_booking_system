<%@page import="com.busticket.BusModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>

<% ArrayList<BusModel> busArray = (ArrayList) request.getAttribute("busfilteredList"); %>
<% ArrayList<String> busNames = (ArrayList) request.getAttribute("busesName"); %>
<%ArrayList<String> aminitiesName = (ArrayList) request.getAttribute("aminitiesSet"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Search Bus</title>
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
#splitup div bus{
	box-sizing: 200px 200px;
	border-width: 2px;
	border-style: solid;
	color: red;
}
#advantage {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	width: 90%;
	box-shadow: 20px 20px 34px rgba(0, 0, 0, 0.5);
	height: 10hv;
	border: 2px solid black;
	align-items: flex-start;
	border-radius: 4px;
	margin: 15px;
}
.buscard{
	width: 90%;
    border: 5px solid black;
    padding: 10px;
}
#bus p{
	justify-content: space-between;
	padding: 10px;
}
.buscard div{
	display: flex;
	flex-direction: row;
    justify-content: space-between;
}
.buscard div div{
	display: flex;
	flex-direction: column;
	justify-content: flex-start; 
}
.buscard button{
	background: transparent;
	color: black;
	height: 20px;
	opacity: 1;
}
.buscard button:hover{
	opacity: 2;
	color: red;
}
.material-symbols-outlined{
	padding: 8px;
}
</style>
<!--<link rel="stylesheet" type="text/css" href="search.css">-->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

<script>
function trackFunction(x) {
      console.log("Hello")
      var tracker = document.getElementById("track"+x);
      if (tracker.style.display === "none")
        tracker.style.display = "block";
      else
        tracker.style.display = "none";
}
function aminitiesFunction(x) {
      var ami = document.getElementById("aminities"+x);
      if(ami.style.display === "none")
        ami.style.display = "block";
      else
        ami.style.display = "none";
}
function photosFunction(x) {
      var photo = document.getElementById("photos"+x);
      if(photo.style.display === "none")
        photo.style.display = "block";
      else
        photo.style.display = "none";
}
function boardFunction(x) {
      var boardings = document.getElementById("board"+x);
      if(boardings.style.display === "none")
        boardings.style.display = "block";
      else
        boardings.style.display = "none";
}
function reviewFunction(x) {
      var reviews = document.getElementById("review"+x);
      if(reviews.style.display === "none")
        reviews.style.display = "block";
      else
      reviews.style.display = "none";
}
function seatFunction(x) {
    var seater = document.getElementById("seats"+x);
    if(seater.style.display === "none")
      seater.style.display = "block";
    else
      seater.style.display = "none";
}
function restFunction(x) {
    var rests = document.getElementById("reststop"+x);
    if(rests.style.display === "none")
        rests.style.display = "block";
    else
      rests.style.display = "none";
  }
function policyFunction(x) {
    var policies = document.getElementById("policy"+x);
    if(policies.style.display === "none")
      policies.style.display = "block";
    else
      policies.style.display = "none";
}
</script>

<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
* {
  box-sizing: border-box;
}
/* Create two equal columns that floats next to each other */
.column {
  float: left;
  height: 850px; /* Should be removed. Only for demonstration */
}
.column filter{
  float: left;
  width: 20%;
  padding: 10px;
  height: 850px;
}
.column bus{
	float: left;
  width: 100%;
  padding: 10px;
  height: 850px;
  box-sizing: border-box;
  border: groove;
}
/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>
</head>

<body>
<section id="header">
	<a href="#"><img src="logo.jpg" class="logo" alt=" "></a>
	<div>
		<ul id="navbar">
			<li><a  href="index.html">Home</a></li>
			<li><a href="helpdesk.jsp">HelpDesk</a></li>
			<li><a href="manage.jsp">Manage</a></li>
			<li><a href="signin.jsp">Sign-in</a></li>
			<li><a  href="signup.jsp">Sign-up</a></li>
			<li><a href="history.jsp">History</a></li>
		</ul>
	</div>
</section>
<section id="splitup">
	<div class="row">
 	<div class="column" style="width: 20%">
    <h4>Filter</h4><br>
    <form action="DeepFilter" method="post">
    <div class="filter">
    
     ARRIVAL TIME<br><br>
  	<input type="submit" id="deptime1" name="filterbtn" value="before 6 am dep"><br>
  	<input type="submit" id="deptime2" name="filterbtn" value="6 am to 12pm dep"><br>
    <input type="submit" id="deptime3" name="filterbtn" value="12pm to 6pm dep"><br>
    <input type="submit" id="deptime4" name="filterbtn" value="after 6pm dep"><br><br>

     BUS TYPES<br><br>
 	 <input type="submit" id="bustype1" name="filterbtn" value="seater"><br>
  	 <input type="submit" id="bustype2" name="filterbtn" value="sleeper"><br>
     
     DEPATURE TIME<br><br>
	 <input type="submit" id="arrivaltime1" name="filterbtn" value="before 6 am arr"><br>
     <input type="submit" id="arrivaltime2" name="filterbtn" value="6 am to 12pm arr"><br>
     <input type="submit" id="arrivaltime3" name="filterbtn" value="12pm to 6pm arr"><br>
     <input type="submit" id="arrivaltime4" name="filterbtn" value="after 6pm arr"><br><br>

	 HIGH DEMAND<br><br>
	 <% int j=0; 
     for(String buses : busNames) { %>
	 <input type="submit" id="operator<%= j %>" name="busNames" value="<%= buses %>"><br>
	 <% j++;
    	} %>

     AMENITIES<br><br>
     <% j=0;
     for(String aminities : aminitiesName) { %>
    	<input type="submit" id="amenities<%= j %>" name="aminities" value="<%= aminities %>"><br>
    <% j++;
    	} %>
    
	</div>
	</form>
	</div>
	<div class="column" style="width: 80%; overflow-y:scroll; height:80%">
	<div class="bus" style="width: 95%">
  	<h4>Bus details</h4>
  	<%if(busArray.size()>0) {%>
  	<% for(int i=0; i<busArray.size(); i++){ %>	
  	<div class="buscard" style="width: 100%"><!-- divbuscard -->
	<div>
	<div>
	<p><%= busArray.get(i).getTravels_name() %></p>
	<p>Volvo Multi-Axle <br>I-Shift B11R <%= busArray.get(i).getSeating_type() %> :--> AC : Yes  (2+2)</p>
	</div>
	<div>
    <h5>Departure</h5>
	<p><%= busArray.get(i).getArrivalTime() %></p>
	<p><%= busArray.get(i).getDestination() %></p>
	</div>
	<div>
    <h5>Total Time</h5>  <!--  calculate total time difference-->
	<p><%= busArray.get(i).getTotal_time() %></p>
	</div>
	<div> 
    <h5>Destination</h5>
	<p><%= busArray.get(i).getDepartureTime() %></p>
	<p><%= busArray.get(i).getStartloc() %></p>
	</div>
	<div>
	</div>
    <div><h5>Fare</h5><p><%= busArray.get(i).getAmount() %></p>
    </div>
    <div><h5>Seats available</h5><p><%= busArray.get(i).getNo_of_seats() %>  </p>
    </div>
    </div>
	<div style="justify-content: flex-start; padding-bottom: 15px">
	<span class="material-symbols-outlined">bathroom</span>
	<span class="material-symbols-outlined">power</span>
	<span class="material-symbols-outlined">tips_and_updates</span>
	<span class="material-symbols-outlined">movie</span>
	<span class="material-symbols-outlined">phone_in_talk</span>
	<span class="material-symbols-outlined">departure_board</span>
	<span class="material-symbols-outlined">video_camera_front</span>
	</div>
	<div style="border-top: 1px solid black; padding-bottom: 25px;">
	<button class="open-button" onclick="trackFunction(<%= i %>)" >Track my location</button>
	<button class="open-button" onclick="aminitiesFunction(<%= i %>)">Aminities</button>
	<button class="open-button" onclick="photosFunction(<%= i %>)">Bus Photos</button>
	<button class="open-button" onclick="boardFunction(<%= i %>)">Broading & dropping points</button>
	<button class="open-button" onclick="reviewFunction(<%= i %>)">Reviews</button>
	<button class="open-button" onclick="policyFunction(<%= i %>)">Booking Policies</button>
	<button class="open-button" onclick="restFunction(<%= i %>)">RestStops</button>
	<form action="Seats">
	 	<input type="text" name="index" value="<%=i %>" style="display: none">
        <input type="text" name="busName" id="busName" value="<%= busArray.get(i).getTravels_name() %>" style="display: none">
		<input type="text" name="seaterType" value="<%= busArray.get(i).getSeating_type() %>" style="display: none">
		<input type="text" name="seatCount" value="<%= busArray.get(i).getNo_of_seats() %>" style="display: none">
		<input type="text" name="fare" value="<%= busArray.get(i).getAmount() %>" style="display: none">
		<input type="submit" class="open-button" value="View Seats" style="margin-top: 10px">
	</form>
	</div>
	<div class="buscard" id="track<%=i %>" style="width: 100%; display: none; background-color: cyan">
  	<h4>"track your bus and you can have a safety ride enjoy the journey with your bus booking system"</h4>
  	<div class="map">
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.9768308573216!2d80.05949461413401!3d12.844772921125521!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a52f7daf13e1fff%3A0x7700c0307f5b52ca!2sGuduvanchery%20bus%20stand!5e0!3m2!1sen!2sin!4v1657538411740!5m2!1sen!2sin" width="500" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	</div>
	</div>
	<div class="buscard" id="aminities<%= i %>" style="width: 100%; display: none; background-color: cyan">
 	<h4> "Amenities Available"</h4>
    <br>
    <span class="material-symbols-outlined">bathroom</span>
    <span class="material-symbols-outlined">power</span>
    <span class="material-symbols-outlined">tips_and_updates</span>
    <span class="material-symbols-outlined">movie</span>
	<span class="material-symbols-outlined">phone_in_talk</span>
	<span class="material-symbols-outlined">departure_board</span>
	<span class="material-symbols-outlined">video_camera_front</span>
	</div>
	<div class="buscard" id="photos<%= i %>" style="width: 100%; display: none; background-color: cyan">
    <h4>"Bus image"</h4>
  	<img src="busimage1.jpg"alt=""><br>
	</div>
	<div class="buscard" id="board<%= i %>" style="width: 100%; display: none; background-color: cyan">
    <h4>"pick up and drop location"<br>
    PickUp : <%= busArray.get(i).getStartloc() %><br>
    Drop : <%=busArray.get(i).getDestination() %>
    </h4>
    <br>
	</div>
	<div class="buscard" id="review<%= i %>" style="width: 100%; display: none; background-color: cyan">
  	<h4>"Nice experience"
     By Jack<br></h4>
    <br>
    </div>
	<div class="buscard" id="policy<%= i %>" style="width: 100%; display: none; background-color: cyan">
	<h4>
    "Policies:"
  	</h4>
  	<br>
	<p>Cancellation charges are computed on a per seat basis. Above cancellation fare is calculated based on seat fare of â¹2300
	Cancellation charges are calculated based on service start date + time at :15-07-2022 16:00
	For group bookings cancellation of individual seats is not allowed.
	Ticket cannot be cancelled after scheduled bus departure time from the first boarding point
	Note: Cancellation charges mentioned above are excluding GST</p>
	</div>
	<div class="buscard" id="reststop<%= i %>" style="width: 100%; display: none; background-color: cyan">
    <p>
    No of Rest Stops : 0 <br>
	Travelers Feedback:
	People Liked
	Washroom Hygiene64%
	Safety80%</p>
	</div>
	<div class="buscard" id="seats<%= i %>" style="width: 100%; display: none; background-color: cyan">
    <img src="seat1.jpg"alt="">
	<img src="seat2.jpg"alt="">
	<img src="seat3.jpg"alt="">
	<br>
	<div class="view seat notes" >
	SEAT LEGEND<br>
	AvailableUnavailableFemaleMale<br>
	REDDEAL<br>
	Get 4 % Extra OFF<br>
	Terms and Conditions::<br>
    Minimum ticket fare : INR 300<br>
	</div>
	</div>	
    </div>
    <%}%>
    <% }else { %>
   <div><img src="busnotfound.jpeg"alt="">
   </div>
   <% } %>
	</div>
	</div>
</section>

<section id="footer" >
	<div>
	<h5>About Us</h5><br>
	<p>contact us</p>
	PrintWriter out = response.getWriter();
	out.println("alert('Hello')");
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
	@ž 2022 zohogroup All rights reserved</h4>
	</div>
</section>
</body>
</html>