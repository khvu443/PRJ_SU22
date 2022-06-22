package Servlet;

import DAO.Dao;
import Model.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.*;
import java.util.ArrayList;
import jakarta.servlet.annotation.*;
import java.nio.file.Files;
import java.nio.file.Path;

@MultipartConfig
@WebServlet(name = "AddNewSevlet", urlPatterns = {"/AddNewSevlet"})
public class AddNewSevlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = 0;
        String url = "";

        String name = request.getParameter("Sname");
        int Cid = Integer.parseInt(request.getParameter("classID"));
        int age = Integer.parseInt(request.getParameter("age"));

        // Xu ly hinh anh
        Part part = request.getPart("photo"); //Luu thong tin anh
        String photoPath = request.getServletContext().getRealPath("/image");

        String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();

        if (!Files.exists(Path.of(photoPath))) {
            Files.createDirectories(Path.of(photoPath));
        }
        part.write(photoPath + "/" + fileName);

        Dao d = new Dao();
        ArrayList<Student> ls = d.getAllStudent();

        id = autoIncreaseID(ls);
        System.out.println(id + " - " + name + " - " + Cid + " - " + age + " - " + fileName);

        try ( PrintWriter out = response.getWriter()) {

            if (name == null) {
                request.setAttribute("MESSAGE", "Student name 's empty");
            } else if (duplicationName(name, ls) || checkAge(age)) {
                request.setAttribute("MESSAGE", "Exist Student name " + name + " Or age is invalid");
                url = "AddNewStudent.jsp";
            } else {
                url = "DisplayStudent";
                d.addNewStudent(id, name, Cid, age, "image/" + fileName);
            }
            System.out.println("url: " + url);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
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

    boolean duplicationName(String name, ArrayList<Student> ls) {
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getSname().equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

    boolean checkAge(int age) {
        return age < 18 || age > 50;
    }

    int autoIncreaseID(ArrayList<Student> ls) {
        int id = 1;
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getSID() == id) {
                id++;
            }
        }
        return id;
    }
}
