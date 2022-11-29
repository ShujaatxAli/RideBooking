<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
<div class="row">
<button type="submit" class="btn col-sm-2 btn-success p-2 mt-5 mr-3">View Customer Data</button>	
<button type="submit" class="btn col-sm-2 btn-success p-2 mt-5 mr-3">View Driver Data</button>	
<button type="submit" class="btn col-sm-2 btn-success p-2 mt-5 mr-3">View Vehicle Data</button>	
<button type="submit" class="btn col-sm-2 btn-success p-2 mt-5 mr-3">View Ride History</button>
<button type="submit" class="btn col-sm-2 btn-success p-2 mt-5 mr-3">View Driver's Rating</button>
</div>
	
<div class="row">
<button type="submit" class="btn col-sm-2 btn-info p-2 mt-5 mr-3">View Fare Record</button>
<button type="submit" class="btn col-sm-2 btn-info p-2 mt-5 mr-3">View Booking Record</button>
<button type="submit" class="btn col-sm-2 btn-danger p-2 mt-5 mr-3">View Complaints</button>
</div>
	
<div class="row mt-5">

<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Driver Name</th>
      <th scope="col">Driver Vehicle</th>
      <th scope="col">Rating</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Muhammad Ali</td>
      <td>Honda City 2015</td>
      <td>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star"></span>
		<span class="fa fa-star"></span>
	  </td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Ahmed Hussain</td>
      <td>Suzuki Cultus 2009</td>
      <td>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star"></span>
	  </td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Faisal Khan</td>
      <td>Toyota Prius 2012</td>
      <td>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star"></span>
		<span class="fa fa-star"></span>
		<span class="fa fa-star"></span>
	  </td>
    </tr>
  </tbody>
</table>
	
</div>

</div>
</body>
</html>