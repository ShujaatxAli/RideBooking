package main;

import java.util.*;
import java.sql.*;


public class Car {
	
public ArrayList<String> getCarInfo(){
		
		ArrayList<String> cardetails = new ArrayList<String>();
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();
		   	
		   	String car ="select * from car";
		   	
		   	ResultSet rs = stmt.executeQuery(car);
		  
		   	
		   	while(rs.next()){
		   		
		   		cardetails.add(rs.getString(1));
		   		cardetails.add(rs.getString(2));
		   		cardetails.add(rs.getString(3));
		   		cardetails.add(rs.getString(4));
		   		cardetails.add(rs.getString(5));
		   		cardetails.add(rs.getString(6));
		   		cardetails.add(rs.getString(7));

		   	}
		   	conn.close();
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
		return cardetails;
	} 

}
