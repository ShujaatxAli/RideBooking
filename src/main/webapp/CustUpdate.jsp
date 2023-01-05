<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*,java.util.*"%>

<!-- =============== BACK END ==================== -->
          
<%

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");

String Email=(String)session.getAttribute("Email");
int ID = 0;

Class.forName("com.mysql.jdbc.Driver");
Statement stt=conn.createStatement();


ResultSet rs=stt.executeQuery("select * from customer where Cust_Email = '"+Email+"'");
while(rs.next()){
    ID=rs.getInt("Cust_ID");
    }

//Update

String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String pass = request.getParameter("pass");

PreparedStatement ps = null;

Class.forName("com.mysql.jdbc.Driver");
Statement st=conn.createStatement();

String update ="Update customer set Cust_Fname=?,Cust_Lname=?,Cust_Email=?,Cust_Phone=?,Cust_Pass=? where Cust_ID="+ID;

ps = conn.prepareStatement(update);
ps.setString(1, fname);
ps.setString(2, lname);
ps.setString(3, email);
ps.setString(4, phone);
ps.setString(5, pass);

int i = ps.executeUpdate();

if(i > 0)
{
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>RideEase - Customer Update</title>
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
 <div class="row justify-content-center mt-5">
		
			<div class="col-5 mt-5">
							
			<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
			<symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
			<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
			</symbol>
			</svg>
				
				
			<div class="alert alert-success d-flex align-items-center p-4" role="alert">
			  <svg class="bi flex-shrink-0 me-2" width="34" height="34" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
			  <div style="margin-left: 20px;">
				<strong>Data Successfully Updated !!</strong>
				  <br>
				  Your Data is successfully updated.
			  </div>
			  </div>
			  
				<form action="CustDashboard.jsp">
				<div class="row justify-content-center">
				<input type="hidden" name="Email"  value="<%=email %>">
				<input type="hidden" name="Pass"  value="<%=pass %>">
				<button type="submit" class="btn btn-success col-3 p-2 mt-2">Continue</button>
				</div>
				</form>
			  
				</div>
				</div>
</body>
</html>
<%
	
	
}
else
{
out.print("An Error has Occured, Please Re-Try.");
} 

%>