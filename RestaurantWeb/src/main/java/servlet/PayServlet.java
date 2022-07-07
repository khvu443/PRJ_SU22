package servlet;

import DAO.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;

import model.*;

@WebServlet(name = "PayServlet", urlPatterns = {"/PayServlet"})
public class PayServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        OrderDAO dao = new OrderDAO();
        HttpSession session = request.getSession();

        List<Product> pl = (List<Product>) session.getAttribute("listP");
        Account acc = null;
        double total = (double) session.getAttribute("total");
        List<Order> ol = dao.getAllOrder();
        List<Order> ordertList = new ArrayList<>();

        int size = pl.size();
        String url = "";


        while (size > 0) {
            if ((acc = (Account) session.getAttribute("NAME")) != null) {
                for (Product p : pl) {
                    ordertList.add(new Order(IDOrder(ol) , acc.getAccID(), p.getPID(), p.getQuantity()));
                    System.out.println("OID: " + IDOrder(ol));
                    size--;
                }
                url="OrderServlet";
            } else {
                url = "login.jsp";
            }
        }

        for (Order o : ordertList) {
//            dao.saveBillOrder(o.getOID(), o.getAccID(), o.getPid(), o.getOquantity(), total);
            System.out.println(o.toString());
        }
        
        

        request.getRequestDispatcher(url).forward(request, response);
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
    
    String IDOrder(List<Order> ol)
    {
        String id = "O";
        int no = 1;
        if(!ol.isEmpty())
        {
            for(int o = 0; o < ol.size(); o++)
            {
                String OID[] = ol.get(o).getOID().split("O");
                for(int i = 1; i<OID.length;i++)
                {
                    int n = Integer.parseInt(OID[i]);
                    while(no < n)
                    {
                        no++;
                    }
                }
                
            }
        }
        return id + no;
    }
}
