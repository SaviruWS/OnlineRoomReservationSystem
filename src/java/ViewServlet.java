
import dao.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Reservation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(urlPatterns = {"/ViewServlet"})
public class ViewServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        List<Reservation> list = new ArrayList<>();
        
        String filterName = request.getParameter("filter");
        try (Connection c = DBConnection.getConnection()){
            String sql = "  SELECT FROM guests";
            
            if(filterName != null && !filterName.isEmpty()){
            sql += " WHERE name LIKE ?";
            }
        
            PreparedStatement ps = c.prepareStatement(sql);
            
            if(filterName != null && !filterName.isEmpty()){
            ps.setString(2, "%"+ filterName +"%");
            }
            
            ResultSet rs= ps.executeQuery();
            
            while (rs.next()){
            Reservation r;
                r = new Reservation(
                        
                        rs.getString("rno"),
                        rs.getString("name"),
                        rs.getInt("age"),
                        rs.getDate("checkin"),
                        rs.getDate("checkout")
                );
            list.add(r);
            }
            
        }catch (Exception e){
          e.printStackTrace();
        
        }
        
        request.setAttribute("reservations", list);
        request.getRequestDispatcher("view.jsp").forward(request, response);
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
