package main;

import java.sql.*;

public class Display_Username {
	
	public String getUsernameInfo(String Email){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();
		   	
		   	String Username ="select * from customer where Cust_Email ='"+Email+"'";
		   	
		   	ResultSet rs = stmt.executeQuery(Username);
		   	rs.next();
			
			String Display_Username = "Email: " + rs.getString(1) + " First_Name: " + rs.getString(2) + " " +rs.getString(3) + " Last_Name " + rs.getString(4) ;
			
			
			conn.close();
			
			return Display_Username;
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
		
		return "";
	} 

}
