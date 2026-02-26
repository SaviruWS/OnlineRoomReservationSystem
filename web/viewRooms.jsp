<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<String[]> roomList = 
        (ArrayList<String[]>) request.getAttribute("roomList");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Rooms</title>
    <style>
        table {
            border-collapse: collapse;
            width: 70%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .booked {
            background-color: #ffcccc; /* light red for booked rooms */
        }
        .available {
            background-color: #ccffcc; /* light green for available rooms */
        }
    </style>
</head>
<body>

<h2>Rooms Table</h2>

<table>
    <tr>
        <th>Room No</th>
        <th>Room Type</th>
        <th>Price per Day</th>
        <th>Status</th>
    </tr>

<%
    if (roomList != null) {
        for (String[] row : roomList) {
            String statusClass = "available";
            if ("Booked".equalsIgnoreCase(row[3])) {
                statusClass = "booked";
            }
%>
    <tr class="<%= statusClass %>">
        <td><%= row[0] %></td>
        <td><%= row[1] %></td>
        <td><%= row[2] %></td>
        <td><%= row[3] %></td>
    </tr>
<%
        }
    }
%>

</table>

<br>
<button type="button" onclick="history.back()">Back</button>

</body>
</html>