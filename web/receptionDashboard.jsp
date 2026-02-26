

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
        <title>Reception Dashboard</title>
    </head>
    <body>
        <h2>Hello Welcome to Reception</h2>
         <a href="reservations.jsp">Add Reservation</a>
         <a href="ViewServlet">View Reservations</a>
          <a href="LogoutServlet">Logout</a> 
          <a href="ViewRoomsServlet">View Rooms</a> 
          <button type="button" onclick="goBack()">Back</button>


    </body>
</html>
