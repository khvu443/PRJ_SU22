package servlet;

import DAO.GameDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

import model.Product;
import model.category;

@WebServlet(name = "ShowCart", urlPatterns = {"/ShowCart"})
public class ShowCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // hien thong tin cac sp da dc add vao cart
        GameDAO dao = new GameDAO();
        List<category> listC = dao.getAllCategory();

        HttpSession session = request.getSession();
        request.setAttribute("listC", listC);

        Cookie arr[] = null;

        PrintWriter out = response.getWriter();

        List<Product> list = new ArrayList<>();

        if ((arr = request.getCookies()) != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("id")) {
                    System.out.println("get value: " + o.getValue());

                    String txt[] = o.getValue().split("/");
                    for (String s : txt) {
                        list.add(dao.getProduct(s));
                        System.out.println("eTXT:" + s);
                    }
                }
            }
        }

        double total = 0;
        for (int j = 0; j < list.size(); j++) {

            total = total + list.get(j).getPrice();
            System.out.println(list.get(j).getNameP() + " - " + list.get(j).getPrice());
        }

        System.out.println(
                "total: " + total);

        session.setAttribute(
                "total", total);
        session.setAttribute(
                "listP", list);
        session.setAttribute(
                "numberCart", list);
        request.getRequestDispatcher(
                "checkout.jsp").forward(request, response);
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
