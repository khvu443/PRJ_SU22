/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package testing;

import DAO.*;
import java.util.*;
import model.*;

public class NewMain {

    public static void main(String[] args) {

        OrderDAO dao = new OrderDAO();
        List<Order> ol = dao.getAllDetailOrder();
        for (Order o : ol) {
            System.out.println(IDetailDOrder(ol));
        }
    }

    static String IDetailDOrder(List<Order> ol) {
        String id = "O";
        int no = 1;
        for (int o = 0; o < ol.size(); o++) {
            String OID[] = ol.get(o).getOID().split("O");
            for (int i = 1; i < OID.length; i++) {
                int n = Integer.parseInt(OID[i]);
                while (no <= n) {
                    no++;
                }
            }
        }
        return id + no;
    }
}
