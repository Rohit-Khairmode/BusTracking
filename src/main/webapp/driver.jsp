<%-- 
    Document   : driver
    Created on : 01-Mar-2024, 3:01:49 pm
    Author     : ROHIT
--%>

<%@page import="com.learn.bustracking.dao.LocationDao"%>
<%@page import="com.learn.bustracking.entities.Bus"%>
<%@page import="com.learn.bustracking.entities.User"%>
<%@page import="com.learn.bustracking.entities.Driver"%>
<%@page import="com.learn.bustracking.dao.DriverDao"%>
<%@page import="com.learn.bustracking.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Driver driver = (Driver) session.getAttribute("current-driver");
if(driver == null){
        session.setAttribute("message", "you are not logged in as driver !! Login first");
        response.sendRedirect("driverLogin.jsp");
        return;
    }
Bus driverBus = driver.getBus();
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Driver Page</title>
    <link
      rel="stylesheet"
      href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
      integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
      crossorigin=""
    />
    <script
      defer
      src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
      integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
      crossorigin=""
    ></script>
    <%@include file="Components/common_css_js.jsp" %>
    <style>
      #map {
        flex: 1;
        height: 100%;
        background-color: #aaa;
      }
      .popup {
        background-color: #fff;
        text-align: center;
        font-size: 1.3rem;
      }
      .start{
          background-color: white;
          color:black;
          border: 1px solid black;
      }
      .stop{
          background-color: white;
          color:black;
          border: 1px solid black;
      }
      .stop:hover{
          background-color: red;
          color:#fff;
          border: 1px solid red;
          cursor:pointer;
      }
      .start:hover{
          background-color: green;
          color:#fff;
          border: 1px solid green;
          cursor:pointer;
      }
      .location_status{
          margin-top:4px;
      }
    </style>
  </head>
  <body style="overflow: scroll">
    <header>
       <%@include file="Components/navbar.jsp" %>
    </header>
    <div class="container">
      <div class="row mt-4">
        <div class="col-md-4">
          <div class="card bus-card">
            <div class="container text-center">
              <img
                class="card-img-top m-2"
                src="img/Buses/<%=driverBus.getBusPic()%>"
                style="max-height: 200px; max-width: 100%; width: auto"
              />
            </div>
            <div class="card-body" style="cursor: auto">
              <h5 class="bus-name">Bus Name:<span> <%= driverBus.getBusName() %></span></h5>
                            
                            <h5 class="bus-number">Bus Number: <%= driverBus.getBusNumber() %></h5>
                            <h5 class="bus-number">Driver Name: <%= driverBus.getDriver().getDriverName() %></h5>
                            <h5 class="bus-number">Driver contact number :<%= driverBus.getDriver().getDriverPhone() %></h5>
                            <div style="margin-top: 20px;">
                            <h5 >Bus Route</h5>
                            <p class="bus-route " style="font-size: 20px;"><%= driverBus.getBusRoute() %></p>
                            </div>
            </div>
          </div>
        </div>
        <div class="col-md-8">
            <div class="container mt-2">
            <button class="start btn ">Start Sharing Location</button>
            <button class="stop btn" value="<%=driver.getDriverId() %>">Stop Sharing Location</button>
            <p class='location-status'>Location sharing is not start Yet!!</p>
            </div>
            <h2>To render map Start sharing Your location</h2>
          <div id="map" style="height: 100vh">
          </div>
        </div>
      </div>
    </div>

    <script>
      const startBtn = document.querySelector('.start');
      let locationSendingInterval=null;
      const stopBtn = document.querySelector('.stop');
      const mapContainer = document.querySelector('#map');
      let map =null;//map object of leaflet
      stopBtn.disabled = true;
      stopBtn.style.cursor='not-allowed';
      const locationStatus = document.querySelector('.location-status');
      

      const getPosition = function () {
        return new Promise(function (resolve, reject) {
          navigator.geolocation.getCurrentPosition(resolve, function () {
            alert('Unable to get location');
          });
        });
      };

      const gettingPos = async function () {
          startBtn.disabled = true;
          stopBtn.disabled = false;
          stopBtn.style.cursor='pointer';
          startBtn.textContent = "Started sending location";
          locationStatus.textContent = "Started sending the location";
          startBtn.style.backgroundColor = '#f00';
          startBtn.style.color = '#fff';
          startBtn.style.cursor = 'not-allowed';
        const location = await getPosition();
        const timestamp = location.timestamp;
        const { latitude, longitude } = location.coords;
        const addressRes = await fetch(
          'https://geocode.maps.co/reverse?lat=' +
            latitude +
            '&lon=' +
            longitude +
            '&api_key=65e2f00cbcd13268629964lpdb90572'
        );
        const addressData = await addressRes.json();
        const address = addressData.display_name;
        console.log(address);
        if(locationSendingInterval === null)locationSendingInterval= setInterval(gettingPos,(1000*60*5));
        if(map === null)renderMap(latitude, longitude, address,timestamp);
        else sendToDb(latitude, longitude,timestamp);
      };
      const renderMap = async function (latitude, longitude, address,timestamp) {
        map = await L.map('map').setView([latitude, longitude], 14);
        await L.tileLayer(
          'https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
          {
            attribution:
              '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
          }
        ).addTo(map);
        L.marker([latitude, longitude])
          .addTo(map)
          .bindPopup(
            L.popup({
              maxWidth: 250,
              minWidth: 100,
              autoClose: false,
              closeOnClick: false,
              className: 'popup',
            })
          )
          .setPopupContent(
            '<b>Your bus is at</b> <br>' +
              '<span class="address">' +
              address +
              '</span>'
          )
          .openPopup();
          
          sendToDb(latitude, longitude,timestamp);
          
      };
      
      const sendToDb= async function(latitude, longitude,timestamp){
            const now = new Date();
            const minutesToday = (+now.getHours()*60) + (+now.getMinutes());
          
            const dataToSend = 'latitude='+latitude+'&longitude='+longitude+'&timestamp='+minutesToday+'&driverId='+<%= driver.getDriverId() %>; // Replace with your actual data
            console.log(dataToSend);
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "http://localhost:9494/BusTracking/LocationServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    // Handle the response from the servlet if needed
                    console.log(xhr.responseText);
                }
            };
            
            xhr.send(dataToSend);
            console.log("dataSendToServlet")
          
      }     
      startBtn.addEventListener('click', gettingPos);
      stopBtn.addEventListener('click', function(){
          startBtn.disabled = false;
          
          stopBtn.style.cursor='not-allowed'
          startBtn.textContent = "Start Sharing Location";
          startBtn.style.backgroundColor = '';
          startBtn.style.color = '';
          locationStatus.textContent = "Stopped sending the location";
          startBtn.style.cursor = 'pointer';
          clearInterval(locationSendingInterval);
          locationSendingInterval = null;
          delteTempLocation();
          console.log("Done");
          stopBtn.disabled = true;
      });
      console.log('driverId='+stopBtn.value);
      const delteTempLocation = async function(){
//          const dataToSend = 'driverId='+stopBtn.value;
//          console.log(dataToSend);
            const xhr = new XMLHttpRequest();
            xhr.open("DELETE", "http://localhost:9494/BusTracking/LocationServlet?driverId="+stopBtn.value, true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    // Handle the response from the servlet if needed
                    console.log(xhr.responseText);
                }
            };
            
            xhr.send();
            console.log("dataSendToServlet");
      }
    </script>
  </body>
</html>
