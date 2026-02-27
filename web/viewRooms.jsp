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
        body {
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #333;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #444;
            color: white;
        }
        .booked {
            background-color: #ffcccc;
        }
        .available {
            background-color: #ccffcc;
        }
        .no-data {
            text-align: center;
            margin-top: 20px;
            color: red;
        }
        .btn {
            padding: 8px 15px;
            background-color: #444;
            color: white;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #222;
        }
        .center {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;">Rooms Table</h2>

<%
    if (roomList != null && !roomList.isEmpty()) {
%>

<table>
    <tr>
        <th>Room No</th>
        <th>Room Type</th>
        <th>Price per Day</th>
        <th>Status</th>
    </tr>

<%
        for (String[] row : roomList) {
            String statusClass = "available";
            if ("Booked".equalsIgnoreCase(row[3])) {
                statusClass = "booked";
            }
%>
    <tr class="<%= statusClass %>">
        <td><%= row[0] %></td>
        <td><%= row[1] %></td>
        <td>$<%= row[2] %></td>
        <td><%= row[3] %></td>
    </tr>
<%
        }
%>
</table>

<%
    } else {
%>
    <div class="no-data">
        No rooms found in the system.
    </div>
<%
    }
%>

<div class="center">
    <button class="btn" onclick="history.back()">Back</button>
</div>

</body>
</html>