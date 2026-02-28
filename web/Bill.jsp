<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Bill - Ocean View Resort</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #1a1a2e;
            color: white;
            margin: 0;
        }

        header {
            background: linear-gradient(90deg,#162447,#1f4068);
            padding: 20px;
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            color: #e43f5a;
        }

        .bill-container {
            width: 50%;
            margin: 50px auto;
            background: #162447;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.4);
        }

        .bill-container p {
            font-size: 16px;
            margin: 10px 0;
        }

        hr {
            border: 1px solid #e43f5a;
            margin: 20px 0;
        }

        .total {
            font-size: 20px;
            font-weight: bold;
            color: #2ecc71;
        }

        button {
            padding: 10px 18px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            margin-top: 15px;
        }

        .print-btn {
            background: #2ecc71;
            color: white;
        }

        .print-btn:hover {
            background: #27ae60;
        }

        .back-btn {
            background: #e43f5a;
            color: white;
        }

        .back-btn:hover {
            background: #ef233c;
        }

        footer {
            text-align: center;
            padding: 20px;
            margin-top: 60px;
            background: #162447;
            color: #e43f5a;
        }
    </style>
</head>
<body>

<header>Hotel Bill</header>

<div class="bill-container">

    <p><strong>Guest Name:</strong> ${guestName}</p>
    <p><strong>Room Number:</strong> ${roomNo}</p>
    <p><strong>Check-in Date:</strong> ${checkin}</p>
    <p><strong>Check-out Date:</strong> ${checkout}</p>
    <p><strong>Number of Nights:</strong> ${nights}</p>
    <p><strong>Room Price (per night):</strong> Rs. ${price}</p>

    <hr>

    <p class="total">Total Amount: Rs. ${total}</p>

    <button class="print-btn" onclick="window.print()">Print Bill</button>
    <button class="back-btn" onclick="history.back()">Back</button>

</div>

<footer>
    &copy; 2026 Ocean View Resort
</footer>

</body>
</html>