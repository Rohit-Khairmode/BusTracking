<%-- 
    Document   : index
    Created on : 28-Feb-2024, 1:31:47 am
    Author     : ROHIT
--%>

<%@page import="com.learn.bustracking.entities.Location"%>
<%@page import="com.learn.bustracking.dao.LocationDao"%>
<%@page import="com.learn.bustracking.entities.Driver"%>
<%@page import="com.learn.bustracking.dao.DriverDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.bustracking.entities.Bus"%>
<%@page import="com.learn.bustracking.dao.BusDao"%>
<%@page import="com.learn.bustracking.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    }    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BusTracking - Home</title>
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
        </style>
     </head>
    <body>
        <div class="container-fluid">
        <%@include file="Components/navbar.jsp" %>
        <div class="row">
            
            <%
           String b = request.getParameter("Bus");
            BusDao indexBus= new BusDao(FactoryProvider.getFactory());             
            List<Bus> indexBusList = indexBus.getBuses();
            %>
            <!--List of buses-->
            <div class="col-md-2">
                 <div class="list-group mt-4">
                    <a href="Home.jsp?Bus=all" class="list-group-item list-group-item-action  active">
                        All Buses
                    </a>
                </div>

                <%
                    for (Bus c : indexBusList) {

                %>
                
                
                <a href="Home.jsp?Bus=<%= c.getBusId() %>" class="list-group-item list-group-item-action"><%= c.getBusName() %></a>                    

                <%
                    }
                %>
            </div>
            
                
            
                        <!--show Buses-->
                        <% if(b==null || b.trim().equals("all")) {
                            %>            
            <div class="col-md-10">
                <!--row-->
                <div class="row mt-4">
                   
                    <div class="col-md-12">
                        <div class="card-columns">
                            
                            <!--traversing products-->
                            <%
                                for(Bus p: indexBusList){
                                
                                
                                %>
                                <!--product card-->
                                 <a href="Home.jsp?Bus=<%= p.getBusId() %>">
                                <div class="card bus-card">
                                    <div class="container text-center">
                                     <img class="card-img-top m-2" src="img/Buses/<%=p.getBusPic()%>" style="max-height : 200px;max-width: 100%;width :auto;">

                                    </div>
                                    <div class="card-body">
                                        
                                        <h5 class="bus-name"><%= p.getBusName() %></h5>
                                        <h5 class="bus-number"><%= p.getBusNumber() %></h5>
                                        <p class="bus-route"><%= p.getBusRoute() %></p>
                                    </div> 
<!--                                    <div class="card-footer">
                                        <button class="btn nav-color  text-white">Track Location</button> 
                                    </div>-->
                                </div>
                                    </a>
                                    <%
                                        }
                                    %>
                    </div>
                </div>
            </div>
        </div>
                    <% }
        else {
        Bus curBus = indexBus.getBusById(Integer.parseInt(b.trim()));
        %>
        <div class="col-md-8">
            <div class="row mt-4">
                <div class="col-md-5">
                    <div class="card bus-card">
                        <div class="container text-center">
                            <img class="card-img-top m-2" src="img/Buses/<%=curBus.getBusPic()%>" style="max-height : 200px;max-width: 100%;width :auto;">
                        </div>
                         <div class="card-body" style="cursor:auto">                                       
                            <h5 class="bus-name">Bus Name:<span> <%= curBus.getBusName() %></span></h5>                                        
                            <h5 class="bus-number">Bus Number: <%= curBus.getBusNumber() %></h5>
                            <h5 class="bus-number">Driver Name: <%= curBus.getDriver().getDriverName() %></h5>
                            <h5 class="bus-number">Driver contact number :<%= curBus.getDriver().getDriverPhone() %></h5>
                            <h5>Bus Route</h5>
                            <p class="bus-route" style="font-size: 20px"><%= curBus.getBusRoute() %></p>
                        </div>                 
                    </div>
                </div>
                <div class="col-md-7">
                    <% 
                        LocationDao locationDao = new LocationDao(FactoryProvider.getFactory());
                        List<Location> locations = locationDao.getLocationsByBusId(curBus.getBusId());
                        
                    %>
                    <div id="map" style="height: 100vh">
                    </div>
                         <script>
        const latitude =<%= locations.get(locations.size()-1).getLatitude() %>;
        const longitude =<%= locations.get(locations.size()-1).getLongitude() %>
        const mapContainer = document.querySelector('#map');
        const renderMap = async function (latitude, longitude, address) {
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
              };
        const getAddress = async function(latitude, longitude){
             const addressRes = await fetch(
          'https://geocode.maps.co/reverse?lat=' +
            latitude +
            '&lon=' +
            longitude +
            '&api_key=65e2f00cbcd13268629964lpdb90572'
        );
        const addressData = await addressRes.json();
        const address = addressData.display_name;
        renderMap(latitude, longitude, address);
        }

        getAddress(latitude,longitude);
        
        
    </script>
                </div>
            </div>
        </div>
        
        <%
        }%>
    </div>
       </div>
   
    </body>
</html>
