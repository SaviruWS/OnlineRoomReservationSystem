
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
    </head>
    <body>
        <h1>User Login</h1>
        
        <form action="LoginServlet" method="post">
            Username : <input type="text" name="Username" required><br><br>
            
            Password : <input type="password" name="Password" required><br>
            
            <input type="submit" value="Login">
        </form>
    </body>
</html>
