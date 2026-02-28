package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/reserveServlet")
public class reserveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;

        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false); // Begin transaction

            // --- 1. Get guest info ---
            String guestName = request.getParameter("guest_name");
            String address = request.getParameter("address");
            String contactNumber = request.getParameter("contact_number");

            // --- 2. Get reservation info ---
            int roomNo = Integer.parseInt(request.getParameter("room_no"));
            String checkin = request.getParameter("checkin");
            String checkout = request.getParameter("checkout");

            // --- 3. Insert guest ---
            String insertGuestSQL = "INSERT INTO guests (guest_name, address, contact_number) VALUES (?, ?, ?)";
            int guestId = 0;

            try (PreparedStatement psGuest = con.prepareStatement(insertGuestSQL, Statement.RETURN_GENERATED_KEYS)) {
                psGuest.setString(1, guestName);
                psGuest.setString(2, address);
                psGuest.setString(3, contactNumber);
                psGuest.executeUpdate();

                ResultSet rsGuest = psGuest.getGeneratedKeys();
                if (rsGuest.next()) {
                    guestId = rsGuest.getInt(1);
                }
            }

            // --- 4. Check room availability ---
            String roomType = "";
            String checkRoomSQL = "SELECT room_type, status FROM rooms WHERE room_no = ?";

            try (PreparedStatement psRoom = con.prepareStatement(checkRoomSQL)) {
                psRoom.setInt(1, roomNo);
                ResultSet rsRoom = psRoom.executeQuery();

                if (rsRoom.next()) {
                    roomType = rsRoom.getString("room_type");
                    String status = rsRoom.getString("status");

                    if ("Booked".equalsIgnoreCase(status)) {
                        response.sendRedirect("reservations.jsp?error=RoomAlreadyBooked");
                        return;
                    }
                } else {
                    response.sendRedirect("reservations.jsp?error=RoomNotFound");
                    return;
                }
            }

            // --- 5. Insert reservation ---
            String insertResSQL = "INSERT INTO reservations (guest_id, room_no, room_type, checkin, checkout) VALUES (?, ?, ?, ?, ?)";
            int resId = 0;

            try (PreparedStatement psRes = con.prepareStatement(insertResSQL, Statement.RETURN_GENERATED_KEYS)) {
                psRes.setInt(1, guestId);
                psRes.setInt(2, roomNo);
                psRes.setString(3, roomType);
                psRes.setDate(4, java.sql.Date.valueOf(checkin));
                psRes.setDate(5, java.sql.Date.valueOf(checkout));
                psRes.executeUpdate();

                ResultSet rsRes = psRes.getGeneratedKeys();
                if (rsRes.next()) {
                    resId = rsRes.getInt(1);
                }
            }

            // --- 6. Update room status ---
            String updateRoomSQL = "UPDATE rooms SET status = 'Booked' WHERE room_no = ?";
            try (PreparedStatement psUpdateRoom = con.prepareStatement(updateRoomSQL)) {
                psUpdateRoom.setInt(1, roomNo);
                psUpdateRoom.executeUpdate();
            }

            // Commit transaction
            con.commit();

            // ✅ Redirect to success page (BEST PRACTICE)
            response.sendRedirect("ReservationSuccessServlet?res_id=" + resId);

        } catch (Exception e) {

            try {
                if (con != null) {
                    con.rollback(); // rollback if error
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            response.sendRedirect("reservations.jsp?error=DatabaseError");

        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}