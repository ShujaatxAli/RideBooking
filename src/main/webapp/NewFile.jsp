<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>
    
<%
String driverName = "com.mysql.jdbc.Driver";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

String ID = null;

if (request.getParameter("Cust") != null) {   
    
	   	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
	   	statement=connection.createStatement();
	   	String cus ="select * from customer";
	   	resultSet = statement.executeQuery(cus);
	   	while(resultSet.next()){
		
		ID = resultSet.getString("Cust_Fname");
	}

}
else if (request.getParameter("Driver") != null) {   
    
   	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
   	statement=connection.createStatement();
   	String cus ="select * from driver";
   	resultSet = statement.executeQuery(cus);
   	while(resultSet.next()){
	
	ID = resultSet.getString("Driver_Fname");
}

}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1><%=ID %></h1>
</body>
</html>