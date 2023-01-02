package main;

import java.sql.*;
import java.util.ArrayList;

public class Driver {
	
	public ArrayList<String> getDriverInfo(){
		
		ArrayList<String> driverdetails = new ArrayList<String>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();
		   	
		   	String driver ="select Driver_ID,Driver_Fname,Driver_Lname,Driver_Phone,Driver_Pass,Driver_DLC,Car_ID from driver;";
		   	
		   	ResultSet rs = stmt.executeQuery(driver);

			while(rs.next()){
					   		
				driverdetails.add(rs.getString(1));
				driverdetails.add(rs.getString(2)+" "+rs.getString(3));
				driverdetails.add(rs.getString(4));
				driverdetails.add(rs.getString(5));
				driverdetails.add(rs.getString(6));
				driverdetails.add(rs.getString(7));
			}
			conn.close();
			
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
		
		return driverdetails;
	} 

}
