

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Dashboard</title>
    </head>
    <body>
    <h2>WELCOME MANAGER</h2>
      <a href="reservations.jsp">Add Reservation</a>
      <a href="ViewServlet">View Reservations</a>
      <a href="LogoutServlet">Logout</a> 
     
    </body>
</html>
