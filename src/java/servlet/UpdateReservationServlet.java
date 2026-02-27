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

        response.setContentType("text/html;charset=UTF-8");

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

            // Success redirect
            response.sendRedirect("ViewServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating reservation: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET to POST or show error
        response.getWriter().println("Use POST to update reservation.");
    }
}