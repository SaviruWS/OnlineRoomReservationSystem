package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {

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
        String password = request.getParameter("password").trim();
        String userRole = request.getParameter("role").trim();

        try (Connection c = DBConnection.getConnection()) {

            PreparedStatement check = c.prepareStatement(
                    "SELECT id FROM users WHERE username=?");
            check.setString(1, username);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                session.setAttribute("msg", "Username already exists!");
                session.setAttribute("msgType", "error");
                response.sendRedirect("manageUsers.jsp");
                return;
            }

            PreparedStatement ps = c.prepareStatement(
                    "INSERT INTO users(username,password,role) VALUES (?,?,?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, userRole);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                session.setAttribute("msg", "User added successfully!");
                session.setAttribute("msgType", "success");
            } else {
                session.setAttribute("msg", "Error adding user.");
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