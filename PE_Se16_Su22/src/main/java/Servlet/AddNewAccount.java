/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.*;
import Model.*;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.util.ArrayList;

@WebServlet(name = "AddNewAccount", urlPatterns = {"/AdminAddNewAccount"})
public class AddNewAccount extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = "";

        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String name = request.getParameter("name");
        String roleStr = request.getParameter("role");
        String statusStr = request.getParameter("status");
        boolean role = false;

        if (roleStr.equals("admin")) {
            role = true;
        }

        LoginDAO d = new LoginDAO();
        ArrayList<Account> ls = d.getAllAcc();

        if (duplicationName(user, ls)) {
            request.setAttribute("MESSAGE", "<i class=\"bi bi-exclamation-triangle-fill\"></i> Exist Username " + user);
            request.setAttribute("show", "show");
            url = "AdminCreateAccount.jsp";
        } else {
            d.NewAcc(user, pass, name, role, true);
            url = "AdminHomePage";

        }
        System.out.println("url: " + url);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
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

    boolean duplicationName(String name, ArrayList<Account> ls) {
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getUser().equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

}
