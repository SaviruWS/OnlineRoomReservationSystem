package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.loginDAO;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        //response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("Username");
        String password = request.getParameter("Password");

        // Use the role-based loginDAO method
        loginDAO dao = new loginDAO();
        String role = dao.validateUser(username, password); // returns ADMIN, RECEPTIONIST, MANAGER, or null

        if (role != null) {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            session.setAttribute("role", role);

            // Redirect based on role
            switch (role) {
                case "ADMIN":
                    response.sendRedirect("adminDashboard.jsp");
                    break;
                case "RECEPTIONIST":
                    response.sendRedirect("receptionDashboard.jsp");
                    break;
                case "MANAGER":
                    response.sendRedirect("managerDashboard.jsp");
                    break;
                default:
                    // just in case
                    response.getWriter().println("Role not recognized");
            }
        } else {
            // Login failed
            response.getWriter().println("Incorrect username or password");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Login servlet with role-based redirection";
    }
}