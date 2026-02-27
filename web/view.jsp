<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<String[]> reservationList =
        (ArrayList<String[]>) request.getAttribute("reservationList");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Reservations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            border-collapse: collapse;
            width: 95%;
            margin: auto;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        .action-btn {
            padding: 5px 10px;
            margin: 2px;
            cursor: pointer;
            border: none;
            border-radius: 4px;
        }

        .update-btn {
            background-color: #4CAF50;
            color: white;
        }

        .delete-btn {
            background-color: #f44336;
            color: white;
        }

        .bill-btn {
            background-color: #2196F3;
            color: white;
        }

        h2 {
            text-align: center;
        }

        .back-btn {
            margin-left: 40px;
            padding: 6px 12px;
        }
    </style>
</head>
<body>

<h2>Reservation Details</h2>

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
    if (reservationList != null && !reservationList.isEmpty()) {
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
                <button type="submit" class="action-btn update-btn">
                    Update
                </button>
            </form>

            <!-- Delete -->
            <form style="display:inline;" method="post"
                  action="DeleteReservationServlet"
                  onsubmit="return confirm('Are you sure you want to delete this reservation?');">
                <input type="hidden" name="res_id" value="<%= row[0] %>">
                <button type="submit" class="action-btn delete-btn">
                    Delete
                </button>
            </form>

            <!-- Calculate Bill -->
            <form style="display:inline;" method="get" action="BillServlet">
                <input type="hidden" name="res_id" value="<%= row[0] %>">
                <button type="submit" class="action-btn bill-btn">
                    Bill
                </button>
            </form>

        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="9">No Reservations Found</td>
    </tr>
<%
    }
%>

</table>

<br><br>

<button class="back-btn" onclick="history.back()">Back</button>

</body>
</html>