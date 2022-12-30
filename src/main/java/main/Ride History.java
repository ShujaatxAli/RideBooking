package main;

import java.sql.*;

public class Ride_History {
	
	public String getRideInfo(String ID){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();
		   	
		   	String Ride_History ="select * from Booking where Customer_ID = " +ID;
		   	
		   	ResultSet rs = stmt.executeQuery(Ride_History);
		   	rs.next();
			
			String RideInfo = "Book_ID: " + rs.getString(1) + " Pick_Location: " + rs.getString(2) + " Drop_Location: " +rs.getString(3) + " Fare "  +rs.getString(4) + "Driver_ID" +rs.getString(5) + "Status" +rs.getString(6) ;
			
			
			conn.close();
			
			return RideInfo;
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
		
		return "";
	} 

}
