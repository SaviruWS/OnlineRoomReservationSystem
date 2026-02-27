<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Help - Ocean View Resort System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f6f9;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }

        .section {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
        }

        h3 {
            color: #2980b9;
        }

        ul {
            margin-top: 10px;
        }

        li {
            margin-bottom: 8px;
        }

        .back-btn {
            padding: 8px 15px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .back-btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<h1>Ocean View Resort - System Help Guide</h1>

<div class="section">
    <h3>1. Login to the System</h3>
    <ul>
        <li>Enter your assigned username and password.</li>
        <li>If login fails, check credentials carefully.</li>
        <li>Only authorized staff members can access the system.</li>
    </ul>
</div>

<div class="section">
    <h3>2. Add New Reservation</h3>
    <ul>
        <li>Click on "Add Reservation" from the dashboard.</li>
        <li>Fill in guest details including name, address and contact number.</li>
        <li>Before entering a new reservation, please click “View Rooms” to check the available rooms and their types.
Then, select a Room Number that matches the desired Room Type for the guest.</li>
        <li>Enter check-in and check-out dates.</li>
        <li>Click submit to save the reservation.</li>
        <li>The system automatically generates a unique reservation number.</li>
    </ul>
</div>

<div class="section">
    <h3>3. View and Manage Reservations</h3>
    <ul>
        <li>Click "View Reservations" to see all bookings.</li>
        <li>Use the Update button to modify reservation details.</li>
        <li>Use the Delete button to remove a reservation.</li>
        <li>The system prevents booking conflicts and invalid entries.</li>
    </ul>
</div>

<div class="section">
    <h3>4. Calculate and Print Bill</h3>
    <ul>
        <li>Click the "Bill" button next to a reservation.</li>
        <li>The system calculates total stay cost based on number of nights.</li>
        <li>Room rate is multiplied by total nights.</li>
        <li>Click "Print" to generate a hard copy for the guest.</li>
    </ul>
</div>

<div class="section">
    <h3>5. Logout / Exit System</h3>
    <ul>
        <li>Click the Logout button to safely exit the system.</li>
        <li>This ensures secure session termination.</li>
        <li>Always logout after completing your work.</li>
    </ul>
</div>

<div class="section">
    <h3>System Notes & Guidelines</h3>
    <ul>
        <li>All required fields must be filled before submission.</li>
        <li>Dates must be valid and check-out date must be after check-in date.</li>
        <li>Reservation numbers are unique and auto-generated.</li>
        <li>Only authorized staff should access this system.</li>
    </ul>
</div>

<br>
<button class="back-btn" onclick="history.back()">Back to Dashboard</button>

</body>
</html>