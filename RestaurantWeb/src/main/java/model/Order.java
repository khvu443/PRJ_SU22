package model;

public class Order {

    private String OID;
    private String date;
    private String pid;
    private String accID;
    private int Oquantity;
    private double totalMoney;

    public Order() {
    }

    public Order(String OID, String accID, String pid, int Oquantity) {
        this.OID = OID;
        this.pid = pid;
        this.accID = accID;
        this.Oquantity = Oquantity;
    }

    public String getOID() {
        return OID;
    }

    public void setOID(String OID) {
        this.OID = OID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getAccID() {
        return accID;
    }

    public void setAccID(String accID) {
        this.accID = accID;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getOquantity() {
        return Oquantity;
    }

    public void setOquantity(int Oquantity) {
        this.Oquantity = Oquantity;
    }

    @Override
    public String toString() {
        return "Order{" + "OID=" + OID + ", pid=" + pid + ", accID=" + accID + ", Oquantity=" + Oquantity + '}';
    }

    
    
}
