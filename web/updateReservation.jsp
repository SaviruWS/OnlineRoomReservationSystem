<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="dao.DBConnection"%>

<%
    String resIdStr = request.getParameter("res_id");
    if (resIdStr == null || resIdStr.isEmpty()) {
        out.println("Reservation ID is required!");
        return;
    }

    int resId = Integer.parseInt(resIdStr);

    int guestId = 0;
    String guestName = "", address = "", contactNumber = "";
    int roomNo = 0;
    String roomType = "", checkin = "", checkout = "";

    try (Connection con = DBConnection.getConnection()) {
        String sql = "SELECT r.res_id, r.room_no, r.room_type, r.checkin, r.checkout, " +
                     "g.guest_id, g.guest_name, g.address, g.contact_number " +
                     "FROM reservations r " +
                     "JOIN guests g ON r.guest_id = g.guest_id " +
                     "WHERE r.res_id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, resId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            guestId = rs.getInt("guest_id");
            guestName = rs.getString("guest_name");
            address = rs.getString("address");
            contactNumber = rs.getString("contact_number");
            roomNo = rs.getInt("room_no");
            roomType = rs.getString("room_type");
            checkin = rs.getString("checkin");
            checkout = rs.getString("checkout");
        } else {
            out.println("Reservation not found!");
            return;
        }

        rs.close();
        ps.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Reservation</title>
</head>
<body>
    <h2>Update Reservation</h2>

    <form method="post" action="UpdateReservationServlet">
        <input type="hidden" name="res_id" value="<%= resId %>">
        <input type="hidden" name="guest_id" value="<%= guestId %>">

        Guest Name: <input type="text" name="guest_name" value="<%= guestName %>" required><br><br>
        Address: <input type="text" name="address" value="<%= address %>" required><br><br>
        Contact Number: <input type="text" name="contact_number" value="<%= contactNumber %>" required><br><br>
        Room Number: <input type="number" name="room_no" value="<%= roomNo %>" required><br><br>
        Room Type: <input type="text" name="room_type" value="<%= roomType %>" readonly><br><br>
        Check-in Date: <input type="date" name="checkin" value="<%= checkin %>" required><br><br>
        Check-out Date: <input type="date" name="checkout" value="<%= checkout %>" required><br><br>

        <input type="submit" value="Update Reservation">
    </form>

    <button type="button" onclick="history.back()">Back</button>
</body>
</html>