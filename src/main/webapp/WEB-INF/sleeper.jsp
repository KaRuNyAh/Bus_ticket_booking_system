<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Seat selection</title>
    <style>
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
</head>
<body>
<div class="plane">
        <h1>Seat Selection</h1>
      <div class="fuselage">
        
      </div>
      <ol class="cabin fuselage">
        <li class="row row--1">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="1A" />
              <label for="1A">1A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="1B" />
              <label for="1B">1B</label>
            </li>
            
            <li class="seat">
              <input type="checkbox" disabled id="1D" />
              <label for="1D">Occupied</label>
            </li>
          
          </ol>
        </li>
        <li class="row row--2">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="2A" />
              <label for="2A">2A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="2B" />
              <label for="2B">2B</label>
            </li>
            
            <li class="seat">
              <input type="checkbox" id="2D" />
              <label for="2D">2D</label>
            </li>
          </ol>
        </li>
        <li class="row row--3">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="3A" />
              <label for="3A">3A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="3B" />
              <label for="3B">3B</label>
            </li>
            
            <li class="seat">
              <input type="checkbox" id="3D" />
              <label for="3D">3D</label>
            </li>
            
            </li>
          </ol>
        </li>
        <li class="row row--4">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="4A" />
              <label for="4A">4A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="4B" />
              <label for="4B">4B</label>
            </li>
           
            <li class="seat">
              <input type="checkbox" id="4D" />
              <label for="4D">4D</label>
            </li>
           
          </ol>
        </li>
        <li class="row row--5">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="5A" />
              <label for="5A">5A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="5B" />
              <label for="5B">5B</label>
            </li>
            
            <li class="seat">
              <input type="checkbox" id="5D" />
              <label for="5D">5D</label>
            </li>
          
          </ol>
        </li>
        <li class="row row--6">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="6A" />
              <label for="6A">6A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="6B" />
              <label for="6B">6B</label>
            </li>
            
            <li class="seat">
              <input type="checkbox" id="6D" />
              <label for="6D">6D</label>
            </li>
            
          </ol>
        </li>
        <li class="row row--7">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="7A" />
              <label for="7A">7A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="7B" />
              <label for="7B">7B</label>
            </li>
           
            <li class="seat">
              <input type="checkbox" id="7D" />
              <label for="7D">7D</label>
            </li>
           
          </ol>
        </li>
       
       
      
      </ol>
      <div class="fuselage">
        
      </div>
    </div>
    <div class="plane">
        <h1>Seat Selection</h1>
      <div class="fuselage">
        
      </div>
      <ol class="cabin fuselage">
        <li class="row row--1">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="1A" />
              <label for="1A">1A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="1B" />
              <label for="1B">1B</label>
            </li>
            
            <li class="seat">
              <input type="checkbox" disabled id="1D" />
              <label for="1D">Occupied</label>
            </li>
          
          </ol>
        </li>
        <li class="row row--2">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="2A" />
              <label for="2A">2A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="2B" />
              <label for="2B">2B</label>
            </li>
            
            <li class="seat">
              <input type="checkbox" id="2D" />
              <label for="2D">2D</label>
            </li>
          </ol>
        </li>
        <li class="row row--3">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="3A" />
              <label for="3A">3A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="3B" />
              <label for="3B">3B</label>
            </li>
            
            <li class="seat">
              <input type="checkbox" id="3D" />
              <label for="3D">3D</label>
            </li>
            
            </li>
          </ol>
        </li>
        <li class="row row--4">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="4A" />
              <label for="4A">4A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="4B" />
              <label for="4B">4B</label>
            </li>
           
            <li class="seat">
              <input type="checkbox" id="4D" />
              <label for="4D">4D</label>
            </li>
           
          </ol>
        </li>
        <li class="row row--5">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="5A" />
              <label for="5A">5A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="5B" />
              <label for="5B">5B</label>
            </li>
            
            <li class="seat">
              <input type="checkbox" id="5D" />
              <label for="5D">5D</label>
            </li>
          
          </ol>
        </li>
        <li class="row row--6">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="6A" />
              <label for="6A">6A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="6B" />
              <label for="6B">6B</label>
            </li>
            
            <li class="seat">
              <input type="checkbox" id="6D" />
              <label for="6D">6D</label>
            </li>
            
          </ol>
        </li>
        <li class="row row--7">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="7A" />
              <label for="7A">7A</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="7B" />
              <label for="7B">7B</label>
            </li>
           
            <li class="seat">
              <input type="checkbox" id="7D" />
              <label for="7D">7D</label>
            </li>
           
          </ol>
        </li>
       
       
      
      </ol>
      <div class="fuselage">
        
      </div>
    </div>
  </body>

  </html>