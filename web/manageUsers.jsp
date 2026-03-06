<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="dao.DBConnection"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("ADMIN")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Users - Ocean View Resort</title>
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
            width: 90%;
            max-width: 1200px;
            margin: 30px auto;
        }

       
        h2, h3 {
            text-align: center;
            color: #e43f5a;
            margin-bottom: 20px;
        }

      
        form {
            background-color: #162447;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            width: 50%;
            margin: 0 auto 30px auto;
        }

        input[type=text], input[type=password], select {
            width: 95%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 8px;
            border: 1px solid #e43f5a;
            background-color: #1f4068;
            color: #fff;
        }

        input[type=submit] {
            padding: 10px 20px;
            margin-top: 10px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            background: linear-gradient(45deg, #e43f5a, #903749);
            color: #fff;
            transition: all 0.3s ease;
        }

        input[type=submit]:hover {
            transform: scale(1.05);
        }

      
        table {
            border-collapse: collapse;
            width: 100%;
            background-color: #1f4068;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #e43f5a;
        }

        th {
            background-color: #e43f5a;
            color: #fff;
        }

        tr:hover {
            background-color: #903749;
        }

      
        .table-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .reset-btn {
            background-color: #fcbf49;
            color: #1a1a2e;
        }
        .reset-btn:hover {
            background-color: #ffb703;
        }

        .delete-btn {
            background-color: #ef233c;
            color: #fff;
        }
        .delete-btn:hover {
            background-color: #d90429;
        }

        /* Back button */
        .back-btn {
            background-color: #00b894;
            color: #fff;
            padding: 10px 20px;
            margin: 20px auto;
            display: block;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }
        .back-btn:hover {
            background-color: #019875;
        }

          footer {
          text-align: center;
          padding: 20px;
          background-color: #162447;
          color: #e43f5a;
          margin-top: 40px;
}

.popup {
    display: none;
    position: fixed;
    top: 30px;
    right: 30px;
    padding: 15px 25px;
    border-radius: 10px;
    color: white;
    font-weight: bold;
    box-shadow: 0 5px 15px rgba(0,0,0,0.4);
    z-index: 9999;
    transition: opacity 0.5s ease;
}

.success {
    background: linear-gradient(45deg, #00b894, #019875);
}

.error {
    background: linear-gradient(45deg, #ef233c, #d90429);
}


    </style>
</head>
<body>
    <%
    String message = (String) session.getAttribute("msg");
    String msgType = (String) session.getAttribute("msgType");

    if (message != null) {
%>

<div id="popup" class="popup <%= msgType %>">
    <%= message %>
</div>

<script>
    const popup = document.getElementById("popup");
    popup.style.display = "block";

    setTimeout(function () {
        popup.style.opacity = "0";
        setTimeout(() => popup.style.display = "none", 500);
    }, 3000);
</script>

<%
        session.removeAttribute("msg");
        session.removeAttribute("msgType");
    }
%>

<header>Ocean View Resort - Manage Users</header>

<div class="container">

   
    <h3>Add New User</h3>
    <form action="AddUserServlet" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        Role: 
        <select name="role" required>
            <option value="ADMIN">ADMIN</option>
            <option value="RECEPTIONIST">RECEPTIONIST</option>
            <option value="MANAGER">MANAGER</option>
        </select><br>
        <input type="submit" value="Add User">
    </form>

    <hr style="border:1px solid #e43f5a; margin: 40px 0;">

    
    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Role</th>
            <th>Reset Password</th>
            <th>Delete User</th>
        </tr>
        <%
            try (Connection c = DBConnection.getConnection();
                 PreparedStatement ps = c.prepareStatement("SELECT id, username, role FROM users");
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String username = rs.getString("username");
                    String userRole = rs.getString("role");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= username %></td>
            <td><%= userRole %></td>
            <td>
                <form action="ResetPasswordServlet" method="post">
                    <input type="hidden" name="username" value="<%= username %>">
                    <input type="password" name="newpass" placeholder="New Password" required>
                    <input type="submit" class="table-btn reset-btn" value="Reset">
                </form>
            </td>
            <td>
                <form action="DeleteUserServlet" method="post" onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" name="username" value="<%= username %>">
                    <input type="submit" class="table-btn delete-btn" value="Delete">
                </form>
            </td>
            
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error loading users!</td></tr>");
                e.printStackTrace();
            }
        %>
          
    </table>
            </table>

   
    <button class="back-btn" onclick="window.location.href='adminDashboard.jsp'">
        Back to Dashboard
    </button>


</div>

<footer>
    
    &copy; 2026 Ocean View Resort. All Rights Reserved.     
    
</footer>

</body>
</html>