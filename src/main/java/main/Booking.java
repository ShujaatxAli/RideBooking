package main;

import java.sql.*;

public class Booking {
	
	public void getBookingInfo(){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ridebooking", "root", "root");
		   	Statement stmt =conn.createStatement();
		   	
		   	String book ="select booking.Book_ID,booking.Pick_Location,booking.Drop_location,booking.Fare,customer.Cust_Fname,customer.Cust_Lname,driver.Driver_Fname,driver.Driver_Lname, car.Car_Make, car.Car_Name,car.Car_Model from customer,driver,car,booking where customer.Cust_ID = booking.Customer_ID and driver.Driver_ID = booking.Driver_ID and car.Car_ID = driver.Car_ID;";
		   	
		   	ResultSet rs = stmt.executeQuery(book);
		   	while(rs.next()){
			
			System.out.println("Book ID: " + rs.getString(1) + " Pick Location: " + rs.getString(2) + " Drop Location: " +rs.getString(3) + " Fare: " + rs.getString(4) + " Customer: " + rs.getString(5) + " " +rs.getString(6) + " Driver: " + rs.getString(7)+ " " + rs.getString(8) +" Car: " + rs.getString(9) +" "+ rs.getString(10) +" "+ rs.getString(11));
			
		   	}
			conn.close();
			
			
			}catch(Exception e) {
				
				System.out.println(e);
			}
	} 

}
