<%-- 
    Document   : manageUsers
    Created on : Feb 25, 2026, 1:13:01 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="ResetPasswordServlet" method="post">
    Username: <input type="text" name="username" required>
    New Password: <input type="password" name="newpass" required>
    <input type="submit" value="Reset Password">
</form>
    </body>
</html>
