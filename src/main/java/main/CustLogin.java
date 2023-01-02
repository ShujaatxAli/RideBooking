package main;

import java.sql.*;

public class CustLogin {
	
	public String CustLog(String ID){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();
		   	
		   	String driver ="select * from driver where Driver_ID ="+ID;
		   	
		   	ResultSet rs = stmt.executeQuery(driver);
		   	rs.next();
			
			String DriverInfo = "ID: " + rs.getString(1) + " Name: " + rs.getString(2) + " " +rs.getString(3) + " Driver Phone: " + rs.getString(4) + " Driver Password: " + rs.getString(5) + " Driving License: " + rs.getString(6);
			
			
			conn.close();
			
			return DriverInfo;
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
		
		return "";
	} 

}
