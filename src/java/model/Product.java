/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

/**
 *
 * @author hien
 */
public class Product implements Serializable{
    private String prId;
    private String prName;
    private String prImg;
    private String prType;
    private String prOrg;
    private double price;
    private int quantity;
    private String description;

    public Product() {
    }

    public Product(String prId, String prName, String prImg, String prType, String prOrg, double price, int quantity, String description) {
        this.prId = prId;
        this.prName = prName;
        this.prImg = prImg;
        this.prType = prType;
        this.prOrg = prOrg;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
    }

    public void setPrId(String prId) {
        this.prId = prId;
    }

    public void setPrName(String prName) {
        this.prName = prName;
    }

    public void setPrImg(String prImg) {
        this.prImg = prImg;
    }

    public void setPrType(String prType) {
        this.prType = prType;
    }

    public void setPrOrg(String prOrg) {
        this.prOrg = prOrg;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getPrId() {
        return prId;
    }

    public String getPrName() {
        return prName;
    }

    public String getPrImg() {
        return prImg;
    }

    public String getPrType() {
        return prType;
    }

    public String getPrOrg() {
        return prOrg;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getDescription() {
        return description;
    }
}
