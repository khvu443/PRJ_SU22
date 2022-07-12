/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Admin;

import DAO.*;
import model.*;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.util.*;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "AdminUpdateAccount", urlPatterns = {"/AdminUpdateAcc"})
public class AdminUpdateAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accID = request.getParameter("accID");
        System.out.println("ID update: " + accID);

        LoginDAO dao = new LoginDAO();
        Account acc = dao.getInfoAccByID(accID);
        ArrayList<RoleDetail> rl = dao.getAllRole();

        HttpSession session = request.getSession();
        session.setAttribute("u", acc);

        for (RoleDetail r : rl) {
            if (acc.getRoleID().equals(r.getRoleID())) {
                session.setAttribute("role", r.getRoleName());
            }
        }

        System.out.println("Before: " + acc);

        request.getRequestDispatcher("AdminUpdateAccount.jsp").
                forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("u");

        LoginDAO dao = new LoginDAO();
        ArrayList<RoleDetail> rl = dao.getAllRole();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");

        String role = request.getParameter("role");
        String roleID = "";
        for (RoleDetail r : rl) {
            if (role.equals(r.getRoleName())) {
                roleID = r.getRoleID();
            }
        }

        boolean status = Boolean.parseBoolean(request.getParameter("status"));

        System.out.println("Update: " + acc.getAccID() + " - " + username + " - " + password + " - " + fullname + " - " + roleID + " - " + status);
        System.out.println("HAS UPDATED");

        dao.updateAcc(acc.getAccID(), username, password, fullname, roleID, true);

        request.getRequestDispatcher("AdminHomeServlet").forward(request, response);
    }

}
