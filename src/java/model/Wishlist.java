/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hien
 */
public class Wishlist {
    private String usId;
    private String prId;

    public Wishlist() {
    }

    public Wishlist(String usId, String prId) {
        this.usId = usId;
        this.prId = prId;
    }

    public String getUsId() {
        return usId;
    }

    public String getPrId() {
        return prId;
    }

    public void setUsId(String usId) {
        this.usId = usId;
    }

    public void setPrId(String prId) {
        this.prId = prId;
    }
    
}
