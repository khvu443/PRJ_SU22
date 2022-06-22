/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.Dao;
import Model.Class;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.*;
import java.util.*;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "NewClassServlet", urlPatterns = {"/NewClassServlet"})
public class NewClassServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String className = request.getParameter("Cname");
        String des = request.getParameter("des");

        try ( PrintWriter out = response.getWriter()) {
            Dao dao = new Dao();
            ArrayList<Class> cl = dao.getAllClass();

            dao.addNewClass(autoIncreaseIDClass(cl), className, des);
            RequestDispatcher rd = request.getRequestDispatcher("DisplayClass");
            rd.forward(request, response);
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

    int autoIncreaseIDClass(ArrayList<Class> ls) {
        int id = 1;
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getCid() == id) {
                id++;
            }
        }
        return id;
    }
}
