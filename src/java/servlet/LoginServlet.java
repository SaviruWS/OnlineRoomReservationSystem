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

        String username = request.getParameter("Username");
        String password = request.getParameter("Password");

        loginDAO dao = new loginDAO();
        String role = dao.validateUser(username, password); // returns ADMIN, RECEPTIONIST, MANAGER, or null

        if (role != null) {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            session.setAttribute("role", role);

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
            }
        } else {
            // Login failed → set error message and forward back to login page
            request.setAttribute("errorMessage", "Incorrect username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
}