<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%
    String[] reservationDetails = (String[]) request.getAttribute("reservationDetails");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reservation Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 60%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            width: 200px;
        }
    </style>
</head>
<body>

<h2>Reservation Details</h2>

<%
    if (reservationDetails != null) {
%>
<table>
    <tr><th>Reservation ID</th><td><%= reservationDetails[0] %></td></tr>
    <tr><th>Room No</th><td><%= reservationDetails[1] %></td></tr>
    <tr><th>Guest Name</th><td><%= reservationDetails[2] %></td></tr>
    <tr><th>Address</th><td><%= reservationDetails[3] %></td></tr>
    <tr><th>Contact Number</th><td><%= reservationDetails[4] %></td></tr>
    <tr><th>Room Type</th><td><%= reservationDetails[5] %></td></tr>
    <tr><th>Check-in Date</th><td><%= reservationDetails[6] %></td></tr>
    <tr><th>Check-out Date</th><td><%= reservationDetails[7] %></td></tr>
</table>
<%
    } else {
%>
<p>No reservation details to display.</p>
<%
    }
%>

<br>
<button type="button" onclick="history.back()">Back</button>

</body>
</html>