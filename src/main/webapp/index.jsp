<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, height=device-height, user-scalable=no, maximum-scale = 1.0, minimum-scale=1.0,initial-scale=1.0">
	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>EaseRide - Registration</title>
</head>
<style>
	
	body{
		background-image:url("bg.jpg")
	}
	.bg{
		height: auto;
		width: 100%;
	}

.no-spin::-webkit-inner-spin-button, .no-spin::-webkit-outer-spin-button {
    -webkit-appearance: none !important;
    margin: 0 !important;
}

.no-spin {
    -moz-appearance:textfield !important;
}

</style>
<body>

<div class="container mt-4">

<div class="row">
<div class="col-6 mt-5">
<img class="bg" src="bg.png">
</div>

<div class="col-6 mt-5">
	<center>
	<h1 class="justify-content-center mt-5" style="color:#FFF">Sign up as a Customer! </h1>
		
	 <div class="card-body">
    <form action="<%=request.getContextPath()%>/register" method="post">


     <div class="form-group row justify-content-center mt-3">
      <div class="col-sm-8">
       <input type="text" class="form-control" name="FirstName"
        placeholder="First name">
      </div>
     </div>

     <div class="form-group row justify-content-center">
      <div class="col-sm-8">
       <input type="text" class="form-control" name="LastName"
        placeholder="Last Name">
      </div>
     </div>
     
     <div class="form-group row justify-content-center">
      <div class="col-sm-8">
       <input type="number" class="form-control no-spin" name="contact"
        placeholder="Contact">
      </div>
     </div>
     
     <div class="form-group row justify-content-center">
      <div class="col-sm-8">
       <input type="password" class="form-control" name="pass"
        placeholder="New Password">
      </div>
     </div>

     
     <div class="row justify-content-around">
     <button type="submit" class="btn col-sm-4 p-2 mt-2" style="background-color: #6D07EB; color: #FFF">Sign up</button>
     </div>
		
	<div class="col-6 mt-3">
	<p style="color: #FFF">Already have an account? <a href="#">Login Here!</a></p>	
	</div>
     
    </form>
   </div>
		
	</center>
</div>
	</div>
	</div>
</body>
</html>