<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>
    
<%

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

String Email=(String)session.getAttribute("Email");
String Pass=(String)session.getAttribute("Pass");  

session.setAttribute("Email",Email);
session.setAttribute("Pass",Pass);

String Fname = null;
String Lname = null;
String Email2 = null;
int Phone = 0;
String Pass2 = null;

// Update

String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String pass = request.getParameter("pass");

%>   
 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>RideEase - Dashboard</title>
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

.Dashbtn {
    border: none;
    outline: none;
    background: none;
    cursor: pointer;
    color: inherit;
    padding: 0;
    text-decoration: none;
    font-family: inherit;
    font-size: inherit;
    font-weight:600;
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
          <li><a class="nav-link scrollto" href="index.html#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="index.html#about">Sign up as Customer</a></li>
          <li><a class="nav-link scrollto" href="index.html#driver">Sign up as Captain</a></li>
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
              <li><label><a href="DriverDashboard.jsp"><i class="fa-solid fa-user"></i>&nbsp;&nbsp;
              
              <form action="CustDashboard.jsp">
          <input type="hidden" name="Email"  value="<%=Email %>">
          <input type="hidden" name="Pass"  value="<%=Pass %>">
		  <button type="submit" class="Dashbtn">Dashboard</button>
	
		  </form>
              
              </a></label></li>
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
    <section id="DriverLogin" class="about">
      <div class="container-fluid p-5" style="margin-top: -50px;">
		  
		  
		   <div class="row">


            <div class="col-12 mb-4">

              <!-- Approach -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Edit your profile</h6>
                </div>
                
       <%
       
      	resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			
			Fname = resultSet.getString("Cust_Fname");
			Lname = resultSet.getString("Cust_Lname");
			Email2 = resultSet.getString("Cust_Email");
			Phone = resultSet.getInt("Cust_Phone");
			Pass2 = resultSet.getString("Cust_Pass");
			
		}
       
       %>
                
                <div class="card-body">
                  
					<div class="container bootstrap snippet">
						
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              

      <div class="row mt-4">
		 
		  
		<img src="assets/img/user2.png" class="avatar img-circle img-thumbnail" alt="avatar" style="height: auto; width: 80%;">
       <!-- <img src="Users/user2.png" class="avatar img-circle img-thumbnail" alt="avatar">-->
		  
		<form method="POST" enctype="multipart/form-data">
        <input type="file" id="file" name="image" class="file text-center center-block file-upload mt-4" required>
		<button class="btn btn-sm btn-success mt-4" type="submit" name="uploaded" id="uploaded" style="width: 80%;"><i class="fas fa-check-circle"></i> Upload</button>
		</form>
	
		
      </div><br>

               
          <div class="panel panel-default" style="width: 250px;">
            <div class="panel-heading"><b>Note: </b>The aspect ratio of picture should be 1:1 (Square) and the size of your picture should not exceed 2 MB.
			  </div>
          </div>
          
        </div><!--/col-3-->
    	<div class="col-sm-9">

              
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                  <form class="form" method="post" action="CustUpdate.jsp">
					  
                      <div class="row">
						<div class="col-12">
						  
							  <div class="row justify-content-around">
								  
							  <div class="col-5">
							  
								<label><h4>First Name</h4></label>
								<input type="text" class="form-control" value="<%=Fname %>" placeholder="<%=Fname %>" name="fname" id="fname" autocomplete="off">
								
							  </div>
							  
							  <div class="col-5">
							  
								<label><h4>Last Name</h4></label>
								<input type="text" class="form-control" value="<%=Lname %>" placeholder="<%=Lname %>" name="lname" id="lname" autocomplete="off">
								  
							  </div>
								  
							  </div>
							  
						  </div>
                      </div>
          
                      <div class="row">
						<div class="col-12 mt-3">
						  
							  <div class="row justify-content-around">
								  
							  <div class="col-5">
							  
								<label><h4>Phone</h4></label>
								<input type="number" class="form-control" value="<%=Phone %>" placeholder="<%=Phone %>" name="phone" id="phone" autocomplete="off">
								
							  </div>
							  
							  <div class="col-5">
							  
								<label><h4>Email</h4></label>
								<input type="text" class="form-control" value="<%=Email2 %>" placeholder="<%=Email2 %>" name="email" id="email" autocomplete="off">
								
							  </div>
								  
							  </div>
							  
						  </div>
                      </div>
					  
					  <div class="row">
						<div class="col-12 mt-3">
						  
							  <div class="row justify-content-around">
								  
							  <div class="col-5">
							  
								<label><h4>Old Password</h4></label>
								<input type="pass" class="form-control" value="<%=Pass %>" placeholder="<%=Pass %>" name="Pass1" id="Pass1" readonly disabled>
								
							  </div>
							  
							  <div class="col-5">
							  
								<label><h4>Change Password</h4></label>
								<input type="pass" class="form-control" value="<%=Pass %>" placeholder="<%=Pass %>"  name="pass" id="pass" autocomplete="off">
								  
							  </div>
								  
							  </div>
							  
						  </div>
                      </div>
					  
					  <div class="row">
						<div class="col-12 mt-5">
						  
							  <div class="row justify-content-around">
								  
							  <div class="col-5">
							  
								<button class="btn btn-lg btn-primary" type="submit" name="update" id="update" style="width: 50%;"><i class="fas fa-check-circle"></i> Update</button>
								
							  </div>
							  
							  <div class="col-5">
							  
								<button type="submit" name="btn" id="btn" class="btn btn-lg btn-dark" style="width: 50%;"><i class="fas fa-times-circle"></i> Cancel</button>
								
							  </div>
								  
							  </div>
							  
						  </div>
                      </div>
					
              	</form>
				
					
      
					  </div>
					  </div>
					  </div>
					  </div>
		
				
              <hr>
		 
        

      </div>
      </div>
      </div>
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