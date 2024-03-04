<%-- 
    Document   : admin
    Created on : 29-Feb-2024, 12:02:36 am
    Author     : ROHIT
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.bustracking.entities.Bus"%>
<%@page import="com.learn.bustracking.dao.BusDao"%>
<%@page import="com.learn.bustracking.helper.FactoryProvider"%>
<%@page import="com.learn.bustracking.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are not admin !! Do not access this page");
            response.sendRedirect("login.jsp");

            return;
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="Components/common_css_js.jsp" %>
        <style>
            ion-icon {
                font-size: 64px;
                color: #59D5E0;
            }
        </style>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <div class ="container admin">
            <div class="container-fluid mt-3">
                <%@include file ="Components/message.jsp" %>
                <!--second row-->
                <div class="row mt-3">
                    <!--second row first col-->
                    <div class="col-md-6">                        
                        <div class ="card" style="border :1px solid #673ab7;">
                            <div class ="card-body text-center" data-toggle="modal" data-target="#add-bus-model">
                                <div class="container">
                                    <ion-icon name="bus-outline"> </ion-icon>
                                </div>
                                <p class="mt-2">Click here to add new Bus details</p>
                                <h1 class="text-uppercase text-muted">Add Bus details</h1>
                            </div>
                        </div>
                    </div>
                    <!--second row second column-->
                    <div class="col-md-6">
                        <div class ="card" style="border :1px solid #673ab7;">
                            <div class ="card-body text-center" data-toggle="modal" data-target="#add-driver-model" >
                                <div class="container">
                                     <ion-icon name="person-add-outline"></ion-icon>
                                </div>
                                <p class="mt-2">Click here to add new Driver details</p>
                                <h1 class="text-uppercase text-muted">Add Driver details</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--add category model-->

            <!-- Modal -->
            
             <div class="modal fade" id="add-bus-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header  text-dark" style="background-color: #ca6107">
                            <h5 class="modal-title" id="exampleModalLabel">Fill Bus details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="AddServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="operation" value="addbus">

                                <div class="form-group">
                                    <input type="text" class="form-control" name ="busName" placeholder="Enter the Bus Name" required />
                                </div>
                                
                                 <div class="form-group">
                                    <input type="text" class="form-control" name ="busNumber" placeholder="Enter the Bus Number" required />
                                </div>

                                <div class ="form-group">
                                    <label for="busRoute"> Enter the Route of bus</label>
                                    <textarea style="height:300px"  class="form-control" id="busRoute" name="busRoute" placeholder="Enter bus route"  required>
                      
                                    </textarea>
                                </div>
                                <!--Bus file-->
                                    <div class="form-group">
                                        <label for="busPic"> Select Picture of Bus</label>
                                        <br>
                                        <input type="file" id="busPic" name="busPic" required>
                                    </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success ">Add Bus Details</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--end of category modal-->
            
            
             <!--Product model-->
            <div class="modal fade" id="add-driver-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-dark" style="background-color: #0441bc">
                            <h5 class="modal-title" id="exampleModalLabel">Fill Driver details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!--from-->
                            <form action="AddServlet" method="post" >

                                <input type="hidden" name="operation" value="adddriver" />

                                <!--driver Name-->
                                <div class="form-group">
                                    <input type="text" class="form-control" name ="driverName" placeholder="Enter the Driver Name" required />
                                </div>

                                <!--driver Email-->
                                <div class ="form-group">
                                    <input type="email" class="form-control" name="driverEmail" placeholder="Enter Driver email"  required />
                                </div>

                                <!--driver Password-->
                                <div class="form-group">
                                    <input type="password" class="form-control" name ="driverPassword" placeholder="Enter Driver password" required />
                                </div>

                                <!--driver Phone-->
                                <div class="form-group">
                                    <input type="number" class="form-control" name ="driverPhone" placeholder="Enter Driver phone number" required />
                                </div>
                                
                                 <!--driver Bus-->

                                <div class="form-group">
                                    <select name="busId" class="form-control" id="busId">
                                    <%
                                            BusDao bd = new BusDao(FactoryProvider.getFactory());
                                            List<Bus>list = bd.getBuses();
                                            List<Bus>busWithNoDriver = new ArrayList<>();
                                            
                                            for(Bus b : list){
                                                if(b.getDriver() == null){
                                                    busWithNoDriver.add(b);
                                                }
                                            }
                                            if(busWithNoDriver.size()==0){
                                            %>
                                            <option value="0">All buses Have drivers add new Driver with no bus assigned </option>
                                            <%
                                            } 
                                            %>   
                                            <%
                                            for (Bus c : busWithNoDriver) {
                                            %>
                                            <option value="<%= c.getBusId()%>"> <%= c.getBusName() %> 
                                            </option>
                                            <% 
                                            }
                                            %>
                                    </select>

                      
                                </div>  
                                <!--submit button-->
                                <div class="container text-center">
                                    <button class="btn btn-outline-success ">Add Driver Details</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                </div>
                            </form>
                            <!--end of form-->
                        </div>
                    </div>
                </div>
            </div>

            <!--end of product model-->
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    </body>
</html>
