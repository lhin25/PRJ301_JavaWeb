/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author hien
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getQuantityById(String id) {
        return getItemById(id).getoQuantity();
    }

    private Item getItemById(String id) {
        for (Item i : items) {
            if (i.getProduct().getPrId().equals(id)) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item i) {
        if (getItemById(i.getProduct().getPrId()) != null) {
            Item t = getItemById(i.getProduct().getPrId());
            if ((t.getoQuantity() + i.getoQuantity()) <= t.getProduct().getQuantity())
                t.setoQuantity(t.getoQuantity() + i.getoQuantity());
            else t.setoQuantity(t.getProduct().getQuantity());
        } else {
            items.add(i);
        }
    }

    public void removeItem(String id) {
        if (getItemById(id) != null)
     {
            items.remove(getItemById(id));
        }
    }
    
    public double getTotalPrice(){
        double price = 0;
        for (Item i : items){
            price += (i.getoQuantity() * i.getProduct().getPrice());
        }
        return price;
    }

}
