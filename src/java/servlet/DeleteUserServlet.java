package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");

        if (role == null || !role.equals("ADMIN")) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = request.getParameter("username").trim();

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(
                     "DELETE FROM users WHERE username=?")) {

            ps.setString(1, username);
            int rows = ps.executeUpdate();

            if (rows > 0) {
                session.setAttribute("msg", "User deleted successfully!");
                session.setAttribute("msgType", "success");
            } else {
                session.setAttribute("msg", "Error deleting user.");
                session.setAttribute("msgType", "error");
            }

            response.sendRedirect("manageUsers.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", "System error occurred.");
            session.setAttribute("msgType", "error");
            response.sendRedirect("manageUsers.jsp");
        }
    }
}