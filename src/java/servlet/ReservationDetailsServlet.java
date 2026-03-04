package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ReservationDetailsServlet")
public class ReservationDetailsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String resIdStr = request.getParameter("res_id");
        String guestName = request.getParameter("guest_name");

        // Trim guest name to avoid whitespace issues
        if (guestName != null) guestName = guestName.trim();

        try (Connection con = DBConnection.getConnection()) {

            String sql;
            PreparedStatement ps;

            if (resIdStr != null && !resIdStr.isEmpty()) {
                // Search by Reservation ID
                int resId = Integer.parseInt(resIdStr);
                sql = "SELECT r.res_id, r.room_no, g.guest_name, g.address, "
                    + "g.contact_number, r.room_type, r.checkin, r.checkout "
                    + "FROM reservations r "
                    + "JOIN guests g ON r.guest_id = g.guest_id "
                    + "WHERE r.res_id = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, resId);

            } else if (guestName != null && !guestName.isEmpty()) {
                // Search by Guest Name (partial match)
                sql = "SELECT r.res_id, r.room_no, g.guest_name, g.address, "
                    + "g.contact_number, r.room_type, r.checkin, r.checkout "
                    + "FROM reservations r "
                    + "JOIN guests g ON r.guest_id = g.guest_id "
                    + "WHERE g.guest_name LIKE ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + guestName + "%");

            } else {
                response.getWriter().println("Please enter Reservation ID or Guest Name to search!");
                return;
            }

            try (ResultSet rs = ps.executeQuery()) {

                boolean hasResults = false;

                // Store multiple results if searching by name
                java.util.ArrayList<String[]> reservationList = new java.util.ArrayList<>();

                while (rs.next()) {
                    hasResults = true;
                    String[] reservationDetails = new String[8];
                    reservationDetails[0] = rs.getString("res_id");
                    reservationDetails[1] = rs.getString("room_no");
                    reservationDetails[2] = rs.getString("guest_name");
                    reservationDetails[3] = rs.getString("address");
                    reservationDetails[4] = rs.getString("contact_number");
                    reservationDetails[5] = rs.getString("room_type");
                    reservationDetails[6] = rs.getString("checkin");
                    reservationDetails[7] = rs.getString("checkout");

                    reservationList.add(reservationDetails);
                }

                if (hasResults) {
                    request.setAttribute("reservationList", reservationList);
                    RequestDispatcher rd = request.getRequestDispatcher("reservationDetails.jsp"); // reuse your view page
                    rd.forward(request, response);
                } else {
                    response.getWriter().println("No reservations found matching your search criteria.");
                }
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid Reservation ID format!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching reservations: " + e.getMessage());
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