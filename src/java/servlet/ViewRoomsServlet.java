package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewRoomsServlet")
public class ViewRoomsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<String[]> roomList = new ArrayList<>();

        // 🔥 Show Available rooms first, then Booked
        String sql = "SELECT room_no, room_type, price, status "
                   + "FROM rooms "
                   + "ORDER BY status ASC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String[] row = new String[4];
                row[0] = rs.getString("room_no");
                row[1] = rs.getString("room_type");
                row[2] = rs.getString("price");
                row[3] = rs.getString("status");

                roomList.add(row);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage",
                    "Error loading rooms: " + e.getMessage());
        }

        request.setAttribute("roomList", roomList);
        RequestDispatcher rd = request.getRequestDispatcher("viewRooms.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}