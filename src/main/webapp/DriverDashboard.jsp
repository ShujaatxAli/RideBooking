<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>

<%
String driverName = "com.mysql.jdbc.Driver";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;


String Phone = request.getParameter("Phone");
String Pass = request.getParameter("Pass");

%>

<%
PreparedStatement pst = conn.prepareStatement("Select Driver_Phone,Driver_Pass from driver where Driver_Phone=? and Driver_Pass=?");
pst.setString(1, Phone);
pst.setString(2, Pass);

ResultSet rs = pst.executeQuery();                        
if(rs.next()){
	
}
else{
	%><script>  window.location='error2.jsp' </script><%
}
	
%>
    

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>RideEase - Driver</title>
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
			String sql ="SELECT * FROM driver where Driver_Phone='"+Phone+"'";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			
			<%=resultSet.getString("Driver_Fname") %>
			<%=resultSet.getString("Driver_Lname") %>
			
			<%
			}
			%>
			  </span><i class="bi bi-chevron-down"></i></a>
              
              <!-- Dropdown - User Information -->
             <ul>
              <li><label><a href="Update.jsp"><i class="fa-solid fa-user"></i>&nbsp;&nbsp;Profile</a></label></li>
              <li><label><a href="#"><i class="fa-solid fa-car"></i>&nbsp;&nbsp;Ride History</a></label></li>
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
			<%=resultSet.getString("Driver_Fname") %>
			<%=resultSet.getString("Driver_Lname") %>
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
    <section id="DriverLogin" class="about">
      <div class="container-fluid">
		  <center>
			<h2>Ride Requests</h2>
		  <p>To get started Enter your Pickup and drop off location below.</p>
			  </center>
		  <br>
	  <div class="form-group row mt-1 justify-content-center">
      <div class="col-11">
		<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">SN#</th>
      <th scope="col">Customer</th>
      <th scope="col">Pickup Location</th>
      <th scope="col">Dropoff Location</th>
      <th scope="col">Fare</th>
      <th scope="col">Requests</th>
    </tr>
      </thead>
  <tbody>

    <%
try{
	
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
statement=connection.createStatement();


String book ="select customer.Cust_Fname, customer.Cust_Lname, booking.Pick_Location, booking.Drop_location, booking.Fare, booking.Status from customer,booking where customer.Cust_ID = booking.Customer_ID and booking.Status = 0";
resultSet = statement.executeQuery(book);
while(resultSet.next()){
%>
<tr>
<th scope="row">1</th>
<td><%=resultSet.getString("Cust_Fname") %> <%=resultSet.getString("Cust_Lname") %></td>
<td><%=resultSet.getString("Pick_Location") %></td>
<td><%=resultSet.getString("Drop_location") %></td>
<td>Rs. <%=resultSet.getString("Fare") %></td>
<td>
  <button type="submit" class="btn btn-success col-sm-5 p-2">Confirm Ride</button> &nbsp;
  <button type="submit" class="btn btn-danger col-sm-4 p-2">Reject</button>
</td>
</tr>
  </tbody>
  <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
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