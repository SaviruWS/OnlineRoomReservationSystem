package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class guestDAO {

    public boolean insertPerson(int no, String name, int age) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO person(rno, name, age) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, no);
            ps.setString(2, name);
            ps.setInt(3, age);
            

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }
}