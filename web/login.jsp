<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .error-message {
            color: #ef233c;
            background: #f8d7da;
            border: 1px solid #ef233c;
            padding: 8px 12px;
            border-radius: 5px;
            margin-bottom: 15px;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h1>Ocean View Resort Login</h1>

        <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

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