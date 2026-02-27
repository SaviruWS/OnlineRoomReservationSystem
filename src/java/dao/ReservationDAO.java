package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReservationDAO {

    public boolean insertReservation(int roomNo, String guestName, 
                                     String address, String contactNumber,
                                     String roomType, java.sql.Date checkin, java.sql.Date checkout) 
                                     throws SQLException, ClassNotFoundException {

        boolean status = false;

        // 1️⃣ Insert reservation
        String insertSQL = "INSERT INTO reservations "
                         + "(room_no, guest_name, address, contact_number, room_type, checkin, checkout) "
                         + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        // 2️⃣ Update room status
        String updateRoomSQL = "UPDATE rooms SET status = 'Booked' WHERE room_no = ?";

        try (Connection con = DBConnection.getConnection()) {

            // Start transaction
            con.setAutoCommit(false);

            // Insert reservation
            try (PreparedStatement ps = con.prepareStatement(insertSQL)) {
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
            }

            // Update room status
            try (PreparedStatement psUpdate = con.prepareStatement(updateRoomSQL)) {
                psUpdate.setInt(1, roomNo);
                psUpdate.executeUpdate();
            }

            // Commit transaction
            con.commit();

        } catch (SQLException e) {
            e.printStackTrace();
            status = false;
        }

        return status;
    }
}