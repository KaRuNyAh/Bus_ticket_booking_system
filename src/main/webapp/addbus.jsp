<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Add bus</title>

<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
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
		<li><a class="active" href="signup.jsp">Sign-up</a></li>
        <li><a href="history.jsp">History</a></li>
		</ul>
	</div>
</section>


<form action="AddBus" style="border:1px solid #ccc">
  <div class="container">
  <h1>Add bus</h1>
  <p>Enter the bus details.</p>
  <hr>

    <label for="bus no"><b>Bus no</b></label>
    <input type="text" placeholder="Enter bus no" name="busno" required>
    
    <label for="bus name"><b>Bus name</b></label>
    <input type="text" placeholder="Enter bus name" name="busname" required>
    
    <label for="gps"><b>Gps</b></label>
    <input type="text" placeholder="Enter gps url" name="gps" required>
    
     Amenities<br>
    <label>
    <input type="checkbox"  name="amenities" value="wifi" style="margin-bottom:15px"> wifi
    </label>
    
    <label>
    <input type="checkbox" name="amenities" value="movie" style="margin-bottom:15px"> movie
    </label>
    
    <label>
    <input type="checkbox" name="amenities" value="blanket" style="margin-bottom:15px"> blanket
    </label>
    
    <label>
    <input type="checkbox" name="amenities"  value="waterbottle" style="margin-bottom:15px"> water bottle
    </label>
    
    <label>
    <input type="checkbox" name="amenities" value="chargingpoint" style="margin-bottom:15px">charging point
    </label>
    
    <div>
      <input type="checkbox" id="other" name="interest" value="other" >
      <label for="other">Other</label>
      <input type="text" id="otherValue" placeholder="Enter here to add amenities " name="other" style="width:90%">
    </div>
    <br>
    
    <label for="image"><b>Image Url</b></label>
    <input type="text" placeholder="Enter Image Url" name="imageurl" required>
    
    <label for="no_of_seats"><b>No of seats</b></label>
    <input type="text" placeholder="Enter no_of_seats" name="no_of_seats" required>
    
    <label for="seating_type"><b>Seating type</b></label>
    <input type="text" placeholder="Enter seating_type" name="seating_type" required>
    
    <div class="clearfix">
    <button onclick="myFunction()">Add session</button>

	<script>
    function myFunction() {
		 alert("Bus added successfully !\nThank you!");  
    }

    </script>
    </div>
  </div>
</form>

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
		@¸ 2022 zohogroup All rights reserved</h4>
	</div>
	</section>
</body>
</html>