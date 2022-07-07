/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.LoginDAO;
import Model.Account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 *
 * @author lenovo
 */
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        String user = request.getParameter("username");
        String pass = request.getParameter("pass");

        System.out.println(user + " - " + pass);

        LoginDAO dao = new LoginDAO();
        Account acc = dao.checkLogin(user, pass);
        System.out.println("ACC in login servlet: " + acc);
        
        if (null != acc) {
            if (acc.isStatus()) {
                if (acc.isRole()) {
                    System.out.println("IS admin: " + acc.isRole());
                    HttpSession session = request.getSession();
                    session.setAttribute("NAME", acc);
                    url = "AdminHomePage";
                } else {
                    System.out.println("IS admin: " + acc.isRole());
                    HttpSession session = request.getSession();
                    session.setAttribute("NAME", acc);
                    url = "UserHomeServlet";
                }
            } else {
                url = "login.jsp";
                request.setAttribute("MESSAGE", "<i class=\"bi bi-exclamation-triangle-fill\"></i> Your Status Is Inacctive So You Don't Have Permission To Access");
                request.setAttribute("show", "show");
            }
        } else {
            url = "login.jsp";
                request.setAttribute("MESSAGE", "<i class=\"bi bi-exclamation-triangle-fill\"></i> Login Fail");
                request.setAttribute("show", "show");
        }

        System.out.println("url " + url);
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

}
