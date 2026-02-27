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

        if (resIdStr == null || resIdStr.isEmpty()) {
            response.getWriter().println("Reservation ID is required!");
            return;
        }

        try {
            int resId = Integer.parseInt(resIdStr);

            String sql = "SELECT r.res_id, r.room_no, g.guest_name, g.address, "
                       + "g.contact_number, r.room_type, r.checkin, r.checkout "
                       + "FROM reservations r "
                       + "JOIN guests g ON r.guest_id = g.guest_id "
                       + "WHERE r.res_id = ?";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, resId);

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {

                        String[] reservationDetails = new String[8];

                        reservationDetails[0] = rs.getString("res_id");
                        reservationDetails[1] = rs.getString("room_no");
                        reservationDetails[2] = rs.getString("guest_name");
                        reservationDetails[3] = rs.getString("address");
                        reservationDetails[4] = rs.getString("contact_number");
                        reservationDetails[5] = rs.getString("room_type");
                        reservationDetails[6] = rs.getString("checkin");
                        reservationDetails[7] = rs.getString("checkout");

                        request.setAttribute("reservationDetails", reservationDetails);
                        RequestDispatcher rd = request.getRequestDispatcher("reservationDetails.jsp");
                        rd.forward(request, response);

                    } else {
                        response.getWriter().println("Reservation not found for ID: " + resId);
                    }
                }
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid Reservation ID format!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching reservation: " + e.getMessage());
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