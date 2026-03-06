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

            int roomNo = 0;
            try (PreparedStatement psSelect = con.prepareStatement(
                    "SELECT room_no FROM reservations WHERE res_id = ?")) {
                psSelect.setInt(1, resId);
                try (ResultSet rs = psSelect.executeQuery()) {
                    if (rs.next()) {
                        roomNo = rs.getInt("room_no");
                    } else {
                        response.getWriter().write("Reservation not found!");
                        return;
                    }
                }
            }

            try (PreparedStatement psDelete = con.prepareStatement(
                    "DELETE FROM reservations WHERE res_id = ?")) {
                psDelete.setInt(1, resId);
                int deleted = psDelete.executeUpdate();
                if (deleted == 0) {
                    response.getWriter().write("Reservation could not be deleted!");
                    return;
                }
            }

            try (PreparedStatement psUpdateRoom = con.prepareStatement(
                    "UPDATE rooms SET status = 'Available' WHERE room_no = ?")) {
                psUpdateRoom.setInt(1, roomNo);
                psUpdateRoom.executeUpdate();
            }

            con.commit();

            //  Send success message 
            response.getWriter().write("Reservation deleted successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error deleting reservation: " + e.getMessage());
        }
    }
}