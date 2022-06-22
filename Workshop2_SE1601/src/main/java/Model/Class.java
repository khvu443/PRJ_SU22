/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;


public class Class {
    private int cid;
    private String className;
    private String des;

    public Class() {
    }

    public Class(int cid, String className, String des) {
        this.cid = cid;
        this.className = className;
        this.des = des;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @Override
    public String toString() {
        return "Class{" + "cid=" + cid + ", className=" + className + ", des=" + des + '}';
    }
    
    
}
