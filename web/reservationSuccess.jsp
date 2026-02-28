<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Successful - Ocean View Resort</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background: #1a1a2e;
            color: #ffd700;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        .card {
            background: #162447;
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0,0,0,0.6);
        }

        h1 {
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        .btn {
            padding: 12px 25px;
            border-radius: 10px;
            border: none;
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn.dashboard {
            background-color: #ffd700;
            color: #000;
        }

        .btn.dashboard:hover {
            background-color: #e6c200;
            transform: scale(1.05);
        }

        .btn.new {
            background-color: #3a506b;
            color: white;
        }

        .btn.new:hover {
            background-color: #2c3e50;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<div class="card">
    <h1>Reservation Successful!</h1>
    <p>Reservation Number: <strong>${res_id}</strong></p>
    <p>Guest Name: <strong>${guest_name}</strong></p>
    <p>Room Number: <strong>${room_no}</strong> (${room_type})</p>
    <p>Check-in: <strong>${checkin}</strong> | Check-out: <strong>${checkout}</strong></p>

    <button class="btn dashboard" onclick="window.location.href='receptionDashboard.jsp'">Go to Dashboard</button>
    <button class="btn new" onclick="window.location.href='reservations.jsp'">Add Another Reservation</button>
</div>

</body>
</html>