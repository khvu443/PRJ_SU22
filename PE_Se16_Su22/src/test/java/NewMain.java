
import DAO.LoginDAO;
import DAO.ProductDAO;
import Model.Account;
import Model.Product;
import java.util.ArrayList;

public class NewMain {

    public static void main(String[] args) {
        LoginDAO dao = new LoginDAO();
        ProductDAO d = new ProductDAO();
        ArrayList<Product> p = d.getAllProduct();
        for(Product a : p)
        {
            System.out.println(a.toString());
        }
    }

}
