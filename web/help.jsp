<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    if(role == null){
        response.sendRedirect("login.jsp"); // restrict access if not logged in
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Help - Ocean View Resort</title>
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
            width: 85%;
            margin: 50px auto;
        }

        .section {
            background-color: #162447;
            padding: 25px;
            margin-bottom: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.4);
        }

        h3 {
            color: #e43f5a;
            margin-bottom: 15px;
        }

        ul {
            padding-left: 20px;
        }

        li {
            margin-bottom: 10px;
        }

        .back-btn {
            display: block;
            width: 250px;
            margin: 40px auto;
            padding: 12px;
            background: linear-gradient(45deg, #e43f5a, #903749);
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
        }

        .back-btn:hover {
            transform: scale(1.05);
        }

        footer {
            text-align: center;
            padding: 25px;
            background-color: #162447;
            color: #e43f5a;
        }
    </style>
</head>
<body>

<header>Ocean View Resort - System Help Guide</header>

<div class="container">

    <%-- Common Help for All Roles --%>
    <div class="section">
        <h3>1. Login to the System</h3>
        <ul>
            <li>Enter your assigned username and password.</li>
            <li>If login fails, verify credentials carefully.</li>
            <li>Only authorized staff can access the system.</li>
        </ul>
    </div>

    <% if(role.equals("RECEPTIONIST") || role.equals("ADMIN")) { %>
    <div class="section">
     
        
        
       <div class="section"> 
           <h3>2. Add New Reservation</h3> 
           <ul> <li>Click "Add Reservation" from the dashboard.</li>
               <li>Fill in guest details including name, address and contact number.</li>
               <li>Click "View Rooms" before selecting a room number.</li>
               <li>Select a room that matches the required room type.</li>
               <li>Enter valid check-in and check-out dates.</li> 
               <li>Click submit to save the reservation.</li>
               <li>Click submit to save the reservation.</li>
    </div>
        
        <div class="section"> 
        <h3>3. View and Manage Reservations</h3>
        <ul> <li>Update reservations when necessary.</li>
        <li>Delete incorrect bookings carefully.</li>
        <li>The system prevents booking conflicts.</li> 
        </ul> </div>
        <div class="section">
        <h3>3. Search Reservations and guest records</h3> 
       <ul> <li>Search a reservation by reservation id or guest name</li>
       <li>Update reservations when necessary.</li>
       <li>Delete incorrect bookings carefully.</li>
       </ul> </div>
       <div class="section">
       <h3>4. Calculate and Print Bill</h3>
       <ul> <li>Click the "Bill" button next to a reservation.</li>
       <li>Total cost is calculated using number of nights × room rate.</li>
       <li>Print the bill for the guest if required.</li> 
       </ul> </div>
    <% } %>

    <% if(role.equals("MANAGER") || role.equals("ADMIN")) { %>
    <div class="section">
        <h3>3. Manager Help</h3>
        <ul>
            <li>View reservation reports and total revenue.</li>
            <li>View all reservations.</li>
          
        </ul>
    </div>
    <% } %>

    <button class="back-btn" onclick="history.back()">Back to Dashboard</button>

</div>

<footer>
    &copy; 2026 Ocean View Resort. All Rights Reserved.
</footer>

</body>
</html>