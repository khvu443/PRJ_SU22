package servlet;

import DAO.RestaurantDAO;
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

        RestaurantDAO dao = new RestaurantDAO();
        List<category> listC = dao.getAllCategory();

        HttpSession session = request.getSession();
        request.setAttribute("listC", listC);

        Cookie arr[] = request.getCookies();

        PrintWriter out = response.getWriter();

        List<Product> list = new ArrayList<>();
        List<Product> saleList = dao.getNewProduct();

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

        for (int i = 0; i < list.size(); i++) {
            int count = 1;
            list.get(i).setQuantity(count);

            for (int j = i + 1; j < list.size(); j++) {
                if (list.get(i).getPID().equals(list.get(j).getPID())) {
                    count++;
                    list.remove(j);
                    j--;
                    list.get(i).setQuantity(count);
                    System.out.println("So luong" + count + "\n");
                }
            }
        }
        double total = 0;

        // NOT SALE PRODUCT
        List<Product> allP = dao.getAllProduct();
        List<String> arrP = new ArrayList<>();
        for (int i = 0; i < allP.size(); i++) {
            for (int j = 0; j < saleList.size(); j++) {
                if (allP.get(i).getPID().equals(saleList.get(j).getPID())) {
                    arrP.add(allP.get(i).getPID());
                }
            }
        }

        for (int i = 0; i < allP.size(); i++) {
            for (int j = 0; j < arrP.size(); j++) {
                if (allP.get(i).getPID().equals(arrP.get(j))) {
                    allP.remove(i);
                }
            }
        }

        // SALE
        for (Product s : allP) {
            for (Product o : list) {
                if (s.getPID().equals(o.getPID())) {
                    total = total + o.getQuantity() * o.getPrice();
                }
            }
        }

        for (Product s : saleList) {
            for (Product o : list) {
                if (s.getPID().equals(o.getPID())) {
                    total = total + o.getQuantity() * o.getPrice() / 2;
                }
            }
        }

        System.out.println("total: " + total);

        session.setAttribute("total", total);
        session.setAttribute("listP", list);
        session.setAttribute("numberCart", list);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
