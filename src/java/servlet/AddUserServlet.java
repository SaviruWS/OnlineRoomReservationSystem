package servlet;



import dao.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        // Only admin can add users
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

            // 1️⃣ Check if username already exists
            PreparedStatement check = c.prepareStatement(
                    "SELECT * FROM users WHERE username=?"
            );
            check.setString(1, username);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                response.getWriter().println("Username already exists!");
                return; // stop execution
            }

            // 2️⃣ Insert new user
            PreparedStatement ps = c.prepareStatement(
                    "INSERT INTO users(username, password, role) VALUES (?, ?, ?)"
            );
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, userRole);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.getWriter().println("User added successfully.");
            } else {
                response.getWriter().println("Error adding user.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding user. Please try again.");
        }
    }
}