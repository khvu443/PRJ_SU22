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

@WebServlet(name = "UpdateServletAdmin", urlPatterns = {"/AdminUpdateAccount"})
public class UpdateServletAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");

        LoginDAO dao = new LoginDAO();
        Account b = dao.getInfoAcc(user);

        request.setAttribute("u", b);

        System.out.println("Before: " + b.toString());

        request.getRequestDispatcher("AdminUpdate.jsp").
                forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String name = request.getParameter("name");
        String roleStr = request.getParameter("role");
        String statusStr = request.getParameter("status");
        boolean role = false, status = false;
        
        if (roleStr.equals("admin")) {
            role = true;
        }
        if (statusStr.equals("Active")) {
            status = true;
        }

        System.out.println("HAS UPDATED");

        LoginDAO dao = new LoginDAO();
        dao.updateAcc(user, pass, name, role, status);
        response.sendRedirect("AdminHomePage");
    }

}
