package DAO;

import connect.DBUtils;
import java.util.*;
import java.sql.*;
import Model.Account;

public class LoginDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Account> getAllAcc() {
        ArrayList<Account> al = new ArrayList<>();
        String query = "select * from AccountTBL ";
        try {

            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                al.add(new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5)
                ));
            }
        } catch (Exception e) {

        }

        return al;
    }

    public Account checkLogin(String user, String pass) {
        String query = "select * from AccountTBL  where Username=? and Password=?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5)
                );
            }

        } catch (Exception e) {

        }
        return null;
    }

    public void NewAcc(String usernamme, String password, String fullname, boolean role, boolean status) {
        String query = "insert into AccountTBL  values (?,?, ?, ?,?)";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, usernamme);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setBoolean(4, role);
            ps.setBoolean(5, status);

            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public Account getInfoAcc(String username) {
        String query = "select * from AccountTBL  where Username=?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5)
                );
            }

        } catch (Exception e) {

        }
        return null;
    }

    public void updateAcc(String user, String pass, String name, boolean role, boolean status) {
        String query = "update AccountTBL set Password= ?,Fullname= ?, Role=?, Status=? where Username= ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pass);
            ps.setString(2, name);
            ps.setBoolean(3, role);
            ps.setBoolean(4, status);
            ps.setString(5, user);

            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

}
