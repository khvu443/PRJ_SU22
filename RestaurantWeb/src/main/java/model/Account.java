/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Account {

    private String accID;
    private String username;
    private String password;
    private String fullname;
    private String roleID;

    public Account() {
    }

    public Account(String accID, String username, String password, String fullname, String roleID) {
        this.accID = accID;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.roleID = roleID;
    }

    public String getAccID() {
        return accID;
    }

    public void setAccID(String accID) {
        this.accID = accID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    @Override
    public String toString() {
        return "LoginDAO{" + "accID=" + accID + ", username=" + username + ", password=" + password + ", fullname=" + fullname + ", roleID=" + roleID + '}';
    }
}