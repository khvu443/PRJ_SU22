/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

import model.*;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class AuthFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String url = request.getRequestURI();

        HttpSession session = request.getSession();
        Account acc = null;

        // kiem url la bat dau co phai la 1 trang co Admin khong
        if (url.startsWith("/AssignmentWeb/Admin")) {
            // Kiem tra account co la dang nhap khong neu ko thi cho ve login
            if ((acc =  (Account) session.getAttribute("NAME")) != null) {
                // kiem tra role account
                if (acc.getRoleID().equals("R01")) {
                    System.out.println("PERMISSION");
                    fc.doFilter(req, res);
                    
                } else if (acc.getRoleID().equals("R02")) {
                    request.setAttribute("color", "#f44336");
                    request.setAttribute("message", "<div class=\"alert\">\n"
                            + "  <span class=\"closebtn\" onclick=\"this.parentElement.style.display='none';\">&times;</span> \n"
                            + "  YOU DON'T HAVE PERMISSION TO ACCESS\n"
                            + "</div>");
                    System.out.println("NOT PERMISSION");
                    RequestDispatcher rd = request.getRequestDispatcher("HomeServlet");
                    rd.forward(request, response);
                }
            } else {
                request.setAttribute("show", "show");
                request.setAttribute("alert", "danger");
                request.setAttribute("ERROR", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> LOGIN FIRST");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        } else {
            // neu ko phai la trang admin thi se cho phep vao
            fc.doFilter(req, res);
        }

    }

    @Override
    public void destroy() {

    }

}
