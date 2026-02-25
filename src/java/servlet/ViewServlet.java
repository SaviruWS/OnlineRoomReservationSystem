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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM guests");
            ResultSet rs = ps.executeQuery();

            ArrayList<String[]> list = new ArrayList<>();

            while (rs.next()) {
                String[] row = new String[5];
                row[0] = rs.getString("rno");
                row[1] = rs.getString("name");
                row[2] = rs.getString("age");
                row[3] = rs.getString("checkin");
                row[4] = rs.getString("checkout");
                list.add(row);
            }

            request.setAttribute("guestList", list);
            RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}