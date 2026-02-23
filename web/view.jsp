

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="ViewServlet">
            <input type="text" name="filter" placeholder="Search by name">
            <button type="submit">Filter</button>
            
        </form>
        
        <table>
            <tr>
                <th>Reservation No.</th>
                 <th>Name</th>
                 <th>Age</th>
                 <th>Check-in</th>
                  <th>Check-out</th>
            </tr>
            
            <%
              List<model.Reservation> list = (List<model.Reservation>) request.getAttribute("reservations");
              for(model.Reservation r:list){%>
                
              <tr>
                    <td><%= r.getRno()%></td>
                    <td><%= r.getName()%></td>
                    <td><%= r.getAge()%></td>
                    <td><%= r.getCheckin()%> </td>
                    <td><%= r.getCheckout()%></td>
              </tr>
              <%
              }
            %>
            
            
        </table>
    </body>
</html>
