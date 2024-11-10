package MVC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RestaurantDAO {
    public static int saveData(RestaurantBean r) {
        int result = 0;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mvc", "root", "Sumit4403");
            PreparedStatement ps = con.prepareStatement("insert into restaurant values(?, ?, ?, ?)");

            ps.setString(1, r.getC_id());
            ps.setString(2, r.getC_item());
            ps.setString(3, r.getPrice());
            ps.setString(4, r.getFeedback());

            result = ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
