package MVC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class PrintData {
    public ArrayList<RestaurantBean> getCustomerData() throws ClassNotFoundException, SQLException {
        ArrayList<RestaurantBean> customerList = new ArrayList<>();
        
        Class.forName("com.mysql.cj.jdbc.Driver");  // Register MySQL JDBC Driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mvc", "root", "Sumit4403"); // Connect to DB
        Statement stmt = con.createStatement();  // Create Statement
        String query = "SELECT * FROM restaurant"; // Query to fetch customer data
        ResultSet rs = stmt.executeQuery(query);  // Execute Query
        
        // Populate the ArrayList with RestaurantBean objects
        while (rs.next()) {
            RestaurantBean customer = new RestaurantBean();
            customer.setC_id(rs.getString("c_id"));
            customer.setC_item(rs.getString("c_item"));
            customer.setPrice(rs.getString("price"));
            customer.setFeedback(rs.getString("feedback"));
            customerList.add(customer);
        }
        
        rs.close();
        stmt.close();
        con.close();
        
        return customerList;
    }
}
