/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // lay id sp muon add vao 
        String id = request.getParameter("id");
        
        
        // tao 1 mang cookie de check
        Cookie arr[] = request.getCookies();
        String txt = "";

        // chay vong lap de kt xem trg cookie co chua neu co thi se cho txt = gia tri cua cookie co ten
        // trung voi Id va xoa cookie do (O day set Max Age la cho cookie do het han
        for (Cookie o : arr) {
            if (o.getName().equals("id")) {
                txt = txt + o.getValue();
                o.setMaxAge(0);
                response.addCookie(o);
            }
        }
        // neu ma vong lap tren ko co trung thi cho txt do = id sp
        if (txt.isEmpty()) {
            txt = id;
        } else {
            // ko thi cho them / vao de ngan cach 2 id
            txt = txt + "/" + id;
        }
        System.out.println("cookie: " + txt);
        
        // khoi tao 1 cookie moi voi id la sp va txt
        Cookie c = new Cookie("id", txt);
        c.setMaxAge(60);

        response.addCookie(c);
        response.sendRedirect("ShowCart");
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
