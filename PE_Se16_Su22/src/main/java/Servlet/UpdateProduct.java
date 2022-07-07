
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
@WebServlet(name = "UpdateProduct", urlPatterns = {"/AdminUpdateProduct"})
public class UpdateProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int PID = Integer.parseInt(request.getParameter("PID"));
        ProductDAO dao = new ProductDAO();
        Product b = dao.getInfoProduct(PID);
        request.setAttribute("p", b);

        System.out.println("Before: " + b.toString());

        request.getRequestDispatcher("AdminUpdateProduct.jsp").
                forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();
        ArrayList<Product> pl = dao.getAllProduct();

        int id = Integer.parseInt(request.getParameter("id"));
        String pName = request.getParameter("name");
        int qty = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String userCreate = request.getParameter("user");
        String date = request.getParameter("date");
        
        Part part = request.getPart("photo");
        String photoPath = request.getServletContext().getRealPath("/img");

        String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Path.of(photoPath))) {
            Files.createDirectories(Path.of(photoPath));
        }
        part.write(photoPath + "/" + filename);

        System.out.println("after: " + id + " - " + pName + " - " + qty + " - " + price + " - " + filename);
        System.out.println("UPDATED");
        dao.updateProduct(id, pName, qty, price, "img/" + filename, userCreate , date );
        response.sendRedirect("AdminHomePage");
    }

    int autoIncreaseID(ArrayList<Product> ls) {
        int id = 1;
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getPID() == id) {
                id++;
            }
        }
        return id;
    }
}
