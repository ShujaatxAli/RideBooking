<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>RideEase - Driver Login</title>
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

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
</head>

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
          <li><a class="nav-link scrollto disabled" href="#team">Team</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">
      
        <div class="d-flex justify-content-end align-items-center">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Driver Registration</li>
          </ol>
        </div>

      </div>
    </section>
	  <!-- End Breadcrumbs Section -->
	  
	     <!-- ======= About Section ======= -->
    <section id="CustLogin" class="about">
      <div class="container-fluid mt-5">
          
          <!-- =============== BACK END ==================== -->
          
<%

String Fname = request.getParameter("FirstName");
String Lname = request.getParameter("LastName");
String Phone = request.getParameter("Phone");
String Pass = request.getParameter("Pass");
String DLC = request.getParameter("DLC");

String CarMake = request.getParameter("CarMake");
String CarName = request.getParameter("CarName");
String CarVar = request.getParameter("CarVar");
String CarModel = request.getParameter("CarModel");
String CarColor = request.getParameter("CarColor");
String CarReg = request.getParameter("CarReg");
int car = 0;

try
{
		
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
	Statement st=conn.createStatement();
	
	   int x=st.executeUpdate("insert into car(Car_Name, Car_Model, Car_Variant, Car_Make, Car_Color, Car_Registration)values('"+CarName+"','"+CarModel+"','"+CarVar+"','"+CarMake+"','"+CarColor+"','"+CarReg+"')");
	
	
	 ResultSet rs=st.executeQuery("select * from car where Car_Registration = '"+CarReg+"'");
     while(rs.next()){
         car=rs.getInt("Car_ID");
         }

	   
	   int i=st.executeUpdate("insert into driver(Driver_Fname, Driver_Lname, Driver_Phone, Driver_Pass, Driver_DLC, Car_ID)values('"+Fname+"','"+Lname+"','"+Phone+"','"+Pass+"','"+DLC+"','"+car+"')");
	   

  %>
   <div class="row justify-content-center">
		
			<div class="col-5">
							
			<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
			<symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
			<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
			</symbol>
			</svg>
				
				
			<div class="alert alert-success d-flex align-items-center p-4" role="alert">
			  <svg class="bi flex-shrink-0 me-2" width="34" height="34" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
			  <div style="margin-left: 20px;">
				<strong>Driver Registered Successfully !!</strong>
				  <br>
				  Thankyou for registering on RideEase, Please Login to Continue.
			  </div>
			  </div>
			  
			     <form action="DriverLogin.jsp">
				 <div class="row justify-content-center">
				
				<button type="submit" class="btn btn-success col-3 p-2 mt-2">Continue</button>
				
				</div>
				</form>
			  
				</div>
				</div>
<%

}
catch(Exception e)
{
	  %>
      <div class="row justify-content-center">
		
			<div class="col-5">
							
			<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
			<symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
			<path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
			</symbol>
			</svg>
				
				
			<div class="alert alert-danger d-flex align-items-center" role="alert">
			<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
			  <div style="margin-left: 20px;">
				<strong>An Error has occured !!</strong>
				  <br>
				  Note: Try with a different phone number or Driving License number.
			  </div>
			</div>

    	  <form action="index.jsp#driver">
          <div class="row justify-content-center">
          
		  <button type="submit" class="btn btn-danger col-3 p-2 mt-2">Try Again</button>
		  
		  </div>
		  </form>

        </div>
        </div>
	  <%
        
        
        }

 %>
          



          </div>
        </div>

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





	  