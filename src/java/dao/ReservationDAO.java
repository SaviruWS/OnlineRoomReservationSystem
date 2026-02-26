package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReservationDAO {

    public boolean insertReservation(int roomNo, String guestName, 
                                     String address, String contactNumber,
                                     String roomType, java.sql.Date checkin, java.sql.Date checkout) throws SQLException, ClassNotFoundException {

        boolean status = false;

        String sql = "INSERT INTO reservations "
                   + "(room_no, guest_name, address, contact_number, room_type, checkin, checkout) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        // Use try-with-resources to ensure resources are closed
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, roomNo);
            ps.setString(2, guestName);
            ps.setString(3, address);
            ps.setString(4, contactNumber);
            ps.setString(5, roomType);
            ps.setDate(6, checkin);
            ps.setDate(7, checkout);

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