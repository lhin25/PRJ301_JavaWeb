/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hien
 */
public class OrderDetail {
    private int oid;
    private String pid;
    private int oQuantity;
    private double oPrice;

    public OrderDetail() {
    }

    public OrderDetail(int oid, String pid, int oQuantity, double oPrice) {
        this.oid = oid;
        this.pid = pid;
        this.oQuantity = oQuantity;
        this.oPrice = oPrice;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public void setoQuantity(int oQuantity) {
        this.oQuantity = oQuantity;
    }

    public void setoPrice(double oPrice) {
        this.oPrice = oPrice;
    }

    public int getOid() {
        return oid;
    }

    public String getPid() {
        return pid;
    }

    public int getoQuantity() {
        return oQuantity;
    }

    public double getoPrice() {
        return oPrice;
    }
}
