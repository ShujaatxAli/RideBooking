<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>EaseRide - Registration</title>
</head>
<body>

   <div class="card-body">
    <form action="<%=request.getContextPath()%>/register" method="post">

<div class="col-lg-12 text-center">
			<span>
            <p class="mb-2 mt-2">Millions of people's life has changed, millions more awaiting your donation and Everuthing</p>
			</span>
          </div>

     <div class="form-group row justify-content-center mt-5">
      <div class="col-sm-3">
       <input type="text" class="form-control" name="firstName"
        placeholder="Enter first name">
      </div>
     </div>

     <div class="form-group row justify-content-center">
      <div class="col-sm-3">
       <input type="text" class="form-control" name="LastName"
        placeholder="Last Name">
      </div>
     </div>
     
     <div class="form-group row justify-content-center">
      <div class="col-sm-3">
       <input type="text" class="form-control" name="user"
        placeholder="Username">
      </div>
     </div>
     
     <div class="form-group row justify-content-center">
      <div class="col-sm-3">
       <input type="password" class="form-control" name="pass"
        placeholder="Password">
      </div>
     </div>
     
     <div class="row justify-content-center">
     <button type="submit" class="btn btn-primary">Sign up</button>
     </div>
     
    </form>
   </div>	
</body>
</html>
