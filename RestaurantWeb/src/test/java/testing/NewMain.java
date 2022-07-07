/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package testing;

import DAO.LoginDAO;
import DAO.RestaurantDAO;
import java.util.*;
import model.Account;
import model.Product;
import model.category;

public class NewMain {

    public static void main(String[] args) {

        RestaurantDAO dao = new RestaurantDAO();
        List<Product> relateP = dao.getRelateProduct("C1", "P0016");
        List<Product> newP = dao.getNewProduct();
        int count=0;
        ArrayList<String> arr = new ArrayList<>();
        
        
        for(int i = 0; i< relateP.size(); i++)
        {
            for(int j = 0; j< newP.size(); j++)
            {
                if(relateP.get(i).getPID().equals(newP.get(j).getPID()))
                {
                    System.out.println("new: " + relateP.get(i).getPID());
                    arr.add(relateP.get(i).getPID());
                    count++;
                }
            }
        }
        System.out.println("count: " + count);
        for(int i = 0; i< relateP.size(); i++)
        {
            for(int j = 0; j<arr.size(); j++)
            {
                if(relateP.get(i).getPID().equals(arr.get(j)))
                {
                    relateP.remove(i);
                }
            }
        }
        
        for(Product p : relateP)
        {
            System.out.println(p.toString());
        }
    }
}
