<%@page import="main.LoginDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>

<%
String driverName = "com.mysql.jdbc.Driver";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;


String Email = request.getParameter("Email");
String Pass = request.getParameter("Pass");

session.setAttribute("Email",Email);
session.setAttribute("Pass",Pass);  

Email=(String)session.getAttribute("Email");
Pass=(String)session.getAttribute("Pass");  

%>

<%
//PreparedStatement pst = conn.prepareStatement("Select Cust_Email,Cust_Pass from customer where Cust_Email=? and Cust_Pass=?");
//pst.setString(1, Email);
//pst.setString(2, Pass);

//ResultSet rs = pst.executeQuery(); 

LoginDetails logobj = new LoginDetails();

if(logobj.getLoginInfo(Email, Pass) == 1){
	
}
else if (logobj.getLoginInfo(Email, Pass) == 0){
	%><script>  window.location='error.jsp' </script><%
}
	
%>

 

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>RideEase - Customer</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
</head>
<style>

.map-container{
  overflow:hidden;
  padding-bottom:56.25%;
  position:relative;
  height:0;
}
.map-container iframe{
  left:0;
  top:0;
  height:100%;
  width:100%;
  position:absolute;
}
	
</style>

<body>


 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center ">
    <div class="container d-flex align-items-center justify-content-between">

       <div class="logo">
        <h1><a href="index.html"><span>RideEase</span></a></h1>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="index.jsp#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="index.jsp#about">Sign up as Customer</a></li>
          <li><a class="nav-link scrollto" href="index.jsp#driver">Sign up as Captain</a></li>
          <li class="dropdown"><a href="#">
          <span>
          <%  
			statement=conn.createStatement();
			String sql ="SELECT * FROM customer where Cust_Email='"+Email+"'";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			
			<%=resultSet.getString("Cust_Fname") %>
			<%=resultSet.getString("Cust_Lname") %>
			
			<%
			}
			%>
          </span> <i class="bi bi-chevron-down"></i></a>
              
              <!-- Dropdown - User Information -->
             <ul>
              <li><label><a href="Update.jsp"><i class="fa-solid fa-user"></i>&nbsp;&nbsp;Profile</a></label></li>
              <li><label><a href="RideHisttory.jsp"><i class="fa-solid fa-car"></i>&nbsp;&nbsp;Ride History</a></label></li>
              <li><label><a href="index.jsp"><i class="fa-solid fa-right-from-bracket"></i>&nbsp;&nbsp;Logout</a></label></li>
            </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-start align-items-center">
			
			<h3>Welcomer 
			<%  
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			<strong>
			<%=resultSet.getString("Cust_Fname") %>
			<%=resultSet.getString("Cust_Lname") %>
			</strong>
			<%
			}
			%>
			</h3>
			
		</div>

      </div>
    </section>
	  <!-- End Breadcrumbs Section -->

     <!-- ======= About Section ======= -->
    <section class="about">
      <div class="container-fluid">
		  <center>
		  <p>To get started Enter your Pickup and drop off location below.</p>
			  </center>
		  <br>
		   <form action="Ride.jsp" method="post">
	  <div class="form-group row mt-1 justify-content-center">
	  
      <div class="col-sm-3">
       <input type="text" class="form-control" name="Pick"
        placeholder="Enter Pickup Location">
      </div>
		  <div class="col-sm-1">
		  <i class="bi bi-arrow-left-right p-5" style="font-size: 25px"></i>
		  </div>
		 <div class="col-sm-3">
       <input type="text" class="form-control" name="Drop"
        placeholder="Enter Dropoff Location">
      </div>
      <input type="hidden" id="demo" value="" name="Fare">
     </div>
		  
	 <div class="row justify-content-center">
       <button type="submit" class="btn btn-success col-sm-2 p-2 mt-4">Confirm Location</button>
		 </div>

        <!--Google map-->
<div id="map-container-google-2" class="z-depth-1-half map-container mt-5" style="height: 500px">
  <iframe src="https://maps.google.com/maps?q=Karachi&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0"
    style="border:0" allowfullscreen></iframe>
</div>

<!--Google Maps-->

      </div>
    </section>
	  <!-- End About Section -->
	  
	  <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center p-3">
         
        </div>

      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
   

    <div class="container">
      <div class="copyright">
        All Rights Reserved &copy;
      </div>
      <div class="credits">
        Developed by <strong><a href="https://bootstrapmade.com/">Muhammad Shujaat Ali</a></strong> 
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
<script>
let x = document.getElementById("demo").innerHTML =
(Math.floor(Math.random() * 300)+250);

document.getElementById("demo").value = x;
</script>