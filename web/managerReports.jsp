<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%
    String role = (String) session.getAttribute("role");
    if(role == null || !role.equals("MANAGER")){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manager Reports - Ocean View Resort</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #1a1a2e;
            margin: 0;
            color: white;
        }

        header {
            background: linear-gradient(90deg,#162447,#1f4068);
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #e43f5a;
        }

        .container {
            display: flex;
            justify-content: space-around;
            align-items: flex-start;
            flex-wrap: wrap;
            margin: 20px;
        }

        table {
            width: 60%;
            border-collapse: collapse;
            background: #162447;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0,0,0,0.4);
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background: #e43f5a;
            color: white;
        }

        tr:nth-child(even) {
            background: #1f4068;
        }

        tr:hover {
            background: #903749;
        }

        .chart-container {
            width: 35%;
            background: #162447;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.4);
            margin-bottom: 20px;
        }

        .back-btn {
            padding: 10px 20px;
            background: #e43f5a;
            border: none;
            border-radius: 8px;
            color: white;
            cursor: pointer;
            margin: 20px auto;
            display: block;
        }

        .back-btn:hover {
            background: #ef233c;
        }

        footer {
            text-align: center;
            padding: 20px;
            margin-top: 60px;
            background: #162447;
            color: #e43f5a;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<header>Manager Reports</header>

<div class="container">

    <!-- Reservation Report Table -->
    <table>
        <tr>
            <th>Room Type</th>
            <th>Total Reservations</th>
            <th>Total Revenue (Rs)</th>
        </tr>
        <%
            ArrayList<String[]> reportList = (ArrayList<String[]>) request.getAttribute("reportList");
            if(reportList != null){
                for(String[] row : reportList){
        %>
        <tr>
            <td><%= row[0] %></td>
            <td><%= row[1] %></td>
            <td><%= row[2] %></td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <!-- Pie Chart -->
    <div class="chart-container">
        <canvas id="revenueChart"></canvas>
    </div>

</div>

<button class="back-btn" onclick="history.back()">Back to Dashboard</button>

<footer>
    &copy; 2026 Ocean View Resort
</footer>

<script>
const ctx = document.getElementById('revenueChart').getContext('2d');
const revenueChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: [
            <% 
            ArrayList<String> roomTypes = (ArrayList<String>) request.getAttribute("roomTypes");
            for (int i = 0; i < roomTypes.size(); i++) { 
            %>
                '<%= roomTypes.get(i) %>'<%= (i < roomTypes.size() - 1) ? "," : "" %>
            <% } %>
        ],
        datasets: [{
            label: 'Revenue per Room Type',
            data: [
                <% 
                ArrayList<Double> revenues = (ArrayList<Double>) request.getAttribute("revenues");
                for (int i = 0; i < revenues.size(); i++) { 
                %>
                    <%= revenues.get(i) %><%= (i < revenues.size() - 1) ? "," : "" %>
                <% } %>
            ],
            backgroundColor: [
                '#e43f5a', '#162447', '#f4a261', '#90e0ef', '#00b894', '#ef233c'
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { position: 'bottom' },
            title: { display: true, text: 'Revenue Distribution by Room Type' }
        }
    }
});
</script>

</body>
</html>