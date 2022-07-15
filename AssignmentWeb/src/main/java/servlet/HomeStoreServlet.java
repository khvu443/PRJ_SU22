/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import DAO.GameDAO;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

import model.Product;

@WebServlet(name = "HomeStoreServlet", urlPatterns = {"/HomeStoreServlet"})
public class HomeStoreServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<Product> listP = null;
        // trang hien tai cua trang store
        int page = Integer.parseInt(request.getParameter("page"));
        System.out.println("page current: " + page);
        
        GameDAO dao = new GameDAO();
        List<Product> allP = dao.getAllProduct();
        List<Product> newP = dao.getNewProduct();

        // set attribute vao trang store.jsp
        // - set Page de check 2 dau mui ten kieu neu page ma = 1 thi khi check lui trang no se luon de 1
        // ko cho ve 0
        request.setAttribute("page", page);
        // - set size list/5 - vi hien 5 sp trg 1 trang thi vd 10 sp thi se co 2 page
        // - ngoai ra con check xem trang hien tai co = size page ko neu = la ko cho len nua ma
        // van giu nguyen
        request.setAttribute("sizeProduct", (allP.size() / 5));
        request.setAttribute("newP", newP);

        // vong lap de offset sp va fetch sp - co 10 sp id 1 -> 10 
        // thi neu trang dau thi offset se la 0 -> lay i dang == voi trang hien tai * 5 (so luong sp hien)
        // de tinh ra offset
        // vd: trang 1 thi i se la 0 -> hien 5 sp co id tu 1 - 5 con sang trang 2 thi i la 1
        // => offset se la bo 5 sp truoc di roi dung fetch de lay 5 sp moi co id tu 6-> 10
        for (int i = 0; i <= (allP.size() / 5); ++i) {
            if (((page - 1) == i)) {
                listP = dao.getProductPage(i * 5);
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("listP", listP);
        request.getRequestDispatcher("store.jsp").include(request, response);
        
        // chay sql de hieu - select * from product order by Product_id ASC OFFSET 5 rows FETCH NEXT 5 ROWS ONLY
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
