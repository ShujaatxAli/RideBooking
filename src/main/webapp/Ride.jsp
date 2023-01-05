<%@page import="main.RideBook"%>
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
String Fare = request.getParameter("Fare");

int ID = 0;
int BookID = 0;
int Status = 0;

String Email=(String)session.getAttribute("Email");
String Pass=(String)session.getAttribute("Pass");  


try
{
	Class.forName("com.mysql.jdbc.Driver");
	Statement st=conn.createStatement();
	
	 ResultSet rs=st.executeQuery("select * from customer where Cust_Email = '"+Email+"'");
     while(rs.next()){
         ID=rs.getInt("Cust_ID");
         }
   
  // int i=st.executeUpdate("insert into booking(Pick_Location, Drop_location,Customer_ID,Fare,Status)values('"+Pick+"','"+Drop+"','"+ID+"','"+Fare+"','0')");
   
  RideBook rideobj = new RideBook();
  
  rideobj.bookARide(Pick, Drop, ID, Fare);
	
	 ResultSet rs3=st.executeQuery("select * from booking where Pick_Location = '"+Pick+"' and Drop_location = '"+Drop+"' and Fare = '"+Fare+"' and Customer_ID = '"+ID+"'");
   while(rs3.next()){
	   BookID=rs3.getInt("Book_ID");
       }
   
}catch(Exception e)
{
	
}

if (request.getParameter("cancel") != null) { 
	
	Class.forName("com.mysql.jdbc.Driver");
	Statement st=conn.createStatement();
	int i = st.executeUpdate("DELETE FROM booking WHERE Book_ID ="+BookID);
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
              <li><label><a href="Update.html"><i class="fa-solid fa-user"></i>&nbsp;&nbsp;Profile</a></label></li>
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
      
        <div class="d-flex justify-content-end align-items-center">
          <ol>
            <li><a href="index.jsp">Home</a></li>
            <li>Customer Login</li>
          </ol>
        </div>

      </div>
    </section>
	  <!-- End Breadcrumbs Section -->
	  
	     <!-- ======= About Section ======= -->
    <section id="CustLogin" class="about">
      <div class="container-fluid mt-5">

      <div class="row justify-content-center">
		
			<div class="col-5">
							
			<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
			<symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
			<path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
			</symbol>
			</svg>
				
				
			<div class="alert alert-success d-flex align-items-center p-4" role="alert">
			<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
			  <div style="margin-left: 20px;">
				<strong>Waiting for Captain to accept your ride......</strong>
				  <br>
				  Note: You can cancel the ride before it is accepted by captain.
				  <br>
			  </div>
			</div>
			
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">Booking #</th>
			      <th scope="col">Pick Location</th>
			      <th scope="col">Drop Location</th>
			      <th scope="col">Fare</th>
			      <th scope="col">Status</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			    <td><%=BookID %></td>
			      <td><%=Pick %></td>
			      <td><%=Drop %></td>
			      <td>Rs. <%=Fare %></td>
			      <td>
			      <%
			  	  Class.forName("com.mysql.jdbc.Driver");
			  	  Statement st=conn.createStatement();
			      ResultSet rs2=st.executeQuery("select * from booking");
			      while(rs2.next()){
			          Status=rs2.getInt("Status");
			          }
			      
			      if(Status == 0){
			    	  out.print("Pending");
			      }
			      else{
			    	  out.print("Accepted");
			      }
			      %>
			      </td>
			    </tr>
			  
			  </tbody>
			</table>

		  <div class="row">
 
          <div class="row justify-content-center">
          <center>
          <form action="CustDashboard.jsp">
          <input type="hidden" name="Email"  value="<%=Email %>">
          <input type="hidden" name="Pass"  value="<%=Pass %>">
		  <button type="submit" class="btn btn-primary col-3 p-2 mt-3">Go Back</button>
		   &nbsp;&nbsp;&nbsp;
		  <button type="submit" name="cancel" class="btn btn-danger col-3 p-2 mt-3">Cancel Ride</button>
		  </form>
		  </center>
		  
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





	  