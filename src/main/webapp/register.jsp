<%-- 
    Document   : register.jsp
    Created on : 28-Feb-2024, 4:32:45 pm
    Author     : ROHIT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body style="background:#accad1;" >
        <%@include file="Components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-4">
            <div class="col-md-4 offset-md-4">
                <div class="card ">
                <%@include file="Components/message.jsp" %> 
                <div class="card-body px-5" style="background-color:#769aa3">
                    <h3 class ="text-center" >Sign up here!!</h3>
                    <form action ="RegisterServlet" method="post">
                     
                        <div class="form-group">
                         <label for="name">User Name</label>
                         <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp"  placeholder="Enter here">
                         </div>
                         <div class="form-group">
                         <label for="email">User Email</label>
                         <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp"  placeholder="Enter here">
                         </div>

                        <div class="form-group">
                         <label for="password">User password</label>
                         <input name ="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp"  placeholder="Enter here">
                         </div>

                        <div class="form-group">
                         <label for="phone">User phone</label>
                         <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp"  placeholder="Enter here">
                         </div>
<!--                        <div class="form-group">
                            <label for="Bus-Name">Select bus</label>
                        </div>-->
                        <div class ="container text-center">
                            <button class ="btn btn-outline-success" style ="background-color: black">Register</button>
                            <button type="reset" class ="btn btn-outline-warning" style ="background-color: black">Reset</button>
                    </form>
                </div>
                </div>
            </div>
        </div>
            
        </div>
    </body>
</html>
