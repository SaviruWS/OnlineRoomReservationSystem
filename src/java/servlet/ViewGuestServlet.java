package servlet;

import dao.DBConnection;
import model.Guest;

import java.io.IOException;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/viewGuests")
public class ViewGuestServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Guest> guestList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            CallableStatement cs = con.prepareCall("{CALL GetAllGuests()}");
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                Guest guest = new Guest(
                        rs.getInt("guest_id"),
                        rs.getString("guest_name"),
                        rs.getString("address"),
                        rs.getString("contact_number"),
                        rs.getString("email")
                );
                guestList.add(guest);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("guestList", guestList);
        request.getRequestDispatcher("viewGuests.jsp").forward(request, response);
    }
}