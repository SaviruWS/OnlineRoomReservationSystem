<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Guest"%>

<!DOCTYPE html>
<html>
<head>
    <title>Guest Details</title>
    <style>
        body {
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            font-family: 'Segoe UI', sans-serif;
            color: white;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        h2 {
            margin-top: 40px;
            font-size: 30px;
            letter-spacing: 1px;
        }

        table {
            margin: 40px auto;
            border-collapse: collapse;
            width: 70%;
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background: rgba(0,0,0,0.6);
            font-size: 18px;
        }

        tr:nth-child(even) {
            background: rgba(255,255,255,0.05);
        }

        tr:hover {
            background: rgba(255,255,255,0.15);
        }

        .back-btn {
            margin: 30px auto 0 auto;
            padding: 12px 25px;
            border: none;
            border-radius: 30px;
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
            display: inline-block;
            text-decoration: none;
        }

        .back-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255,75,43,0.6);
        }
    </style>
</head>
<body>

<a href="receptionDashboard.jsp" class="back-btn">← Back</a>

<h2>Guest Details</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Contact</th>
        <th>Email</th>
    </tr>

    <%
        ArrayList<Guest> guestList =
                (ArrayList<Guest>) request.getAttribute("guestList");

        if (guestList != null) {
            for (Guest g : guestList) {
    %>

    <tr>
        <td><%= g.getGuest_id() %></td>
        <td><%= g.getGuest_name() %></td>
        <td><%= g.getAddress() %></td>
        <td><%= g.getContact_number() %></td>
        <td><%= g.getEmail() %></td>
    </tr>

    <%
            }
        }
    %>

</table>

</body>
</html>