/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Filter;

import Model.Account;
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
        Account acc = (Account) session.getAttribute("NAME");
        System.out.println("Acc in filter: " + acc);

        if (url.startsWith("/PE_Se16_Su22/Admin")) {
            if (acc != null) {
                if (acc.isRole() == true) {
                    System.out.println("PERMISSION");
                    fc.doFilter(req, res);
                } else if (acc.isRole() == false) {
                    request.setAttribute("MESSAGE", "<i class=\"bi bi-exclamation-triangle-fill\"></i> You Don't Have Permission To Access");
                    request.setAttribute("show", "show");
                    System.out.println("NOT PERMISSION");
                    RequestDispatcher rd = request.getRequestDispatcher("UserHomeServlet");
                    rd.forward(request, response);
                }
            } else {
                request.setAttribute("MESSAGE", "<i class=\"bi bi-exclamation-triangle-fill\"></i> Please Login First");
                request.setAttribute("show", "show");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        } else {
            fc.doFilter(req, res);
        }

    }

    @Override
    public void destroy() {

    }

}
