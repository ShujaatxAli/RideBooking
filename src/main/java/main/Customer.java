package main;

import java.sql.*;
import java.util.ArrayList;

public class Customer {
	
public ArrayList<String> getCustomerInfo(){
		
		ArrayList<String> driverdetails = new ArrayList<String>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();
		   	
		   	String driver ="select Cust_ID,Cust_Fname,Cust_Lname,Cust_Email,Cust_Phone,Cust_Pass from customer;";
		   	
		   	ResultSet rs = stmt.executeQuery(driver);

			while(rs.next()){
					   		
				driverdetails.add(rs.getString(1));
				driverdetails.add(rs.getString(2)+" "+rs.getString(3));
				driverdetails.add(rs.getString(4));
				driverdetails.add(rs.getString(5));
				driverdetails.add(rs.getString(6));
			}
			conn.close();
			
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
		
		return driverdetails;
	} 

}
