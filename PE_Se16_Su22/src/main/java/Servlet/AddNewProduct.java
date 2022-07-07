/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.*;
import Model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import java.io.IOException;
import jakarta.servlet.http.*;
import java.util.ArrayList;
import jakarta.servlet.annotation.*;
import java.nio.file.Files;
import java.nio.file.Path;

@MultipartConfig
@WebServlet(name = "AddNewProduct", urlPatterns = {"/AdminAddNewProduct"})
public class AddNewProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ProductDAO dao = new ProductDAO();
        ArrayList<Product> pl = dao.getAllProduct();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("NAME");
        System.out.println("acc in add new product: " + acc);

        String pName = request.getParameter("name");
        int qty = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        Part part = request.getPart("photo");
        String photoPath = request.getServletContext().getRealPath("/img");

        String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Path.of(photoPath))) {
            Files.createDirectories(Path.of(photoPath));
        }
        part.write(photoPath + "/" + filename);

        System.out.println(" - " + pName + " - " + qty + " - " + price + " - " + filename);

        if (duplicationName(pName, pl)) {
            Product p = dao.getInfoProductByName(pName);
            p.setQuantity(p.getQuantity() + qty);
            int newQty = p.getQuantity();
            dao.updateProduct(p.getPID(), pName, newQty, price, "img/" + filename, p.getUser(), p.getDateCreate());
        } else {
            dao.newProduct(autoIncreaseID(pl), pName, qty, price, "img/" + filename, acc.getUser());

        }
        RequestDispatcher rd = request.getRequestDispatcher("AdminHomePage");
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

    int autoIncreaseID(ArrayList<Product> ls) {
        int id = 1;
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getPID() == id) {
                id++;
            }
        }
        return id;
    }

    boolean duplicationName(String name, ArrayList<Product> ls) {
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getpName().equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }
}
