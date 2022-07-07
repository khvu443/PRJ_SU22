/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import connect.DBUtils;
import java.util.*;
import java.sql.*;
import Model.Product;

public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Product> getAllProduct() {
        String query = "select * from Product";
        ArrayList<Product> pl = new ArrayList<>();
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                pl.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {

        }
        return pl;
    }

    public Product getInfoProduct(int PID) {
        String query = "select * from Product  where ProductID=?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, PID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }

        } catch (Exception e) {

        }
        return null;
    }
    
        public Product getInfoProductByName(String name) {
        String query = "select * from Product  where ProductName=?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }

        } catch (Exception e) {

        }
        return null;
    }
    

    public void updateProduct(int PID, String pName, int quantity, double price, String image, String user, String DateCreate) {
        String query = "update Product set ProductName= ?, Quantity=?, Price=?, Image=?, UserCreate=?, DateCreate=? where ProductID= ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pName);
            ps.setInt(2, quantity);
            ps.setDouble(3, price);
            ps.setString(4, image);
            ps.setString(5, user);
            ps.setString(6, DateCreate);
            ps.setInt(7, PID);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void newProduct(int PID, String pName, int quantity, double price, String image, String user) {
        String query = "insert into Product values(?, ?, ?, ?, ?, ?, GETDATE())";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, PID);
            ps.setString(2, pName);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);
            ps.setString(5, image);
            ps.setString(6, user);

            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public void deleteProduct(int PID)
    {
        String query= "Delete from Product where ProductID = ?";
        try
        {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,PID);
            ps.executeUpdate();
        }
        catch(Exception e)
        {
            
        }
    }

}
