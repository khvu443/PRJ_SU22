package DAO;

import Connect.DBUtils;
import Model.Student;
import Model.Class;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class Dao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // DAO With Student
    public void addNewStudent(int id, String name, int Cid, int age, String image) {
        String query = "insert into TableStudent values(?, ?, ?, ?,?)";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, Cid);
            ps.setInt(4, age);
            ps.setString(5, image);

            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public ArrayList<Student> getAllStudent() {
        String query = "select * from TableStudent";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            ArrayList<Student> list = new ArrayList<>();
            while (rs.next()) {
                int Sid = rs.getInt("StudentID");
                String name = rs.getString("StudentName");
                int Cid = rs.getInt("ClassID");
                int age = rs.getInt("Age");
                String image = rs.getString("Image");
                Student st = new Student(Sid, name, Cid, age, image);
                list.add(st);
            }
            return list;
        } catch (Exception e) {

        }
        return null;
    }

    public void deleteStudent(int id) {
        String query = "Delete from TableStudent where StudentID = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public Student getInfoStudent(int id) {
        String query = "select * from TableStudent where StudentID = ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                System.out.println("HAVE GET");
                return new Student(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void updateStudent(int id, String name, int Cid, int age, String image) {
        String query = "update TableStudent set StudentName= ?, ClassID= ?,Age= ?, Image=? where StudentID= ?";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, Cid);
            ps.setInt(3, age);
            ps.setString(4, image);
            ps.setInt(5, id);

            ps.executeUpdate();
        } catch (Exception e) {

        }

    }

    // DAO With Clas
    public ArrayList<Class> getAllClass() {
        String query = "select * from Class";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            ArrayList<Class> list = new ArrayList<>();

            while (rs.next()) {
                int Cid = rs.getInt("ClassID");
                String name = rs.getString("ClassName");
                String Des = rs.getString("Description");
                Class c = new Class(Cid, name, Des);
                list.add(c);
            }
            return list;
        } catch (Exception e) {

        }
        return null;
    }

    public void addNewClass(int id, String className, String des) {
        String query = "insert into Class values(?, ?, ?)";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, className);
            ps.setString(3, des);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }
}
