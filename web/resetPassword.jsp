<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    if (role == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password - Ocean View Resort</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #1a1a2e;
            color: #f8f8f2;
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(90deg, #162447, #1f4068);
            padding: 25px 0;
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #e43f5a;
            letter-spacing: 2px;
        }

        .container {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 80px;
        }

        form {
            background-color: #162447;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.4);
            width: 400px;
        }

        input[type=text],
        input[type=password] {
            width: 100%;
            padding: 12px;
            margin: 15px 0;
            border-radius: 8px;
            border: 1px solid #e43f5a;
            background-color: #1f4068;
            color: #fff;
        }

        input[type=submit] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            background: linear-gradient(45deg, #e43f5a, #903749);
            color: white;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type=submit]:hover {
            transform: scale(1.05);
        }

        .back-btn {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #00b894;
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .back-btn:hover {
            background-color: #019875;
        }

        footer {
            text-align: center;
            padding: 25px;
            margin-top: 100px;
            background-color: #162447;
            color: #e43f5a;
        }
    </style>
</head>
<body>

<header>Ocean View Resort - Reset Password</header>

<div class="container">
    <form action="ResetPasswordServlet" method="post">
        <label>Username</label>
        <input type="text" name="username" required>

        <label>New Password</label>
        <input type="password" name="newpass" required>

        <input type="submit" value="Reset Password">

        <button type="button" class="back-btn" onclick="history.back()">Back</button>
    </form>
</div>

<footer>
    &copy; 2026 Ocean View Resort. All Rights Reserved.
</footer>

</body>
</html>