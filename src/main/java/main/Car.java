package main;

import java.sql.*;

public class Car {
	
	public String getCarInfo(String ID){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();
		   	
		   	String car ="select * from car where Car_ID ="+ID;
		   	
		   	ResultSet rs = stmt.executeQuery(car);
		   	rs.next();
			
			String CarInfo = "ID: " + rs.getString(1) + " Make: " + rs.getString(2) + " Name: " +rs.getString(3) + " Variant " + rs.getString(4) + " Model: " + rs.getString(5) + " Color: " + rs.getString(6)+ " Registeration: " + rs.getString(7);
			
			
			conn.close();
			
			return CarInfo;
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
		
		return "";
	} 

}
