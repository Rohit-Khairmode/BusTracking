<%-- 
    Document   : driverLogin.jsp
    Created on : 01-Mar-2024, 2:40:08 pm
    Author     : ROHIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
     <body style="background:#accad1;">
        <%@include file="Components/navbar.jsp" %>
        <div class="container" >
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white">
                            <h3>Driver Login</h3>
                        </div>
                        <div class="card-body">
                            
                            <%@include file ="Components/message.jsp"%>
                            <form action="DriverLoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary border-0">Submit</button>
                                    <button type="reset" class="btn btn-primary border-0">Reset</button>
                                </div>
                            </form>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
