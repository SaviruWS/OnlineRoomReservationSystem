package servlet;

import dao.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;


@WebServlet(urlPatterns = {"/reserveServlet"})
public class reserveServlet extends HttpServlet {

       protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
       // request.setCharacterEncoding("UTF-8");
        //response.setContentType("text/html;charset=UTF-8");
        
        String rno = request.getParameter("rno");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        
        java.time.LocalDate checkinD = java.time.LocalDate.parse(checkin);
        java.sql.Date checkinSD = java.sql.Date.valueOf(checkinD);//sql,jdbc
        
        java.time.LocalDate checkoutD = java.time.LocalDate.parse(checkout);
        java.sql.Date checkoutSD = java.sql.Date.valueOf(checkoutD);//sql,jdbc
        
        try (Connection c = DBConnection.getConnection()){
            PreparedStatement ps = c.prepareStatement("INSERT INTO guests(rno, name, age, checkin, checkout) VALUES (?, ?, ?, ?, ?)");
            
            ps.setString (1, rno);
            ps.setString (2, name);
            ps.setInt(3, age);
            
            ps.setDate (4, checkinSD);
            ps.setDate (5, checkoutSD);
            
            ps.executeUpdate();
            
            response.sendRedirect("ViewServlet");
        }catch(Exception e){
            e.printStackTrace();
        
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}