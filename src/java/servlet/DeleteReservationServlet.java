package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteReservationServlet")
public class DeleteReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int resId = Integer.parseInt(request.getParameter("res_id"));

        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);

            // 1. Get the room number of this reservation
            int roomNo = 0;
            try (PreparedStatement psSelect = con.prepareStatement("SELECT room_no FROM reservations WHERE res_id = ?")) {
                psSelect.setInt(1, resId);
                try (ResultSet rs = psSelect.executeQuery()) {
                    if (rs.next()) {
                        roomNo = rs.getInt("room_no");
                    } else {
                        response.getWriter().println("Reservation not found!");
                        return;
                    }
                }
            }

            // 2. Delete reservation
            try (PreparedStatement psDelete = con.prepareStatement("DELETE FROM reservations WHERE res_id = ?")) {
                psDelete.setInt(1, resId);
                psDelete.executeUpdate();
            }

            // 3. Update room status to Available
            try (PreparedStatement psUpdateRoom = con.prepareStatement("UPDATE rooms SET status = 'Available' WHERE room_no = ?")) {
                psUpdateRoom.setInt(1, roomNo);
                psUpdateRoom.executeUpdate();
            }

            con.commit();
            response.getWriter().println("Reservation deleted successfully!");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting reservation: " + e.getMessage());
        }
    }
}