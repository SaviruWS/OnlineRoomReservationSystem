<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Bill</title>
    <style>
/* General page styling */
body {
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f8f9fa;
    color: #023e8a;
    margin: 20px;
}

/* Headings */
h1, h2 {
    color: #0077b6;
    text-align: center;
}

/* Tables */
table {
    width: 90%;
    border-collapse: collapse;
    margin: 20px auto;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

th, td {
    padding: 10px;
    text-align: center;
    border: 1px solid #0077b6;
}

th {
    background-color: #0077b6;
    color: white;
}

tr:nth-child(even) {
    background-color: #e0f7fa;
}

tr.booked {
    background-color: #ef233c; /* red for booked */
    color: white;
}

tr.available {
    background-color: #00b894; /* green for available */
    color: white;
}

/* Buttons */
button, input[type="submit"] {
    padding: 8px 15px;
    margin: 3px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

button.primary, input.primary {
    background-color: #0077b6;
    color: white;
}

button.secondary, input.secondary {
    background-color: #90e0ef;
    color: #023e8a;
}

button.delete {
    background-color: #ef233c;
    color: white;
}

button.update {
    background-color: #ffb703;
    color: #023e8a;
}

/* Form styling */
form {
    background-color: #90e0ef;
    padding: 20px;
    border-radius: 8px;
    width: 50%;
    margin: 20px auto;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

input[type="text"], input[type="number"], input[type="date"] {
    width: 90%;
    padding: 8px;
    margin: 5px 0 15px 0;
    border-radius: 5px;
    border: 1px solid #0077b6;
}
</style>
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