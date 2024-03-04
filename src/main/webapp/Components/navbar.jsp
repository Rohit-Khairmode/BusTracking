<%-- 
    Document   : navbar
    Created on : 28-Feb-2024, 4:03:57 pm
    Author     : ROHIT
--%>
<%@page import="com.learn.bustracking.entities.Driver"%>
<%@page import="com.learn.bustracking.entities.User"%>
<%

    User user1 = (User) session.getAttribute("current-user");
    Driver driverNav = (Driver) session.getAttribute("current-driver");

%>

<nav class="navbar navbar-expand-lg navbar-light nav-color " style="color:#fff">
  <%if(user1 == null && driverNav==null){%><a class="navbar-brand" href="index.jsp">BusTracking</a> <% }  %>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse text-white" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
       <% if(driverNav == null){ %> <a class="nav-link" href="Home.jsp">Home <span class="sr-only">(current)</span></a> <% }%>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">   
        
        <%
            if(user1 == null && driverNav == null){
        %>
         <li class="nav-item active" >
              <a class="nav-link" href="login.jsp">User Login </a>
        </li> 
        <li class="nav-item active" >
              <a class="nav-link" href="driverLogin.jsp">Driver Login </a>
        </li> 
        <li class="nav-item active">
              <a class="nav-link" href="register.jsp">User Register </a>
        </li> 
        <%
            }else{
        %>
         <li class="nav-item active" >
             <a class="nav-link" href="<%= user1 !=null ? user1.getUserType().equals("admin")?"admin.jsp":"#": driverNav !=null? "driver.jsp":"#"%> "><%= user1 !=null?user1.getUserName():driverNav.getDriverName() %></a>
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
