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
</head>
<body>

<h2>Reservation Details</h2>

<table border="1">
    <tr>
        <th>Reservation ID</th>
        <th>Room No</th>
        <th>Guest Name</th>
        <th>Address</th>
        <th>Contact Number</th>
        <th>Room Type</th>
        <th>Check-in</th>
        <th>Check-out</th>
    </tr>

<%
    if (reservationList != null) {
        for (String[] row : reservationList) {
%>
    <tr>
        <td><%= row[0] %></td>   <!-- res_id -->
        <td><%= row[1] %></td>   <!-- room_no -->
        <td><%= row[2] %></td>   <!-- guest_name -->
        <td><%= row[3] %></td>   <!-- address -->
        <td><%= row[4] %></td>   <!-- contact_number -->
        <td><%= row[5] %></td>   <!-- room_type -->
        <td><%= row[6] %></td>   <!-- checkin -->
        <td><%= row[7] %></td>   <!-- checkout -->
    </tr>
<%
        }
    }
%>

</table>

<br>
<button type="button" onclick="goBack()">Back</button>

<script>
    function goBack() {
        history.back();
    }
</script>

</body>
</html>