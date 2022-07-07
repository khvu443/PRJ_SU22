/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;



public class Account {
    private String user;
    private String password;
    private String name;
    private boolean role;
    private boolean status;

    public Account() {
    }

    public Account(String user, String password, String name, boolean role, boolean status) {
        this.user = user;
        this.password = password;
        this.name = name;
        this.role = role;
        this.status = status;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" + "user=" + user + ", password=" + password + ", name=" + name + ", role=" + role + ", status=" + status + '}';
    }
    
    
    
}
