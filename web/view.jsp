<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Reservations - Ocean View Resort</title>
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
            width: 90%;
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

        tr:hover {
            background-color: #903749;
        }

        button {
            padding: 8px 15px;
            border-radius: 6px;
            border: none;
            background: #e43f5a;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background: #ef233c;
        }

        footer {
            text-align: center;
            padding: 20px;
            margin-top: 60px;
            background: #162447;
            color: #e43f5a;
        }

        /* ===== Popup Style ===== */

        .popup {
            position: fixed;
            top: 20px;
            right: -400px;
            padding: 15px 25px;
            border-radius: 8px;
            color: white;
            font-weight: bold;
            box-shadow: 0 4px 12px rgba(0,0,0,0.4);
            transition: right 0.5s ease;
            z-index: 9999;
        }

        .popup.show {
            right: 20px;
        }

        .success {
            background: #2ecc71;
        }

        .error {
            background: #e74c3c;
        }
    </style>
</head>
<body>

<header>All Reservations</header>

<table>
<tr>
    <th>ID</th>
    <th>Room No</th>
    <th>Guest Name</th>
    <th>Address</th>
    <th>Contact</th>
    <th>Room Type</th>
    <th>Check-in</th>
    <th>Check-out</th>
</tr>


<%
ArrayList<String[]> list = (ArrayList<String[]>) request.getAttribute("reservationList");
if(list != null){
    for(String[] row : list){
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
</tr>
<%
    }
}
%>

</table>

<div style="text-align:center;">
    <button onclick="history.back()">Back</button>
</div>



<!-- ===== POPUP MESSAGE SYSTEM ===== -->

<%
String successMessage = (String) session.getAttribute("successMessage");
String errorMessage = (String) session.getAttribute("errorMessage");

if(successMessage != null){
    session.removeAttribute("successMessage");
}
if(errorMessage != null){
    session.removeAttribute("errorMessage");
}
%>

<% if(successMessage != null){ %>
<div id="successPopup" class="popup success">
    <%= successMessage %>
</div>
<script>
    var popup = document.getElementById("successPopup");
    popup.classList.add("show");

    setTimeout(function(){
        popup.classList.remove("show");
    }, 3000);
</script>
<% } %>

<% if(errorMessage != null){ %>
<div id="errorPopup" class="popup error">
    <%= errorMessage %>
</div>
<script>
    var popup = document.getElementById("errorPopup");
    popup.classList.add("show");

    setTimeout(function(){
        popup.classList.remove("show");
    }, 3000);
</script>
<% } %>
<footer>
    &copy; 2026 Ocean View Resort
</footer>
</body>
</html>