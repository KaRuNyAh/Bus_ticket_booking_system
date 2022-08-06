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
  <title>Sleeper selection</title>
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
  max-width: 450px;
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
  margin-right: 20%;
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
  line-height: 7rem;
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
<style>
*, *:before, *:after {
  box-sizing: border-box;
}

html {
  font-size: 16px;
}

.plane {
  margin: 10px auto;
  max-width: 450px;
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

.seatss {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: flex-start;
}

.seats {
  display: flex;
  flex: 0 0 20%;
  padding: 5px;
  position: relative;
}
.seats:nth-child(2) {
  margin-right: 20%;
}
.seats input[type=checkbox] {
  position: absolute;
  opacity: 0;
}
.seats input[type=checkbox]:checked + label {
  background: #bada55;
  -webkit-animation-name: rubberBand;
  animation-name: rubberBand;
  animation-duration: 300ms;
  animation-fill-mode: both;
}
.seats input[type=checkbox]:disabled + label {
  background: #dddddd;
  text-indent: -9999px;
  overflow: hidden;
}
.seats input[type=checkbox]:disabled + label:after {
  content: "X";
  text-indent: 0;
  position: absolute;
  top: 4px;
  left: 50%;
  transform: translate(-50%, 0%);
}
.seats input[type=checkbox]:disabled + label:hover {
  box-shadow: none;
  cursor: not-allowed;
}
.seats label {
  display: block;
  position: relative;
  width: 100%;
  text-align: center;
  font-size: 14px;
  font-weight: bold;
  line-height: 7rem;
  padding: 4px 3px;
  background: #F42536;
  border-radius: 5px;
  animation-duration: 300ms;
  animation-fill-mode: both;
}
.seats label:before {
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
.seats label:hover {
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
    	window.location.href="sleeper.jsp";
    }
    </script>
</head>
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
<body>
<div class="plane">
        <h3>Sleeper Selection-lower berth</h3>
      <div class="fuselage">
      </div>
      <ol class="cabin fuselage">
        <li class="row row--1">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="1A" onclick="myFunction('1A')" />
              <label for="1A">1A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="1B" onclick="myFunction('1B')"  />
              <label for="1B">1B</label>
            </li>
            <li class="seat">
              <input type="checkbox" disabled id="1D" onclick="myFunction('1D')"/>
              <label for="1D">Occupied</label>
            </li>
          </ol>
        </li>
        <li class="row row--2">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="2A" onclick="myFunction('2A')"/>
              <label for="2A">2A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="2B" onclick="myFunction('2B')" />
              <label for="2B">2B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="2D" onclick="myFunction('2D')"/>
              <label for="2D">2D</label>
            </li>
          </ol>
        </li>
        <li class="row row--3">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="3A" onclick="myFunction('3A')"/>
              <label for="3A">3A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="3B" onclick="myFunction('3B')"/>
              <label for="3B">3B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="3D" onclick="myFunction('3D')"/>
              <label for="3D">3D</label>
            </li>
            </li>
          </ol>
        </li>
        <li class="row row--4">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="4A" onclick="myFunction('4A')" />
              <label for="4A">4A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="4B" onclick="myFunction('4B')" />
              <label for="4B">4B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="4D" onclick="myFunction('4D')" />
              <label for="4D">4D</label>
            </li>
          </ol>
        </li>
        <li class="row row--5">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="5A" onclick="myFunction('5A')"/>
              <label for="5A">5A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="5B" onclick="myFunction('5B')"/>
              <label for="5B">5B</label>
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
              <input type="checkbox" id="6A" onclick="myFunction('6A')"/>
              <label for="6A">6A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="6B" onclick="myFunction('6B')" />
              <label for="6B">6B</label>
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
              <input type="checkbox" id="7A" onclick="myFunction('7A')"/>
              <label for="7A">7A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="7B" onclick="myFunction('7B')" />
              <label for="7B">7B</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="7D" onclick="myFunction('7D')" />
              <label for="7D">7D</label>
            </li>
          </ol>
        </li>
      </ol>
      <div class="fuselage">
      </div>
    </div>
    <div class="plane">
        <h3>Sleeper Selection-upper berth</h3>
      <div class="fuselage">
      </div>
      <ol class="cabin fuselage">
        <li class="row row--1">
          <ol class="seatss" type="A">
            <li class="seat">
              <input type="checkbox" id="1AU" onclick="myFunction('1AU')" />
              <label for="1AU">1AU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="1BU" onclick="myFunction('2BU')" />
              <label for="1BU">1BU</label>
            </li>
            <li class="seats">
              <input type="checkbox" disabled id="1DU" onclick="myFunction('1CU')" />
              <label for="1DU">Occupied</label>
            </li>
          </ol>
        </li>
        <li class="row row--2">
          <ol class="seatss" type="A">
            <li class="seats">
              <input type="checkbox" id="2AU" onclick="myFunction('2AU')"  />
              <label for="2A">2A</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="2BU" onclick="myFunction('2BU')" />
              <label for="2BU">2BU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="2DU"  onclick="myFunction('2CU')" />
              <label for="2DU">2DU</label>
            </li>
          </ol>
        </li>
        <li class="row row--3">
          <ol class="seatss" type="A">
            <li class="seats">
              <input type="checkbox" id="3AU" onclick="myFunction('3AU')" />
              <label for="3AU">3AU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="3BU" onclick="myFunction('3BU')"  />
              <label for="3BU">3BU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="3DU" onclick="myFunction('3CU')"  />
              <label for="3DU">3DU</label>
            </li>
            </li>
          </ol>
        </li>
        <li class="row row--4">
          <ol class="seatss" type="A">
            <li class="seats">
              <input type="checkbox" id="4AU" onclick="myFunction('4AU')" />
              <label for="4AU">4AU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="4BU" onclick="myFunction('4BU')" />
              <label for="4BU">4BU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="4DU" onclick="myFunction('4CU')" />
              <label for="4DU">4DU</label>
            </li>
          </ol>
        </li>
        <li class="row row--5">
          <ol class="seatss" type="A">
            <li class="seats">
              <input type="checkbox" id="5AU" onclick="myFunction('5AU')"  />
              <label for="5AU">5AU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="5BU" onclick="myFunction('5BU')"  />
              <label for="5BU">5BU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="5DU" onclick="myFunction('5CU')" />
              <label for="5DU">5DU</label>
            </li>
          </ol>
        </li>
        <li class="row row--6">
          <ol class="seatss" type="A">
            <li class="seats">
              <input type="checkbox" id="6AU"  onclick="myFunction('6AU')" />
              <label for="6AU">6AU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="6BU"  onclick="myFunction('6BU')"/>
              <label for="6BU">6BU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="6DU"  onclick="myFunction('6CU')"/>
              <label for="6DU">6DU</label>
            </li>
          </ol>
        </li>
        <li class="row row--7">
          <ol class="seatss" type="A">
            <li class="seats">
              <input type="checkbox" id="7AU" onclick="myFunction('7AU')" />
              <label for="7AU">7AU</label>
            </li>
            <li class="seats">
              <input type="checkbox" id="7BU"  onclick="myFunction('7BU')"/>
              <label for="7BU">7BU</label>
            </li>
           <li class="seats">
              <input type="checkbox" id="7DU"  onclick="myFunction('7DU')"/>
              <label for="7DU">7DU</label>
            </li>
          </ol>
        </li>
       </ol> <h3 id="wrapper" ></h3>
    
      <div class="fuselage" style="display: flex; flex-direction: row">
      <form action="Payment">
	      <input type="text" name="array" id="array" style="display: none">
	      <input type="text" name="amount" id="amount" style="display: none">
	      <input type="text" name="busName" id="busName" value="<%= busName %>" style="display: none">
	      <input type="submit" value="Payment">
      </form>
    </div>
    
  </body>
  </html>