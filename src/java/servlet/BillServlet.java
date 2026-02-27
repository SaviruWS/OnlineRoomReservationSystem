package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int resId = Integer.parseInt(request.getParameter("res_id"));

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT r.res_id, r.checkin, r.checkout, rm.price, g.guest_name, rm.room_no " +
                         "FROM reservations r " +
                         "JOIN rooms rm ON r.room_no = rm.room_no " +
                         "JOIN guests g ON r.guest_id = g.guest_id " +
                         "WHERE r.res_id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, resId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String guestName = rs.getString("guest_name");
                int roomNo = rs.getInt("room_no");
                LocalDate checkin = rs.getDate("checkin").toLocalDate();
                LocalDate checkout = rs.getDate("checkout").toLocalDate();
                double price = rs.getDouble("price");

                long nights = ChronoUnit.DAYS.between(checkin, checkout);
                double total = nights * price;

                request.setAttribute("guestName", guestName);
                request.setAttribute("roomNo", roomNo);
                request.setAttribute("checkin", checkin);
                request.setAttribute("checkout", checkout);
                request.setAttribute("nights", nights);
                request.setAttribute("price", price);
                request.setAttribute("total", total);

                request.getRequestDispatcher("Bill.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}