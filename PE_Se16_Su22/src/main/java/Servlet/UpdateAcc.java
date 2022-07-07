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

@WebServlet(name = "UpdateAcc", urlPatterns = {"/UpdateAcc"})
public class UpdateAcc extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        System.out.println("ID update: " + user);

        LoginDAO dao = new LoginDAO();
        Account acc = dao.getInfoAcc(user);

        request.setAttribute("u", acc);

        System.out.println("Before: " + acc.toString());

        request.getRequestDispatcher("updateAccount.jsp").
                forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String name = request.getParameter("name");
        boolean role = Boolean.parseBoolean(request.getParameter("role"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        
        System.out.println("Update: " + user + " - " + pass + " - " + name +" - " + role + " - " + status);
        System.out.println("HAS UPDATED");
        
        LoginDAO dao = new LoginDAO();
        dao.updateAcc(user, pass, name, role, status);
        
        response.sendRedirect("UserHomeServlet");
    }

}
