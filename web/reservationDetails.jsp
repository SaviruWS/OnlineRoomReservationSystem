<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<String[]> reservationList = (ArrayList<String[]>) request.getAttribute("reservationList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Reservations</title>
    <style>
        table { width: 90%; border-collapse: collapse; margin: 20px auto; font-family: 'Segoe UI', sans-serif; }
        th, td { border: 1px solid #555; padding: 8px; text-align: center; }
        th { background-color: #34495e; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        tr:hover { background-color: #dfe6e9; }
        .action-btn { padding: 5px 10px; margin: 2px; cursor: pointer; border: none; border-radius: 4px; }
        .update-btn { background-color: #fdcb6e; color: #2d3436; }
        .delete-btn { background-color: #d63031; color: white; }
    </style>
</head>
<body>
<h2 style="text-align:center;">Reservation Details</h2>

<%
if (reservationList == null || reservationList.isEmpty()) {
%>
<p style="text-align:center; color:red;">No reservation details to display.</p>
<%
} else {
%>
<table>
    <tr>
        <th>Reservation ID</th>
        <th>Room No</th>
        <th>Guest Name</th>
        <th>Address</th>
        <th>Contact Number</th>
        <th>Room Type</th>
        <th>Check-in</th>
        <th>Check-out</th>
        <th>Actions</th>
    </tr>
<%
    for (String[] row : reservationList) {
%>
<tr>
    <td><%= row[0] %></td>
    <td><%= row[1] %></td>
    <td><%= row[2] %></td>
    <td><%= row[3] %></td>
    <td><%= row[4] %></td>
    <td><%= row[5] %></td>
    <td><%= row[6] %></td>
    <td><%= row[7] %></td>
    <td>
        <form style="display:inline;" method="get" action="updateReservation.jsp">
            <input type="hidden" name="res_id" value="<%= row[0] %>">
            <button type="submit" class="action-btn update-btn">Update</button>
        </form>
        <form style="display:inline;" method="post" action="DeleteReservationServlet" onsubmit="return confirm('Are you sure?');">
            <input type="hidden" name="res_id" value="<%= row[0] %>">
            <button type="submit" class="action-btn delete-btn">Delete</button>
        </form>
    </td>
</tr>
<%
    }
%>
</table>
<%
}
%>
<br>
<div style="text-align:center;"><button onclick="history.back()">Back to Dashboard</button></div>
</body>
</html>