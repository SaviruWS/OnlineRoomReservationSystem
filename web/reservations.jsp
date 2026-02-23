

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ocean View</title>
    </head>
    <body>
        <h1>Ocean View Resort</h1>
        
        <h2>
            Reservations
        </h2>
        
        <form method = "post" action="reserveServlet">
            Reservations No: <input type="text" name="rno" placeholder = "Reservation no" required><br><br>
             Name: <input type="text" name="name" required><br><br>
             Age: <input type="text" name="age" required><br><br>
             Check-in date:  <input type="date" name="checkin" required><br><br>
             Check-out date: <input type="date" name="checkout" required><br><br>
             <input type="submit" value="Reserve">
        </form>
    </body>
</html>
