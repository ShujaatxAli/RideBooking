<%@page import="main.Driver"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="main.*" %>
    
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
        <a class="nav-link" href="index.jsp">Logout</a>
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
<button type="submit" name="Book" class="btn col-sm-3 btn-info p-2 mt-5 mr-3">View Booking & Fare Record</button>
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
    Customer custobj = new Customer();

    ArrayList<String> ls  = custobj.getCustomerInfo();

    int z=0;
    for (int i=0;i<(ls.size()/5);i++)
    {

    %>

    <tr>
    <%
    for(int j=0; j<5; j++)
    {
    %> 	 
         <td><% out.println(ls.get(i*5+j)); %></td>
    <%
    }

    %>
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

Driver carrrr = new Driver();

ArrayList<String> ls  = carrrr.getDriverInfo();

int z=0;
for (int i=0;i<(ls.size()/6);i++)
{

%>

<tr>
<%
for(int j=0; j<6; j++)
{
%> 	 
     <td><% out.println(ls.get(i*6+j)); %></td>
<%
}

%>
	</tr>
<%
}

}
else if (request.getParameter("Veh") != null) { 
	
	
	%>
    <tr>
  <th scope="col">Car ID</th>
  <th scope="col">Car Make</th>
  <th scope="col">Car Name</th>
  <th scope="col">Car Variant</th>
  <th scope="col">Car Model</th>
  <th scope="col">Car Color</th>
  <th scope="col">Car Registration #</th>
</tr>
  </thead>
<tbody>

<%

Car carrrr = new Car();

ArrayList<String> ls  = carrrr.getCarInfo();

int z=0;
for (int i=0;i<(ls.size()/7);i++)
{

%>

<tr>
<%
for(int j=0; j<7; j++)
{
%> 	 
     <td><% out.println(ls.get(i*7+j)); %></td>
<%
}

%>
	</tr>
<%
}


}
else if (request.getParameter("Book") != null) { 
	
	
	%>
    <tr>
  <th scope="col">Book ID</th>
  <th scope="col">Pick up Location</th>
  <th scope="col">Drop off Location</th>
  <th scope="col">Fare</th>
  <th scope="col">Customer</th>
  <th scope="col">Driver</th>
  <th scope="col">Car Details</th>
</tr>
  </thead>
<tbody>

<% 
    
Booking bookingobj = new Booking();

ArrayList<String> ls  = bookingobj.getBookingInfo();

int z=0;
for (int i=0;i<(ls.size()/7);i++)
{

%>

<tr>
<%
for(int j=0; j<7; j++)
{
%> 	 
     <td><% out.println(ls.get(i*7+j)); %></td>
<%
}

%>
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