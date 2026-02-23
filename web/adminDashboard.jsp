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
    <title>Admin Dashboard</title>
</head>
<body>
    <h1>Welcome, Admin!</h1>
    <ul>
        <li><a href="reservations.jsp">Add New Reservation</a></li>
        <li><a href="manageUsers.jsp">Manage Users</a></li>
        <li><a href="resetPassword.jsp">Reset Passwords</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</body>
</html>