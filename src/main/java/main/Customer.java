package main;

import java.sql.*;

public class Customer {
	
	public String getCustomerInfo(String ID){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();
		   	
		   	String cust ="select * from customer where Cust_ID ="+ID;
		   	
		   	ResultSet rs = stmt.executeQuery(cust);
		   	rs.next();
			
			String CustInfo = "ID: " + rs.getString(1) + " Name: " + rs.getString(2) + " " +rs.getString(3) + " Email " + rs.getString(4) + " Phone: " + rs.getString(5) + " Password: " + rs.getString(6);
			
			
			conn.close();
			
			return CustInfo;
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
		
		return "";
	} 

}
