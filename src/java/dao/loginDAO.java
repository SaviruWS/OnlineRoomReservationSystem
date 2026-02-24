package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDAO {

    public String validateUser(String username, String password) {
        String role = null;
        try {
            Connection c = DBConnection.getConnection();
            String sql = "SELECT role FROM users WHERE username=? AND password=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }
}