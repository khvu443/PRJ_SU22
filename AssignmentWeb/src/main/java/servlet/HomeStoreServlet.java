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

        int page = Integer.parseInt(request.getParameter("page"));

        System.out.println("page current: " + page);
        GameDAO dao = new GameDAO();
        List<Product> allP = dao.getAllProduct();

        List<Product> newP = dao.getNewProduct();

        request.setAttribute("page", page);
        request.setAttribute("sizeProduct", (allP.size() / 5));
        request.setAttribute("newP", newP);

        for (int i = 0; i <= (allP.size() / 5); ++i) {
            if (((page - 1) == i)) {
                listP = dao.getProductPage(i * 5);
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("listP", listP);
        request.getRequestDispatcher("store.jsp").include(request, response);

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
