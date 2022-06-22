/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;


public class Student {
    private int SID;
    private String Sname;
    private int CID;
    private int age;
    private String image;

    public Student() {
    }

    public Student(int SID, String Sname, int CID, int age, String image) {
        this.SID = SID;
        this.Sname = Sname;
        this.CID = CID;
        this.age = age;
        this.image = image;
    }

    public int getSID() {
        return SID;
    }

    public void setSID(int SID) {
        this.SID = SID;
    }

    public String getSname() {
        return Sname;
    }

    public void setSname(String Sname) {
        this.Sname = Sname;
    }

    public int getCID() {
        return CID;
    }

    public void setCID(int CID) {
        this.CID = CID;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Student{" + "SID=" + SID + ", Sname=" + Sname + ", CID=" + CID + ", age=" + age + ", image=" + image + '}';
    }
    
    
    
}
