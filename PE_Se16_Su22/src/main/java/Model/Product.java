/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;



public class Product {

    private int PID;
    private String pName;
    private int quantity;
    private double price;
    private String image;
    private String user;
    private String dateCreate;

    public Product() {
    }

    public Product(int PID, String pName, int quantity, double price, String image, String user, String dateCreate) {
        this.PID = PID;
        this.pName = pName;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.user = user;
        this.dateCreate = dateCreate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPID() {
        return PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    @Override
    public String toString() {
        return "Product{" + "PID=" + PID + ", pName=" + pName + ", quantity=" + quantity + ", price=" + price + ", image=" + image + ", user=" + user + ", dateCreate=" + dateCreate + '}';
    }

}
