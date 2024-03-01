<%-- 
    Document   : index
    Created on : 28-Feb-2024, 1:31:47 am
    Author     : ROHIT
--%>

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
        response.sendRedirect("landing.jsp");
        return;
    }    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BusTracking - Home</title>
        
        <%@include file="Components/common_css_js.jsp" %>
     </head>
    <body>
        <div class="container-fluid">
        <%@include file="Components/navbar.jsp" %>
        <div class="row">
            
            <%
           String b = request.getParameter("Bus");
            BusDao indexBus= new BusDao(FactoryProvider.getFactory()); 
            
            
//            DriverDao indexDriver= new DriverDao(FactoryProvider.getFactory());   
            List<Bus> indexBusList = indexBus.getBuses();
//            List<Driver> indexDriverList = indexDriver.getDrivers();
            
            %>
            <!--List of buses-->
            <div class="col-md-2">
                 <div class="list-group mt-4">
                    <a href="index.jsp?Bus=all" class="list-group-item list-group-item-action  active">
                        All Buses
                    </a>
                </div>

                <%
                    for (Bus c : indexBusList) {

                %>
                
                
                <a href="index.jsp?Bus=<%= c.getBusId() %>" class="list-group-item list-group-item-action"><%= c.getBusName() %></a>                    

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
                                 <a href="index.jsp?Bus=<%= p.getBusId() %>">
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
        
        <%
        }%>
    </div>
       </div>
    </body>
</html>
