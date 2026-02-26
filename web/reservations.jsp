<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ocean View Resort - Make Reservation</title>
</head>
<body>
    <h1>Ocean View Resort</h1>
    <h2>Make a Reservation</h2>

 <form method="post" action="reserveServlet">
    Room Number: <input type="number" name="room_no" required><br><br>
    Guest Name: <input type="text" name="guest_name" required><br><br>
    Address: <input type="text" name="address" required><br><br>
    Contact Number: <input type="text" name="contact_number" required><br><br>
    Check-in Date: <input type="date" name="checkin" required><br><br>
    Check-out Date: <input type="date" name="checkout" required><br><br>
    <input type="submit" value="Reserve">
</form>
    <button type="button" onclick="goBack()">Back</button>

<script>
function goBack() {
    history.back();
}
</script>
</body>
</html>