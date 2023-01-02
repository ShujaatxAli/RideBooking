package main;

import java.util.*;
import java.sql.*;

public class LoginDetails {
	
	public int getLoginInfo(String Email, String Pass){
		
		int i=0;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	
		   	PreparedStatement pst = conn.prepareStatement("Select Cust_Email,Cust_Pass from customer where Cust_Email=? and Cust_Pass=?");
		   	pst.setString(1, Email);
		   	pst.setString(2, Pass);

		   	ResultSet rs = pst.executeQuery();                        
		   	if(rs.next()){
		   		i = 1;
		   	}
		   	else{
		   		 i = 0;
		   	}
		   	conn.close();
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
		return i;
	} 

}
