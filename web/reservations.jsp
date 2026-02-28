<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ocean View Resort - Make Reservation</title>

    <style>
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: #1a1a2e;
            color: #e0e0e0;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: #162447;
            color: #ffd700;
            text-align: center;
            padding: 35px 0;
            font-size: 34px;
            font-weight: 700;
            letter-spacing: 2px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.5);
        }

        .container {
            width: 500px;
            margin: 60px auto;
            background: #1f4068;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.6);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #ffd700;
        }

        h3 {
            color: #ffffff;
            border-bottom: 1px solid #2c3e50;
            padding-bottom: 5px;
            margin-top: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 8px;
            border: none;
            outline: none;
            font-size: 14px;
        }

        input[type="date"],
        input[type="number"],
        input[type="text"] {
            background-color: #f5f5f5;
            color: #000;
        }

        .btn {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            border-radius: 10px;
            border: none;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .reserve-btn {
            background-color: #ffd700;
            color: #000;
        }

        .reserve-btn:hover {
            background-color: #e6c200;
            transform: scale(1.03);
        }

        .view-btn {
            display: block;
            text-align: center;
            text-decoration: none;
            background-color: #3a506b;
            color: white;
        }

        .view-btn:hover {
            background-color: #2c3e50;
            transform: scale(1.03);
        }

        .back-btn {
            background-color: #e43f5a;
            color: white;
            margin-top: 15px;
        }

        .back-btn:hover {
            background-color: #b72a3b;
            transform: scale(1.03);
        }

        footer {
            text-align: center;
            color: #b0b0b0;
            margin-top: auto;
            padding: 40px 0 20px 0;
            font-size: 14px;
        }

        .note {
            font-size: 13px;
            margin-top: 10px;
            color: #cccccc;
        }
    </style>
</head>

<body>

<header>
    Ocean View Resort
</header>

<div class="container">

    <h2>Register Guest & Make Reservation</h2>

    <form method="post" action="reserveServlet">

        <h3>Guest Details</h3>

        <label>Guest Name</label>
        <input type="text" name="guest_name" required>

        <label>Address</label>
        <input type="text" name="address" required>

        <label>Contact Number</label>
        <input type="text" name="contact_number" required>


        <h3>Reservation Details</h3>

        <!-- View Available Rooms Button -->
        <a href="viewAvailableRooms.jsp" class="btn view-btn">
            View Available Rooms
        </a>

        <p class="note">
            Please click "View Available Rooms" to check room types and availability before selecting a room number.
        </p>

        <label>Room Number</label>
        <input type="number" name="room_no" required>

        <label>Check-in Date</label>
        <input type="date" name="checkin" required>

        <label>Check-out Date</label>
        <input type="date" name="checkout" required>

        <input type="submit" value="Reserve Room" class="btn reserve-btn">

    </form>

    <button type="button" onclick="history.back()" class="btn back-btn">
        Back
    </button>

</div>

<footer>
    &copy; 2026 Ocean View Resort. All Rights Reserved.
</footer>

</body>
</html>