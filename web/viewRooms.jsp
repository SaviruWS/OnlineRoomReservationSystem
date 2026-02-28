<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Rooms - Ocean View Resort</title>
    <style>
        body {
            font-family: 'Segoe UI';
            background: #1a1a2e;
            color: white;
            margin: 0;
        }

        header {
            background: linear-gradient(90deg,#162447,#1f4068);
            padding: 20px;
            text-align: center;
            font-size: 28px;
            color: #e43f5a;
            font-weight: bold;
        }

        table {
            width: 80%;
            margin: 40px auto;
            border-collapse: collapse;
            background-color: #162447;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #e43f5a;
        }

        tr:nth-child(even) {
            background-color: #1f4068;
        }

        .available {
            color: #4CAF50;
            font-weight: bold;
        }

        .booked {
            color: #ef233c;
            font-weight: bold;
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

<header>Room Status</header>

<table>
<tr>
    <th>Room Number</th>
    <th>Type</th>
    <th>Price</th>
    <th>Status</th>
</tr>

<%
ArrayList<String[]> rooms = (ArrayList<String[]>) request.getAttribute("roomList");
if(rooms != null){
    for(String[] r : rooms){
%>
<tr>
    <td><%= r[0] %></td>
    <td><%= r[1] %></td>
    <td>$ <%= r[2] %></td>
    <td class="<%= r[3].equalsIgnoreCase("Available") ? "available" : "booked" %>">
        <%= r[3] %>
    </td>
</tr>
<%
    }
}
%>

</table>

<div style="text-align:center;">
    <button onclick="history.back()" style="padding:8px 15px;background:#e43f5a;border:none;border-radius:6px;color:white;">
        Back
    </button>
</div>

<footer>
    &copy; 2026 Ocean View Resort
</footer>

</body>
</html>