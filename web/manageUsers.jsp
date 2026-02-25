<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="dao.DBConnection"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users - Ocean View Resort</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #333; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        input[type=text], input[type=password], select { padding: 5px; width: 90%; }
        input[type=submit] { padding: 5px 10px; margin-top: 5px; }
        h2 { text-align: center; }
        form { margin: 0; }
    </style>
</head>
<body>

<%
    // Only admin can access
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("ADMIN")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<h2>Manage Users</h2>

<!-- Add New User Form -->
<div style="width: 50%; margin: auto;">
    <h3>Add New User</h3>
    <form action="AddUserServlet" method="post">
        Username: <input type="text" name="username" required>
        Password: <input type="password" name="password" required>
        Role: 
        <select name="role" required>
            <option value="ADMIN">ADMIN</option>
            <option value="RECEPTIONIST">RECEPTIONIST</option>
            <option value="MANAGER">MANAGER</option>
        </select>
        <input type="submit" value="Add User">
    </form>
</div>

<hr style="width: 80%; margin: 30px auto;">

<!-- Users Table -->
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
                <input type="submit" value="Reset">
            </form>
        </td>
        <td>
            <form action="DeleteUserServlet" method="post" onsubmit="return confirm('Are you sure?');">
                <input type="hidden" name="username" value="<%= username %>">
                <input type="submit" value="Delete">
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

</body>
</html>