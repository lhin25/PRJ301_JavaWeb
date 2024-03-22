/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hien
 */
public class Item {
    private Product product;
    private int oQuantity;
    private double oPrice;

    public Item() {
    }

    public Item(Product product, int oQuantity, double oPrice) {
        this.product = product;
        this.oQuantity = oQuantity;
        this.oPrice = oPrice;
    }

    public Product getProduct() {
        return product;
    }

    public int getoQuantity() {
        return oQuantity;
    }

    public double getoPrice() {
        return oPrice;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setoQuantity(int oQuantity) {
        this.oQuantity = oQuantity;
    }

    public void setoPrice(double oPrice) {
        this.oPrice = oPrice;
    }
    
}
