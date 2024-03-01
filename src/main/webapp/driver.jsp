<%-- 
    Document   : driver
    Created on : 01-Mar-2024, 3:01:49 pm
    Author     : ROHIT
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Driver Page</title>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
<script defer src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
        <%@include file="Components/common_css_js.jsp" %>
        <style>
            #map {
  flex: 1;
  height: 100%;
  background-color: var(--color-light--1);
}

/* Popup width is defined in JS using options */
.leaflet-popup .leaflet-popup-content-wrapper {
  background-color: var(--color-dark--1);
  color: var(--color-light--2);
  border-radius: 5px;
  padding-right: 0.6rem;
}

.leaflet-popup .leaflet-popup-content {
  font-size: 1.5rem;
}

.leaflet-popup .leaflet-popup-tip {
  background-color: var(--color-dark--1);
}

.running-popup .leaflet-popup-content-wrapper {
  border-left: 5px solid var(--color-brand--2);
}
.cycling-popup .leaflet-popup-content-wrapper {
  border-left: 5px solid var(--color-brand--1);
}
        </style>
    </head>
    <body style="overflow:scroll">
        <header>
            <%@include file="Components/navbar.jsp" %>
        </header>
        <div class="container">
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card bus-card">
                    <div class="container text-center">
                        <img class="card-img-top m-2" src="img/Buses/<%=driverBus.getBusPic()%>" style="max-height : 200px;max-width: 100%;width :auto;">
                    </div>
                        <div class="card-body" style="cursor:auto">
                            
                            <h5 class="bus-name">Bus Name:<span> <%= driverBus.getBusName() %></span></h5>
                            
                            <h5 class="bus-number">Bus Number: <%= driverBus.getBusNumber() %></h5>
                            <h5 class="bus-number">Driver Name: <%= driverBus.getDriver().getDriverName() %></h5>
                            <h5 class="bus-number">Driver contact number :<%= driverBus.getDriver().getDriverPhone() %></h5>
                            <h5>Bus Route</h5>
                            <p class="bus-route" style="font-size: 20px"><%= driverBus.getBusRoute() %></p>
                        </div>   
                </div>
                <div class="container mt-4">
                    <button class="start">Start Sharing Location</button>                
                    <button class="stop mt-4">Stop Sharing Location</button>                
                </div>
            </div>
                <div class="col-md-8">
                <div id="map" style="height:100vh">
                    <section>
                    <iframe
                      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3822.1853104065162!2d74.20604469999999!3d16.6676078!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc05552f4000001%3A0x81166eb04377a838!2sD.%20Y.%20Patil%20College%20Of%20Engineering!5e0!3m2!1sen!2sin!4v1699210860355!5m2!1sen!2sin"
                      width="600"
                      height="450"
                      style="border: 0"
                      allowfullscreen=""
                      loading="lazy"
                      referrerpolicy="no-referrer-when-downgrade"
                      class="map"
                    ></iframe>
                    </section>
        </div>    
               
            </div>
        </div>
        </div>
 

        <script>
            const startBtn = document.querySelector(".start");
            console.log(startBtn);
            const stopBtn = document.querySelector(".stop");
            const gettingPos =function(pos){
                    console.log(pos);
                    const {latitude,longitude} = pos.coords;
                    console.log(latitude);
                    console.log(longitude);
                    console.log(`https://www.google.com/maps/@`+latitude+","+longitude);
                    const coords = [latitude, longitude];
                    document.querySelector("#map").innerHtml = '';
                    const map = L.map('map').setView(coords, 12);
                    L.tileLayer('https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {
                        attribution:
                        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
                    }).addTo(map);
                    
                };
            const notGettingPos =function(){
                alert("not getting position");
            };
            startBtn.addEventListener('click',function(){
                navigator.geolocation.getCurrentPosition(gettingPos,notGettingPos);
                
            })
        </script>
    </body>
</html>
