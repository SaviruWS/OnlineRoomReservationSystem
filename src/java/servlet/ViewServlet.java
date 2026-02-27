package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sql = "SELECT r.res_id, r.room_no, g.guest_name, g.address, g.contact_number, "
                   + "r.room_type, r.checkin, r.checkout "
                   + "FROM reservations r "
                   + "JOIN guests g ON r.guest_id = g.guest_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            ArrayList<String[]> list = new ArrayList<>();

            while (rs.next()) {
                String[] row = new String[8];

                row[0] = rs.getString("res_id");
                row[1] = rs.getString("room_no");
                row[2] = rs.getString("guest_name");
                row[3] = rs.getString("address");
                row[4] = rs.getString("contact_number");
                row[5] = rs.getString("room_type");
                row[6] = rs.getString("checkin");
                row[7] = rs.getString("checkout");

                list.add(row);
            }
            
            

            request.setAttribute("reservationList", list);
            RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching reservations: " + e.getMessage());
        }
    }
}