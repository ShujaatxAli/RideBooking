package main;

import java.util.*;
import java.sql.*;

public class RideHistory {
	
	public ArrayList<String> getRideHistory(String ID){
		

		ArrayList<String> Ridehistory = new ArrayList<String>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();

		   	ResultSet rs2=stmt.executeQuery("select * from booking where Customer_ID = "+ID);
		    while(rs2.next()){
		    	  
		    	Ridehistory.add(rs2.getString(2));

		    	Ridehistory.add(rs2.getString(3));

		    	Ridehistory.add(rs2.getString(4));

		    	Ridehistory.add(rs2.getString(7));
		      }
		   	conn.close();
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
		return Ridehistory;
	} 

}
