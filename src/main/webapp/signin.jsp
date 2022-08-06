<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>sign-in</title>
<style>
#bodyarea{
  display: flex;
  color: red;
  font-size: 40px;
}
#bodyarea.button{
  box-sizing: 40px;
  display: block;
  flex-direction: column;
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
  width:100%;
  display: flex;
  flex-direction: row;
}
#footer div{
  padding: 40px;
  width:100%;
}
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 10%;
  border-radius: 10%;
  height: 100px;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
<!--<link rel="stylesheet" type="text/css" href="signin.css">-->
<section id="header">
	<a href="#"><img src="logo.jpg" class="logo" alt=" "></a>
	<div>
		<ul id="navbar">
			<li><a  href="index.html">Home</a></li>
			<li><a href="helpdesk.jsp">HelpDesk</a></li>
			<li><a href="manage.jsp">Manage</a></li>
			<li><a class="active" href="signin.jsp">Sign-in</a></li>
			<li><a href="signup.jsp">Sign-up</a></li>
            <li><a href="history.jsp">History</a></li>
		</ul>
    </div>
</section>
</head>

<body>

<h2>Sign-in</h2>

	<form action="Login" >
	  <div class="imgcontainer">
	  <img src="signin1.png" alt="Avatar" class="avatar">
	  </div>
	  <div class="container">
	  
	    <label for="uname"><b>Username</b></label>
	    <input type="text" placeholder="Enter Username" name="uname" >
	
	    <label for="psw"><b>Password</b></label>
	    <input type="password" placeholder="Enter Password" name="psw" >
	    
	        
	    <button type="submit">Login</button>
	    
	    <label><input type="checkbox" checked="checked" name="remember"> Remember me</label>
	  </div>
	  <div class="container" style="background-color:#f1f1f1">
	  <span class="psw">Forgot <a href="#">password?</a></span>
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