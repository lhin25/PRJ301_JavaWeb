/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Cart;
import model.Item;
import model.Order;
import model.User;

/**
 *
 * @author hien
 */
public class OrderDAO {
    private static final String ORDER = "Select * from [Order]";
    private static final String ORDER_BY_USER = "select * from [Order] where UserID=?";
    private static final String ADD = "Insert into [Order](OrderDate,TotalPrice,UserID,Address) values (?,?,?,?)";
    private static final String RECDET = "Select top 1 OrderID from [Order] order by OrderID desc";
    private static final String ADDDET = "Insert into [OrderDetail] values (?,?,?,?)";
    
    public ArrayList<Order> getOrder(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Order> allOrder = new ArrayList<>();
        try (Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(ORDER);
                rs = ptm.executeQuery();
                while (rs.next()){
                    Order ord = new Order();
                    ord.setOrdId(rs.getInt(1));
                    ord.setOrdDate(LocalDate.parse(rs.getDate(2).toString()));
                    ord.setTotalPrice(rs.getDouble(3));
                    ord.setUsId(rs.getString(4));
                    ord.setAddress(rs.getString(5));
                    allOrder.add(ord);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return allOrder;
    }
    
    public ArrayList<Order> getOrderByUser(String uid){
        ArrayList<Order> ord_by_us = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(ORDER_BY_USER);
                ptm.setString(1, uid);
                rs = ptm.executeQuery();
                while (rs.next()){
                    Order ord = new Order();
                    ord.setOrdId(rs.getInt(1));
                    ord.setOrdDate(LocalDate.parse(rs.getDate(2).toString()));
                    ord.setTotalPrice(rs.getDouble(3));
                    ord.setUsId(rs.getString(4));
                    ord.setAddress(rs.getString(5));
                    ord_by_us.add(ord);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ord_by_us;
    }
    
    public void insertOrder (User us, Cart cart){
        PreparedStatement stm = null;
        PreparedStatement ptm = null;
        PreparedStatement stm1 = null;
        ResultSet rs = null;
        LocalDate orderDate = LocalDate.now();
        try(Connection con = DBcontext.getConnection()){
            stm = con.prepareStatement(ADD);
            stm.setDate(1, Date.valueOf(orderDate.toString()));
            stm.setDouble(2, cart.getTotalPrice());
            stm.setString(3, us.getUsId());
            stm.setString(4, us.getAddress());
            stm.executeUpdate();
            
            ptm = con.prepareStatement(RECDET);
            rs = ptm.executeQuery();
            if (rs.next()){
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()){
                    stm1 = con.prepareStatement(ADDDET);
                    stm1.setInt(1, oid);
                    stm1.setString(2, i.getProduct().getPrId());
                    stm1.setInt(3, i.getoQuantity());
                    stm1.setDouble(4, i.getoPrice());
                    stm1.executeUpdate();
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
