<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    if(role == null || !role.equals("MANAGER")){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manager Dashboard - Ocean View Resort</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #1a1a2e;
            color: white;

            /* IMPORTANT */
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background: linear-gradient(90deg,#162447,#1f4068);
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #e43f5a;
        }

        .content {
            flex: 1;   /* This pushes footer down */
            text-align: center;
            margin-top: 80px;
        }

        .dashboard-card {
            background: #162447;
            width: 300px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.4);
            transition: 0.3s;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            background: #1f4068;
        }

        .dashboard-card a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 16px;
            display: block;
        }

        .logout-btn {
            background: #ef233c;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            margin-top: 30px;
        }

        .logout-btn:hover {
            background: #d90429;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: #162447;
            color: #e43f5a;
        }
    </style>
</head>

<body>

<header>
    Manager Dashboard

</header>

<div class="content">


    <div class="dashboard-card">
        <a href="ViewServlet">View Reservations</a>
    </div>

    <div class="dashboard-card">
        <a href="ManagerReportsServlet">View All Reports</a>
    </div>
    
          <div class="dashboard-card">
        <a href="help.jsp">Help</a>
    </div>

    <a href="LogoutServlet" class="logout-btn">Logout</a>
    


<footer>
    &copy; 2026 Ocean View Resort
</footer>

</body>
</html>