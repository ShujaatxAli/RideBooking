package main;

import java.util.*;
import java.sql.*;

public class RideBook {
	
	public void bookARide(String Pick, String Drop, int ID, String Fare){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();
		   	
		   	int i=stmt.executeUpdate("insert into booking(Pick_Location, Drop_location,Customer_ID,Fare,Status)values('"+Pick+"','"+Drop+"','"+ID+"','"+Fare+"','0')");
		    
		   	conn.close();
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
	} 

}
