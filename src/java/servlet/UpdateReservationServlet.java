package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection con = DBConnection.getConnection()) {

            int resId = Integer.parseInt(request.getParameter("res_id"));
            int guestId = Integer.parseInt(request.getParameter("guest_id"));
            String guestName = request.getParameter("guest_name");
            String address = request.getParameter("address");
            String contactNumber = request.getParameter("contact_number");
            int roomNo = Integer.parseInt(request.getParameter("room_no"));
            String checkin = request.getParameter("checkin");
            String checkout = request.getParameter("checkout");

            // --- 1. Update guests table ---
            String updateGuestSQL = "UPDATE guests SET guest_name=?, address=?, contact_number=? WHERE guest_id=?";
            try (PreparedStatement psGuest = con.prepareStatement(updateGuestSQL)) {
                psGuest.setString(1, guestName);
                psGuest.setString(2, address);
                psGuest.setString(3, contactNumber);
                psGuest.setInt(4, guestId);
                psGuest.executeUpdate();
            }

            // --- 2. Update reservations table ---
            String updateResSQL = "UPDATE reservations SET room_no=?, checkin=?, checkout=? WHERE res_id=?";
            try (PreparedStatement psRes = con.prepareStatement(updateResSQL)) {
                psRes.setInt(1, roomNo);
                psRes.setDate(2, java.sql.Date.valueOf(checkin));
                psRes.setDate(3, java.sql.Date.valueOf(checkout));
                psRes.setInt(4, resId);
                psRes.executeUpdate();
            }

            // ✅ SUCCESS MESSAGE (Using Session)
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Reservation updated successfully!");

            response.sendRedirect("ViewServlet");

        } catch (Exception e) {
            e.printStackTrace();

            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Error updating reservation!");

            response.sendRedirect("ViewServlet");
        }
    }
}