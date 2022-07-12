/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Product {
    private String PID;
    private String image;
    private String nameP;
    private String categoryID;
    private int price;
    private String dateCreate;
    private float rating;

    public Product() {
    }

    public Product(String PID, String image, String nameP, String categoryID, int price, String date, float rate) {
        this.PID = PID;
        this.image = image;
        this.nameP = nameP;
        this.categoryID = categoryID;
        this.price = price;
        this.dateCreate = date;
        this.rating = rate;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }


    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }
    
    

    public String getPID() {
        return PID;
    }

    public void setPID(String PID) {
        this.PID = PID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getNameP() {
        return nameP;
    }

    public void setNameP(String nameP) {
        this.nameP = nameP;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }



    @Override
    public String toString() {
        return "Product{" + "PID=" + PID + ", image=" + image + ", nameP=" + nameP + ", categoryID=" + categoryID + ", price=" + price + ", Date=" + dateCreate + '}';
    }
    
      
}