
package servlet.Admin;

import DAO.*;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import model.*;


public class AdminHomeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        GameDAO resd = new GameDAO();
        LoginDAO logd = new LoginDAO();
        OrderDAO od = new OrderDAO();
        
        List<Account> accl = logd.getAllAcc();

        
        List<Product> pl = resd.getAllProduct();
        List<category> cl = resd.getAllCategory();
        
        List<BillOrder> bol = od.getAllOrder();
        
        HttpSession session = request.getSession();
        session.setAttribute("accl", accl);        
        
        session.setAttribute("pl", pl);
        request.setAttribute("cl", cl);
        
        session.setAttribute("bol", bol);
        
        request.getRequestDispatcher("./Admin/AdminHome.jsp").forward(request, response);
        
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
