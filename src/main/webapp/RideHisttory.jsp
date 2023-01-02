<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>

<!-- =============== BACK END ==================== -->
          
<%

String driverName = "com.mysql.jdbc.Driver";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

String Pick = request.getParameter("Pick");
String Drop = request.getParameter("Drop");
int ID = 0;
int Status = 0;

String Email=(String)session.getAttribute("Email");
String Pass=(String)session.getAttribute("Pass");  

Class.forName("com.mysql.jdbc.Driver");
Statement stt=conn.createStatement();

 ResultSet rs=stt.executeQuery("select * from customer where Cust_Email = '"+Email+"'");
 while(rs.next()){
     ID=rs.getInt("Cust_ID");
     }



  %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>RideEase - Customer Login</title>
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
      
        <div class="d-flex justify-content-end align-items-center">
          <ol>
            <li><a href="CustDashboard.jsp">Dashboard</a></li>
            <li>Ride History</li>
          </ol>
        </div>

      </div>
    </section>
	  <!-- End Breadcrumbs Section -->
	  
	     <!-- ======= About Section ======= -->
    <section id="CustLogin" class="about">
      <div class="container-fluid mt-2">

      <div class="row justify-content-center">
			<div class="col-5">
			<center>
			<h1>Your Ride History</h1>
			<hr>
			</center>
			<br>
			
			
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">Pick Location</th>
			      <th scope="col">Drop Location</th>
			      <th scope="col">Fare</th>
			      <th scope="col">Status</th>
			    </tr>
			  </thead>
			  <tbody>
			   <%
			  	  Class.forName("com.mysql.jdbc.Driver");
			  	  Statement st=conn.createStatement();
			      ResultSet rs2=st.executeQuery("select * from booking where Customer_ID = "+ID);
			      while(rs2.next()){
			          
			      %>
			    <tr>
			      <td><%=rs2.getString(2) %></td>
			      <td><%=rs2.getString(3) %></td>
			      <td>Rs. <%=rs2.getString(4) %></td>
			      <td>
			      <%
			      Status = rs2.getInt(7);
			      
			      if(Status == 1){
			    	  %><font color="green">Completed</font><%
			      }
			      else if(Status == 2){
			    	  %><font color="red">Rejected</font><%
			      }
			      else{
			    	  out.print("Pending");
			      }
			      %>
			      </td>
			    </tr>
			  <%
			      }
			  %>
			  </tbody>
			</table>

    	  <form action="CustDashboard.jsp">
          <div class="row justify-content-center">
          <input type="hidden" name="Email"  value="<%=Email %>">
          <input type="hidden" name="Pass"  value="<%=Pass %>">
		  <button type="submit" class="btn btn-primary col-3 p-2 mt-3">Go Back</button>
		  </div>
		  </form>

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





	  