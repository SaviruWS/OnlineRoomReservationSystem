package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ReservationSuccessServlet")
public class ReservationSuccessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String resIdParam = request.getParameter("res_id");
        if (resIdParam == null) {
            response.sendRedirect("reservations.jsp?error=NoReservationId");
            return;
        }

        int resId = Integer.parseInt(resIdParam);

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT r.res_id, r.room_no, r.room_type, r.checkin, r.checkout, "
                       + "g.guest_name, g.address, g.contact_number "
                       + "FROM reservations r "
                       + "JOIN guests g ON r.guest_id = g.guest_id "
                       + "WHERE r.res_id = ?";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, resId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("res_id", rs.getInt("res_id"));
                        request.setAttribute("guest_name", rs.getString("guest_name"));
                        request.setAttribute("address", rs.getString("address"));
                        request.setAttribute("contact_number", rs.getString("contact_number"));
                        request.setAttribute("room_no", rs.getInt("room_no"));
                        request.setAttribute("room_type", rs.getString("room_type"));
                        request.setAttribute("checkin", rs.getDate("checkin"));
                        request.setAttribute("checkout", rs.getDate("checkout"));
                    } else {
                        response.sendRedirect("reservations.jsp?error=ReservationNotFound");
                        return;
                    }
                }
            }

            // Forward to JSP to show reservation success
            request.getRequestDispatcher("reservationSuccess.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("reservations.jsp?error=DatabaseError");
        }
    }
}