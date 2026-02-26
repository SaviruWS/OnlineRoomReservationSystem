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

        // SQL query for fetching all reservations with updated columns
        String sql = "SELECT res_id, room_no, guest_name, address, contact_number, room_type, checkin, checkout FROM reservations";

        // Use try-with-resources to automatically close DB resources
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            ArrayList<String[]> list = new ArrayList<>();

            while (rs.next()) {
                String[] row = new String[8]; // 8 columns now
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

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching reservations: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            System.getLogger(ViewServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
    }
}