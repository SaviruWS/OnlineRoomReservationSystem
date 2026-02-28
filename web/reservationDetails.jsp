<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<String[]> reservationList = (ArrayList<String[]>) request.getAttribute("reservationList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Reservations - Ocean View Resort</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #1a1a2e;
            margin: 0;
            color: white;
        }

        header {
            background: linear-gradient(90deg,#162447,#1f4068);
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #e43f5a;
        }

        table {
            width: 95%;
            margin: 40px auto;
            border-collapse: collapse;
            background: #162447;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0,0,0,0.4);
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background: #e43f5a;
            color: white;
        }

        tr:nth-child(even) {
            background: #1f4068;
        }

        tr:hover {
            background: #903749;
        }

        .action-btn {
            padding: 6px 12px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }

        .update-btn {
            background: #f4a261;
            color: black;
        }

        .update-btn:hover {
            background: #e9c46a;
        }

        .delete-btn {
            background: #ef233c;
            color: white;
        }

        .delete-btn:hover {
            background: #d90429;
        }

        .back-btn {
            padding: 10px 20px;
            background: #e43f5a;
            border: none;
            border-radius: 8px;
            color: white;
            cursor: pointer;
        }

        .back-btn:hover {
            background: #ef233c;
        }

        footer {
            text-align: center;
            padding: 20px;
            margin-top: 60px;
            background: #162447;
            color: #e43f5a;
        }
    </style>
</head>
<body>

<header>Reservation Details</header>

<%
if (reservationList == null || reservationList.isEmpty()) {
%>
<p style="text-align:center; color:#ef233c; font-weight:bold;">No reservation details to display.</p>
<%
} else {
%>

<table>
<tr>
    <th>ID</th>
    <th>Room</th>
    <th>Guest</th>
    <th>Address</th>
    <th>Contact</th>
    <th>Type</th>
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

    <!-- Update -->
    <form style="display:inline;" method="get" action="updateReservation.jsp">
        <input type="hidden" name="res_id" value="<%= row[0] %>">
        <button type="submit" class="action-btn update-btn">Update</button>
    </form>

    <!-- Delete -->
    <form style="display:inline;" method="post" action="DeleteReservationServlet"
          onsubmit="return confirm('Are you sure you want to delete this reservation?');">
        <input type="hidden" name="res_id" value="<%= row[0] %>">
        <button type="submit" class="action-btn delete-btn">Delete</button>
    </form>

    <!-- Calculate Bill -->
    <form style="display:inline;" method="get" action="BillServlet">
        <input type="hidden" name="res_id" value="<%= row[0] %>">
        <button type="submit" class="action-btn" 
                style="background:#2ecc71;color:white;">Calculate Bill</button>
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

<div style="text-align:center;">
    <button class="back-btn" onclick="history.back()">Back to Dashboard</button>
</div>


<footer>
    &copy; 2026 Ocean View Resort
</footer>
</body>

</html>