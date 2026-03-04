<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Available Rooms</title>

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
            margin-bottom: 40px;
            padding: 12px 25px;
            border: none;
            border-radius: 30px;
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .back-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255,75,43,0.6);
        }
    </style>
</head>
<body>

<h2>Available Rooms</h2>

<table>
    <tr>
        <th>Room No</th>
        <th>Room Type</th>
        <th>Price (Rs)</th>
        <th>Status</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/reservation",
            "root",
            ""
        );

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM rooms WHERE status='Available'");

        while(rs.next()){
%>

    <tr>
        <td><%= rs.getString("room_no") %></td>
        <td><%= rs.getString("room_type") %></td>
        <td><%= rs.getDouble("price") %></td>
        <td><%= rs.getString("status") %></td>
    </tr>

<%
        }

        con.close();
    } catch(Exception e){
%>

<tr>
    <td colspan="4">Error loading rooms</td>
</tr>

<%
    }
%>

</table>

<button class="back-btn" onclick="history.back()">Back</button>

</body>
</html>