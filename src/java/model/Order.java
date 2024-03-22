/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author hien
 */
public class Order {
    private int ordId;
    private LocalDate ordDate;
    private double totalPrice;
    private String usId;
    private String address;
    
    public Order() {
    }

    public Order(int ordId, LocalDate ordDate, double totalPrice, String usId, String address) {
        this.ordId = ordId;
        this.ordDate = ordDate;
        this.totalPrice = totalPrice;
        this.usId = usId;
        this.address = address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public int getOrdId() {
        return ordId;
    }

    public LocalDate getOrdDate() {
        return ordDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public String getUsId() {
        return usId;
    }

    public void setOrdId(int ordId) {
        this.ordId = ordId;
    }

    public void setOrdDate(LocalDate ordDate) {
        this.ordDate = ordDate;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setUsId(String usId) {
        this.usId = usId;
    }
    
}
