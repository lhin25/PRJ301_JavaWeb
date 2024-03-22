/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Wishlist;

/**
 *
 * @author hien
 */
public class WishlistDAO {
    private static final String ADD = "Insert into [Wishlist] values(?,?)";
    private static final String DELETE = "Delete from [Wishlist] where UserID=? and ProductID=?";
    private static final String GET = "Select * from [Wishlist] where UserID=?";
    
    public void addWishlist(String usId, String prId){
        PreparedStatement stm = null;
        try (Connection con = DBcontext.getConnection()) {
            stm = con.prepareStatement(ADD);
            stm.setString(1, usId);
            stm.setString(2, prId);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void deleteWishlist(String usId, String prId){
        PreparedStatement stm = null;
        try (Connection con = DBcontext.getConnection()) {
            stm = con.prepareStatement(DELETE);
            stm.setString(1, usId);
            stm.setString(2, prId);
            stm.executeUpdate();
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }
    
    public ArrayList<Wishlist> getWishlistbyUser (String usId){
        ArrayList<Wishlist> wishlist = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GET);
                ptm.setString(1, usId);
                rs = ptm.executeQuery();
                while (rs.next()){
                    wishlist.add(new Wishlist(rs.getString(1), rs.getString(2)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return wishlist;
    }
}
