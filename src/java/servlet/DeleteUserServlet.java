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

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        // Only admin can delete users
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
                 request.getSession().setAttribute("message", "User deleted successfully!");
            } else {
             request.getSession().setAttribute("message", "Error deleting user.");
            }response.sendRedirect("manageUsers.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting user.");
        }
    }
}