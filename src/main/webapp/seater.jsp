<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>

<%  int amount = Integer.parseInt(request.getAttribute("fare").toString()); %>
<% String busName = request.getAttribute("busName").toString(); %>
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Seat selection</title>
  
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
*, *:before, *:after {
  box-sizing: border-box;
}

html {
  font-size: 16px;
}

.plane {
  margin: 30px auto;
  max-width: 450px;<!--for seat expanding-->
}

.exit {
  position: relative;
  height: 50px;
}
.exit:before, .exit:after {
  content: "EXIT";
  font-size: 14px;
  line-height: 18px;
  padding: 0px 2px;
  font-family: "Arial Narrow", Arial, sans-serif;
  display: block;
  position: absolute;
  background: green;
  color: white;
  top: 50%;
  transform: translate(0, -50%);
}
.exit:before {
  left: 0;
}
.exit:after {
  right: 0;
}

.fuselage {
  border-right: 0px solid #d8d8d8;
  border-left: 0px solid #d8d8d8;
}

ol {
  list-style: none;
  padding: 10px;
  margin: 10px;
}

.seats {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: flex-start;
}

.seat {
  display: flex;
  flex: 0 0 20%;
  padding: 5px;
  position: relative;
}
.seat:nth-child(2) {
  margin-right: 20%;<!--seat extension-->
}
.seat input[type=checkbox] {
  position: absolute;
  opacity: 0;
}
.seat input[type=checkbox]:checked + label {
  background: #bada55;
  -webkit-animation-name: rubberBand;
  animation-name: rubberBand;
  animation-duration: 300ms;
  animation-fill-mode: both;
}
.seat input[type=checkbox]:disabled + label {
  background: #dddddd;
  text-indent: -9999px;
  overflow: hidden;
}
.seat input[type=checkbox]:disabled + label:after {
  content: "X";
  text-indent: 0;
  position: absolute;
  top: 4px;
  left: 50%;
  transform: translate(-50%, 0%);
}
.seat input[type=checkbox]:disabled + label:hover {
  box-shadow: none;
  cursor: not-allowed;
}
.seat label {
  display: block;
  position: relative;
  width: 100%;
  text-align: center;
  font-size: 14px;
  font-weight: bold;
  line-height: 1.5rem;
  padding: 4px 3px;
  background: #F42536;
  border-radius: 5px;
  animation-duration: 300ms;
  animation-fill-mode: both;
}
.seat label:before {
  content: "";
  position: absolute;
  width: 75%;
  height: 75%;
  top: 1px;
  left: 50%;
  transform: translate(-50%, 0%);
  background: rgba(255, 255, 255, 0.4);
  border-radius: 3px;
}
.seat label:hover {
  cursor: pointer;
  box-shadow: 0 0 0px 2px #5C6AFF;
}

@-webkit-keyframes rubberBand {
  0% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
    transform: scale3d(1.25, 0.75, 1);
  }
  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
    transform: scale3d(0.75, 1.25, 1);
  }
  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
    transform: scale3d(1.15, 0.85, 1);
  }
  65% {
    -webkit-transform: scale3d(0.95, 1.05, 1);
    transform: scale3d(0.95, 1.05, 1);
  }
  75% {
    -webkit-transform: scale3d(1.05, 0.95, 1);
    transform: scale3d(1.05, 0.95, 1);
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
}
@keyframes rubberBand {
  0% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
    transform: scale3d(1.25, 0.75, 1);
  }
  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
    transform: scale3d(0.75, 1.25, 1);
  }
  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
    transform: scale3d(1.15, 0.85, 1);
  }
  65% {
    -webkit-transform: scale3d(0.95, 1.05, 1);
    transform: scale3d(0.95, 1.05, 1);
  }
  75% {
    -webkit-transform: scale3d(1.05, 0.95, 1);
    transform: scale3d(1.05, 0.95, 1);
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
}
.rubberBand {
  -webkit-animation-name: rubberBand;
  animation-name: rubberBand;
}
</style>

<script>
    var k=0;
    const seating = [];
    let seats = '';
    var i=0;
    var amount = 0;
    
    function myFunction(x) {   	 
    	seats += x+',';
        document.getElementById("array").value = seats;
        seating.push(x);
        calculate();
    }
    
    function calculate(){
    	i = 0;
    	//document.writeln(k);
    	const n = seating.reduce(function (acc, curr){
    		return acc[curr] ? ++acc[curr] : acc[curr] = 1, acc
    }, {}); 
    	
    for(let key in n){
    		if(n[key]%2 !== 0){
    			i++;
    		}
    }
   	amount = <%= amount %> * i;
   	console.log(amount);
   	document.getElementById("amount").value = amount;
    document.getElementById("wrapper").innerHTML="Amount to be paid "+amount+ " Rs";
   	}
    function redirect(){
    	window.location.href="seater.jsp";
    }
</script>
</head>

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
<div class="plane">
    <h1>Seat Selection</h1>
      <div class="fuselage">
      </div>
      <ol class="cabin fuselage">
        <li class="row row--1">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="1A" value="1A" onclick="myFunction('1A')"/>
              <label for="1A">1A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="1B" onclick="myFunction('1B')"/>
              <label for="1B">1B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="1C" onclick="myFunction('1C')" />
              <label for="1C">1C</label>
            </li>
            <li class="seat">
              <input type="checkbox" disabled id="1D" onclick="myFunction('1D')" />
              <label for="1D">Occupied</label>
            </li>
          
          </ol>
        </li>
        <li class="row row--2">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="2A" onclick="myFunction('2A')" />
              <label for="2A">2A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="2B" onclick="myFunction('2B')" />
              <label for="2B">2B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="2C"  onclick="myFunction('2C')"/>
              <label for="2C">2C</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="2D" onclick="myFunction('2D')"/>
              <label for="2D">2D</label>
            </li>
          </ol>
        </li>
        <li class="row row--3">
          <ol class="seat" type="A">
            <li class="seat">
              <input type="checkbox" id="3A" onclick="myFunction('3A')" />
              <label for="3A">3A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="3B" onclick="myFunction('3B')"/>
              <label for="3B">3B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="3C" onclick="myFunction('3C')" />
              <label for="3C">3C</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="3D"  onclick="myFunction('3D')"/>
              <label for="3D">3D</label>
            </li>
            </li>
          </ol>
        </li>
        <li class="row row--4">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="4A" onclick="myFunction('4A')"/>
              <label for="4A">4A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="4B"onclick="myFunction('4B')"  />
              <label for="4B">4B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="4C" onclick="myFunction('4C')" />
              <label for="4C">4C</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="4D" onclick="myFunction('4D')"/>
              <label for="4D">4D</label>
            </li>
           
          </ol>
        </li>
        <li class="row row--5">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="5A" onclick="myFunction('5A')" />
              <label for="5A">5A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="5B" onclick="myFunction('5B')"/>
              <label for="5B">5B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="5C" onclick="myFunction('5C')" />
              <label for="5C">5C</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="5D" onclick="myFunction('5D')" />
              <label for="5D">5D</label>
            </li>
          </ol>
        </li>
        <li class="row row--6">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="6A" onclick="myFunction('6A')" />
              <label for="6A">6A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="6B" onclick="myFunction('6B')"/>
              <label for="6B">6B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="6C" onclick="myFunction('6C')"/>
              <label for="6C">6C</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="6D" onclick="myFunction('6D')"/>
              <label for="6D">6D</label>
            </li>
          </ol>
        </li>
        <li class="row row--7">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="7A"onclick="myFunction('7A')" />
              <label for="7A">7A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="7B"  onclick="myFunction('7B')"/>
              <label for="7B">7B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="7C"onclick="myFunction('7C')" />
              <label for="7C">7C</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="7D"onclick="myFunction('7D')" />
              <label for="7D">7D</label>
            </li>
          </ol>
        </li>
        <li class="row row--8">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="8A"onclick="myFunction('8A')" />
              <label for="8A">8A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="8B" onclick="myFunction('8B')"/>
              <label for="8B">8B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="8C" onclick="myFunction('8C')"/>
              <label for="8C">8C</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="8D"onclick="myFunction('8D')" />
              <label for="8D">8D</label>
            </li>
          </ol>
        </li>
        <li class="row row--9">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="9A" onclick="myFunction('9A')"/>
              <label for="9A">9A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="9B"onclick="myFunction('9B')" />
              <label for="9B">9B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="9C" onclick="myFunction('9C')" />
              <label for="9C">9C</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="9D"  onclick="myFunction('9D')"/>
              <label for="9D">9D</label>
            </li>
           </ol>
        </li>
        <li class="row row--10">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="10A" onclick="myFunction('10A')" />
              <label for="10A">10A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="10B" onclick="myFunction('10B')" />
              <label for="10B">10B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="10C"  onclick="myFunction('10C')"/>
              <label for="10C">10C</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="10D" onclick="myFunction('10D')"/>
              <label for="10D">10D</label>
            </li>
         </ol>
        </li>
      </ol>
     <h3 id="wrapper" ></h3>
      <div class="fuselage" style="display: flex; flex-direction: row">
      <form action="Payment">
	      <input type="text" name="array" id="array" style="display: none">
	      <input type="text" name="amount" id="amount" style="display: none">
	      <input type="text" name="busName" id="busName" value="<%= busName %>" style="display: none">
	      <input type="submit" value="Payment">
      </form>
      </div>
      </div>
      
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
	@2022 zohogroup All rights reserved</h4>
	</div>
</section>
</body>
</html>