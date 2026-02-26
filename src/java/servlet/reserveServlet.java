package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/reserveServlet")
public class reserveServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set response type
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Get parameters from JSP
            int roomNo = Integer.parseInt(request.getParameter("room_no"));
            String guestName = request.getParameter("guest_name");
            String address = request.getParameter("address");
            String contactNumber = request.getParameter("contact_number");
            String checkin = request.getParameter("checkin");
            String checkout = request.getParameter("checkout");

            // Validate mandatory fields
            if (guestName == null || guestName.isEmpty() || checkin == null || checkout == null
                    || address == null || contactNumber == null) {
                response.getWriter().println("Error: All fields are required!");
                return;
            }

            // Lookup room_type and price from rooms table
            String roomType = "";
            double pricePerDay = 0;

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement psRoom = con.prepareStatement(
                         "SELECT room_type, price FROM rooms WHERE room_no = ?")) {

                psRoom.setInt(1, roomNo);

                try (ResultSet rs = psRoom.executeQuery()) {
                    if (rs.next()) {
                        roomType = rs.getString("room_type");
                        pricePerDay = rs.getDouble("price");
                    } else {
                        response.getWriter().println("Error: Room number " + roomNo + " not found!");
                        return;
                    }
                }

                // Insert reservation
                String insertSQL = "INSERT INTO reservations (room_no, guest_name, address, contact_number, room_type, checkin, checkout) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement psInsert = con.prepareStatement(insertSQL)) {
                    psInsert.setInt(1, roomNo);
                    psInsert.setString(2, guestName);
                    psInsert.setString(3, address);
                    psInsert.setString(4, contactNumber);
                    psInsert.setString(5, roomType);
                    psInsert.setDate(6, java.sql.Date.valueOf(checkin));
                    psInsert.setDate(7, java.sql.Date.valueOf(checkout));

                    psInsert.executeUpdate();
                }

            }

            // Redirect to view reservations
            response.sendRedirect("ViewServlet");

        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid room number. Please enter a valid number.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Unexpected error: " + e.getMessage());
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