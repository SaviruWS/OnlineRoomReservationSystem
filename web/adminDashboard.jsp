<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    if(role == null || !role.equals("ADMIN")){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Ocean View Resort</title>
    <style>
        /* --- General Page --- */
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: #1a1a2e;  /* luxury dark navy background */
            color: #e0e0e0;
            display: flex;
            flex-direction: column;
        }

        /* --- Header --- */
        header {
            background-color: #162447;
            color: #ffd700; /* luxury gold accent */
            text-align: center;
            padding: 50px 0;
            font-size: 42px;
            font-weight: 700;
            letter-spacing: 2px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.5);
        }

        /* --- Navigation Container --- */
        .nav-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 80px 0;
            gap: 30px; /* space between links */
        }

        /* --- Navigation Links --- */
        .nav-container a {
            display: block;
            width: 380px;
            text-align: center;
            text-decoration: none;
            font-size: 24px;
            padding: 20px 0;
            border-radius: 15px;
            background: linear-gradient(145deg, #1f4068, #1b2a47);
            color: #f1f1f1;
            font-weight: 600;
            transition: all 0.4s ease;
            box-shadow: 0 6px 18px rgba(0,0,0,0.4);
        }

        /* --- Hover Effect --- */
        .nav-container a:hover {
            background: linear-gradient(145deg, #3a506b, #2c3e50);
            transform: translateY(-3px) scale(1.03);
            box-shadow: 0 10px 25px rgba(0,0,0,0.6);
        }

        /* --- Logout Button --- */
        .logout-link {
            background-color: #e43f5a;  /* luxury red */
            color: white !important;
            font-weight: bold;
        }

        .logout-link:hover {
            background-color: #b72a3b;
        }

        /* --- Footer --- */
        footer {
            text-align: center;
            color: #b0b0b0;
            margin-top: auto;
            padding: 40px 0 20px 0;
            font-size: 14px;
        }

    </style>
</head>
<body>

<header>
    Ocean View Resort
</header>

<div class="nav-container">
   
    <a href="manageUsers.jsp">Manage Users</a>
    <a href="resetPassword.jsp">Reset Passwords</a>
    <a href="help.jsp">Help</a>
    <a href="LogoutServlet" class="logout-link">Logout</a>
</div>

<footer>
    &copy; 2026 Ocean View Resort. All Rights Reserved.
</footer>

</body>
</html>