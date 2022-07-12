package model;

public class Order {

    private String OID;
    private String pid;
    private double totalMoney;

    public Order() {
    }

    public Order(String OID, String pid, double totalMoney) {
        this.OID = OID;
        this.pid = pid;
        this.totalMoney = totalMoney;
    }

    public String getOID() {
        return OID;
    }

    public void setOID(String OID) {
        this.OID = OID;
    }


    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }


    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }


    @Override
    public String toString() {
        return "Order{" + "OID=" + OID + ", pid=" + pid + ", Money= "+ totalMoney + '}';
    }

    
    
}
