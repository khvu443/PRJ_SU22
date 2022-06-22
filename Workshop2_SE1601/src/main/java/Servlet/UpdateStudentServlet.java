/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.Dao;
import Model.Student;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.nio.file.Files;
import java.nio.file.Path;

@MultipartConfig
@WebServlet(name = "UpdateStudentServlet", urlPatterns = {"/UpdateStudentServlet"})
public class UpdateStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("sid"));
        System.out.println("ID update: " + id);

        Dao dao = new Dao();
        Student b = dao.getInfoStudent(id);

        request.setAttribute("st", b);

        System.out.println("Before: " + b.toString());

        request.getRequestDispatcher("updateStudent.jsp").
                forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("Id"));
        String name = request.getParameter("Name");
        int cid = Integer.parseInt(request.getParameter("classID"));
        int age = Integer.parseInt(request.getParameter("age"));
        String oldPhoto = request.getParameter("photo");
        
        System.out.println("oldPhoto: " + oldPhoto);
        System.out.println("HAS UPDATED");

        Part part = request.getPart("photo"); 
        String photoPath = request.getServletContext().getRealPath("/image");

        String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();

        if (!Files.exists(Path.of(photoPath))) {
            Files.createDirectories(Path.of(photoPath));
        }
        part.write(photoPath + "/" + fileName);
        Dao dao = new Dao();
        dao.updateStudent(id, name, cid, age, "image/" + fileName);

        response.sendRedirect("DisplayStudent");
    }

}
