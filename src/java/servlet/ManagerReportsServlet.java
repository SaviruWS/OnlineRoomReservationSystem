package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ManagerReportsServlet")
public class ManagerReportsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<String[]> reportList = new ArrayList<>();
        ArrayList<String> roomTypes = new ArrayList<>();
        ArrayList<Double> revenues = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(
                     "SELECT r.room_type, COUNT(r.res_id) AS total_reservations, " +
                     "SUM(rm.price * DATEDIFF(r.checkout, r.checkin)) AS total_revenue " +
                     "FROM reservations r " +
                     "JOIN rooms rm ON r.room_no = rm.room_no " +
                     "GROUP BY r.room_type"
             )) {

            while (rs.next()) {
                String type = rs.getString("room_type");
                String[] row = new String[3];
                row[0] = type;
                row[1] = rs.getString("total_reservations");
                row[2] = rs.getString("total_revenue");

                reportList.add(row);

                // For chart
                roomTypes.add(type);
                revenues.add(rs.getDouble("total_revenue"));
            }

            request.setAttribute("reportList", reportList);
            request.setAttribute("roomTypes", roomTypes);
            request.setAttribute("revenues", revenues);

            request.getRequestDispatcher("managerReports.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error loading reports: " + e.getMessage());
        }
    }
}