import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/viewRooms")
public class ViewRoomsServlet extends HttpServlet {

    protected void doGet(javax.servlet.http.HttpServletRequest request,
                         javax.servlet.http.HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/reservation",
                "root",
                ""
            );

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM rooms WHERE status='Available'");

            out.println("<h2 style='color:white;'>Available Rooms</h2>");

            while (rs.next()) {
                out.println("<div style='background:#1c1c1c;padding:15px;margin:10px;border-radius:10px;'>");
                out.println("<p>Room Number: " + rs.getString("room_number") + "</p>");
                out.println("<p>Type: " + rs.getString("type") + "</p>");
                out.println("<p>Price: " + rs.getDouble("price") + "</p>");
                out.println("</div>");
            }

            con.close();

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error loading rooms</p>");
            e.printStackTrace();
        }
    }
}