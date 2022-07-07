package DAO;

import connect.DBUtils;
import java.util.*;
import java.sql.*;
import model.*;

public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Order> getAllOrder() {
        List<Order> ol = new ArrayList<>();
        String query = "select * from [dbo].[Order]";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ol.add(new Order(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {

        }
        return ol;
    }

    public void saveBillOrder(String OID, String accID, String pid, int Oquantity, double total) {
        String query = "insert into [dbo].[Order] values (?,?,?,?,?,GETDATE())";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, OID);
            ps.setString(2, accID);
            ps.setString(3, pid);
            ps.setInt(4, Oquantity);
            ps.setDouble(5, total);

            rs = ps.executeQuery();
        } catch (Exception e) {

        }
    }
}
