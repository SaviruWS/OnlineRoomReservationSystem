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
                     "FROM reservations r JOIN guests g ON r.guest_id = g.guest_id WHERE r.res_id=?";

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
    <style>
        body {
            font-family: 'Segoe UI';
            background: #1a1a2e;
            margin: 0;
            color: white;
        }

        header {
            background: linear-gradient(90deg,#162447,#1f4068);
            padding: 20px;
            text-align: center;
            font-size: 26px;
            color: #e43f5a;
            font-weight: bold;
        }

        .form-container {
            width: 50%;
            margin: 50px auto;
            background: #162447;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.4);
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0 18px;
            border-radius: 6px;
            border: 1px solid #e43f5a;
            background: #1f4068;
            color: white;
        }

        input[type=submit] {
            background: #e43f5a;
            border: none;
            font-weight: bold;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background: #ef233c;
        }

        .back-btn {
            width: 100%;
            padding: 10px;
            background: #903749;
            border: none;
            border-radius: 6px;
            color: white;
            cursor: pointer;
        }

        .back-btn:hover {
            background: #e43f5a;
        }
    </style>
</head>
<body>

<header>Update Reservation</header>

<div class="form-container">
<form method="post" action="UpdateReservationServlet">
    <input type="hidden" name="res_id" value="<%= resId %>">
    <input type="hidden" name="guest_id" value="<%= guestId %>">

    Guest Name:
    <input type="text" name="guest_name" value="<%= guestName %>" required>

    Address:
    <input type="text" name="address" value="<%= address %>" required>

    Contact Number:
    <input type="text" name="contact_number" value="<%= contactNumber %>" required>

    Room Number:
    <input type="number" name="room_no" value="<%= roomNo %>" required>

    Room Type:
    <input type="text" name="room_type" value="<%= roomType %>" readonly>

    Check-in Date:
    <input type="date" name="checkin" value="<%= checkin %>" required>

    Check-out Date:
    <input type="date" name="checkout" value="<%= checkout %>" required>

    <input type="submit" value="Update Reservation">
</form>

<br>
<button class="back-btn" onclick="history.back()">Back</button>
</div>

</body>
</html>