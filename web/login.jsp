<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="login-box">
        <h1>Ocean View Resort Login</h1>

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