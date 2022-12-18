<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>
 
<%

String driverName = "com.mysql.jdbc.Driver";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;



%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, height=device-height, user-scalable=no, maximum-scale = 1.0, minimum-scale=1.0,initial-scale=1.0">
	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>EaseRide - Registration</title>
</head>
<style>
	body{
		background-color: #f5f5f5;
	}
	nav{
		box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	}
.checked {
  color: orange;
}
</style>
<body>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #6D07EB; color: #FFF">
  <a class="navbar-brand ml-5" href="#">EaseRide</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse ml-3" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Customer Information</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Driver Information</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Logout</a>
      </li>
    </ul>
  </div>
</nav>
	
<div class="container">

<div class="row mt-5">
	<h4>Welcome Admin! Your Dashboard</h4>
</div>
	
<form action="AdminDash.jsp" method="post">
<div class="row">
<button type="submit" name="Cust" class="btn col-sm-2 btn-success p-2 mt-5 mr-3">View Customer Data</button>	
<button type="submit" name="Driver" class="btn col-sm-2 btn-success p-2 mt-5 mr-3">View Driver Data</button>	
<button type="submit" name="Veh" class="btn col-sm-2 btn-success p-2 mt-5 mr-3">View Vehicle Data</button>	
<button type="submit" name="Ride" class="btn col-sm-2 btn-success p-2 mt-5 mr-3">View Ride History</button>
<button type="submit" class="btn col-sm-2 btn-success p-2 mt-5 mr-3">View Driver's Rating</button>
</div>
	
<div class="row">
<button type="submit" name="Fare" class="btn col-sm-2 btn-info p-2 mt-5 mr-3">View Fare Record</button>
<button type="submit" name="Book" class="btn col-sm-2 btn-info p-2 mt-5 mr-3">View Booking Record</button>
<button type="submit" name="Comp" class="btn col-sm-2 btn-danger p-2 mt-5 mr-3">View Complaints</button>
</div>
</form>
	
<div class="row mt-5">

<table class="table" borders = "1">

  <thead class="thead-dark">
      	
  <%
  

if (request.getParameter("Cust") != null) { 
	
	%>
	    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone</th>
      <th scope="col">Pass</th>
    </tr>
      </thead>
  <tbody>
    
    <% 
	   	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
	   	statement=connection.createStatement();
	   	String cus ="select * from customer";
	   	resultSet = statement.executeQuery(cus);
	   	while(resultSet.next()){ %>
	   	
	 <tr>
      <th><%=resultSet.getString("Cust_ID") %></th>
	  <td><%=resultSet.getString("Cust_Fname") %> <%=resultSet.getString("Cust_Lname") %> </td>
	  <td><%=resultSet.getString("Cust_Email") %></td>
	  <td><%=resultSet.getString("Cust_Phone") %></td>
	  <td><%=resultSet.getString("Cust_Pass") %></td>
    </tr>
		
		<%
	}

}
else if (request.getParameter("Driver") != null) { 
	
	
	%>
    <tr>
  <th scope="col">ID</th>
  <th scope="col">Full Name</th>
  <th scope="col">Phone #</th>
  <th scope="col">Password</th>
  <th scope="col">Driving License</th>
  <th scope="col">Car Information</th>
</tr>
  </thead>
<tbody>

<% 
    
   	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
   	statement=connection.createStatement();
   	String cus ="select driver.Driver_ID,driver.Driver_Fname,driver.Driver_Lname,driver.Driver_Phone,driver.Driver_Pass,driver.Driver_DLC,car.Car_Make,car.Car_Name,car.Car_Model,car.Car_Color  from driver,car Where driver.Car_ID = car.Car_ID";
   	resultSet = statement.executeQuery(cus);
   	while(resultSet.next()){ %>
   		
   	 <tr>
     <th><%=resultSet.getString("Driver_ID") %></th>
	  <td><%=resultSet.getString("Driver_Fname") %> <%=resultSet.getString("Driver_Lname") %> </td>
	  <td><%=resultSet.getString("Driver_Phone") %></td>
	  <td><%=resultSet.getString("Driver_Pass") %></td>
	  <td><%=resultSet.getString("Driver_DLC") %></td>
	  <td><%=resultSet.getString("Car_Make") %> <%=resultSet.getString("Car_Name") %> <%=resultSet.getString("Car_Model") %> <%=resultSet.getString("Car_Color") %></td>
	  
   </tr>
	
	<%
}

}
  
  %>
   
  </tbody>
</table>
	
</div>

</div>
</body>
</html>