<%-- 
    Document   : navbar
    Created on : 28-Feb-2024, 4:03:57 pm
    Author     : ROHIT
--%>
<%@page import="com.learn.bustracking.entities.User"%>
<%

    User user1 = (User) session.getAttribute("current-user");

%>

<nav class="navbar navbar-expand-lg navbar-light nav-color " style="color:#fff">
  <%if(user1 == null){%><a class="navbar-brand" href="landing.jsp">BusTracking</a> <% }  %>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse text-white" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">   
        
        <%
            if(user1 == null){
        %>
         <li class="nav-item active" >
              <a class="nav-link" href="login.jsp">Normal User Login </a>
        </li> 
        <li class="nav-item active" >
              <a class="nav-link" href="driverLogin.jsp">Driver Login </a>
        </li> 
        <li class="nav-item active">
              <a class="nav-link" href="register.jsp">Register </a>
        </li> 
        <%
            }else{
        %>
         <li class="nav-item active" >
              <a class="nav-link" href="#"><%= user1.getUserName() %></a>
        </li>  
        <li class="nav-item active">
              <a class="nav-link" href="LogoutServlet">Logout </a>
        </li> 
        <%
            }    
        %>
        
<!--we will show complete buses list in the drop down
<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>-->
  </div>
</nav>
