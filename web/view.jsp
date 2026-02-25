<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<String[]> guestList = 
        (ArrayList<String[]>) request.getAttribute("guestList");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Reservations</title>
</head>
<body>

<h2>Reservation Details</h2>

<table border="1">
    <tr>
        <th>Room No</th>
        <th>Name</th>
        <th>Age</th>
        <th>Check-in</th>
        <th>Check-out</th>
    </tr>

<%
    if (guestList != null) {
        for (String[] row : guestList) {
%>
    <tr>
        <td><%= row[0] %></td>
        <td><%= row[1] %></td>
        <td><%= row[2] %></td>
        <td><%= row[3] %></td>
        <td><%= row[4] %></td>
    </tr>
<%
        }
    }
%>

</table>

<br>
<a href="receptionDashboard.jsp">Back</a>

</body>
</html>