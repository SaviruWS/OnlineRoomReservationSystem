package servlet;


import dao.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        // Only admin can reset passwords
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        if (role == null || !role.equals("ADMIN")) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = request.getParameter("username").trim();
        String newpass = request.getParameter("newpass").trim();

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(
                     "UPDATE users SET password=? WHERE username=?")) {

            ps.setString(1, newpass);
            ps.setString(2, username);
            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.getWriter().println("Password Reset Successful");
            } else {
                response.getWriter().println("Username not found!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error resetting password.");
        }
    }
}