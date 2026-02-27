<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Bill</title>
</head>
<body>

<h2>Hotel Bill</h2>

Guest Name: ${guestName} <br><br>
Room Number: ${roomNo} <br><br>
Check-in Date: ${checkin} <br><br>
Check-out Date: ${checkout} <br><br>
Number of Nights: ${nights} <br><br>
Room Price (per night): Rs.${price} <br><br>

<hr>

<h3>Total Amount: Rs.${total}</h3>

<br>
<button onclick="window.print()">Print Bill</button>

</body>
</html>