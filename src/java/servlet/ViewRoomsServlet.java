package servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewRoomsServlet")
public class ViewRoomsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                        HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<String[]> roomList = new ArrayList<>();

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/reservation",
                    "root",
                    ""
            );

            // SQL Query
            String query = "SELECT * FROM rooms";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            // Store data into list
            while (rs.next()) {
                String[] room = new String[4];
                room[0] = rs.getString("room_no");
                room[1] = rs.getString("room_type");
                room[2] = String.valueOf(rs.getDouble("price"));
                room[3] = rs.getString("status");

                roomList.add(room);
            }

           
            request.setAttribute("roomList", roomList);

        
            request.getRequestDispatcher("viewRooms.jsp").forward(request, response);

            con.close();

        } catch (Exception e) {
            e.printStackTrace(); // shows real error in console

         
            request.setAttribute("errorMessage", "Error loading rooms");
            request.getRequestDispatcher("viewRooms.jsp").forward(request, response);
        }
    }
}