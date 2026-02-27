package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/reserveServlet")
public class reserveServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (Connection con = DBConnection.getConnection()) {

            // Begin transaction
            con.setAutoCommit(false);

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

                try (ResultSet rsGuest = psGuest.getGeneratedKeys()) {
                    if (rsGuest.next()) {
                        guestId = rsGuest.getInt(1); // auto-generated guest_id
                    }
                }
            }

            // --- 4. Get room_type from rooms table ---
            String roomType = "";
            try (PreparedStatement psRoom = con.prepareStatement("SELECT room_type, status FROM rooms WHERE room_no = ?")) {
                psRoom.setInt(1, roomNo);
                try (ResultSet rsRoom = psRoom.executeQuery()) {
                    if (rsRoom.next()) {
                        roomType = rsRoom.getString("room_type");
                        String status = rsRoom.getString("status");
                        if ("Booked".equalsIgnoreCase(status)) {
                            response.getWriter().println("Error: Room " + roomNo + " is already booked!");
                            return; // Exit without committing
                        }
                    } else {
                        response.getWriter().println("Error: Room number " + roomNo + " not found!");
                        return;
                    }
                }
            }

            // --- 5. Insert reservation ---
            int resId = 0;
            String insertResSQL = "INSERT INTO reservations (guest_id, room_no, room_type, checkin, checkout) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement psRes = con.prepareStatement(insertResSQL, Statement.RETURN_GENERATED_KEYS)) {
                psRes.setInt(1, guestId);
                psRes.setInt(2, roomNo);
                psRes.setString(3, roomType);
                psRes.setDate(4, java.sql.Date.valueOf(checkin));
                psRes.setDate(5, java.sql.Date.valueOf(checkout));
                psRes.executeUpdate();

                try (ResultSet rsRes = psRes.getGeneratedKeys()) {
                    if (rsRes.next()) {
                        resId = rsRes.getInt(1); // unique reservation number
                    }
                }
            }

            // --- 6. Update room status to Booked ---
            String updateRoomSQL = "UPDATE rooms SET status = 'Booked' WHERE room_no = ?";
            try (PreparedStatement psUpdateRoom = con.prepareStatement(updateRoomSQL)) {
                psUpdateRoom.setInt(1, roomNo);
                psUpdateRoom.executeUpdate();
            }

            // Commit transaction
            con.commit();

            // Success message
            response.getWriter().println("Reservation successful! Reservation Number: " + resId);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}