<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    if(role == null || !role.equals("RECEPTIONIST")){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Reception Dashboard - Ocean View Resort</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #1a1a2e;
            color: #f8f8f2;
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background: linear-gradient(90deg, #162447, #1f4068);
            padding: 25px 0;
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #e43f5a;
            letter-spacing: 2px;
            position: relative;
        }

        /* Help link top-right */
        a.help-link {
            position: absolute;
            right: 30px;
            top: 50%;
            transform: translateY(-50%);
            background-color: #2980b9;
            padding: 8px 15px;
            border-radius: 8px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        a.help-link:hover {
            background-color: #3498db;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            text-align: center;
            flex: 1;
        }

        /* Dashboard links horizontal line */
        .dashboard-links {
            display: flex;
            justify-content: center;
            gap: 25px;
            margin-bottom: 50px;
        }

        a.dashboard-link {
            display: inline-block;
            padding: 15px 25px;
            background: linear-gradient(45deg, #e43f5a, #903749);
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 10px;
            transition: 0.3s;
        }

        a.dashboard-link:hover {
            transform: scale(1.1);
        }

        /* Reservation search form */
        .res-form {
            background-color: #162447;
            padding: 30px;
            border-radius: 12px;
            display: inline-block;
            box-shadow: 0 6px 20px rgba(0,0,0,0.4);
        }

        .res-form h3 {
            margin-bottom: 20px;
            color: #e43f5a;
        }

        input[type=text], input[type=number] {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #e43f5a;
            width: 180px;
            margin-right: 10px;
            background-color: #1f4068;
            color: #fff;
        }

        input[type=submit] {
            padding: 10px 20px;
            border-radius: 8px;
            border: none;
            font-weight: bold;
            cursor: pointer;
            background: linear-gradient(45deg, #e43f5a, #903749);
            color: white;
            transition: 0.3s;
        }

        input[type=submit]:hover {
            transform: scale(1.05);
        }

        /* Logout fixed bottom */
        footer {
            text-align: center;
            padding: 25px;
            background-color: #162447;
            color: #e43f5a;
        }

        a.logout-bottom {
            display: inline-block;
            margin-top: 10px;
            background-color: #ef233c;
            padding: 12px 25px;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
        }

        a.logout-bottom:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<header>
    Ocean View Resort - Reception Dashboard
    <a href="help.jsp" class="help-link">Help</a>
</header>

<div class="container">
    <h2>Welcome, Receptionist!</h2>

    <!-- Dashboard Links in a single line -->
    <div class="dashboard-links">
        <a href="reservations.jsp" class="dashboard-link">Add Reservation</a>
        <a href="ViewServlet" class="dashboard-link">View Reservations</a>
        <a href="ViewRoomsServlet" class="dashboard-link">View Rooms</a>
    </div>

    <!-- Reservation Search Form -->
    <div class="res-form">
        <h3>Search Reservation</h3>
        <form action="ReservationDetailsServlet" method="get">
            <input type="number" name="res_id" placeholder="Reservation ID">
            <input type="text" name="guest_name" placeholder="Guest Name">
            <input type="submit" value="Search">
        </form>
        <small style="color: #fff;">You can search by Reservation ID or Guest Name</small>
    </div>
</div>

<footer>
    <a href="LogoutServlet" class="logout-bottom">Logout</a>
    <div>&copy; 2026 Ocean View Resort. All Rights Reserved.</div>
</footer>

</body>
</html>