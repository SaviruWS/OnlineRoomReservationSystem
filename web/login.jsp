
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        
    </head>
<body>
    <div class="login-box">
      
        <h1 class="box-title">Ocean View Resort</h1>

        <form action="LoginServlet" method="post">
            <label>Username</label>
            <input type="text" name="Username" required>

            <label>Password</label>
            <input type="password" name="Password" required>

            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
