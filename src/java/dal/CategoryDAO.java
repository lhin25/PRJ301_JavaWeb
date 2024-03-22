/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author hien
 */
public class CategoryDAO {
    private static final String CATEGORY = "Select * from [Category]";
    
    public ArrayList<Category> getCategory(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Category> allType = new ArrayList<>();
        try (Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(CATEGORY);
                rs = ptm.executeQuery();
                while (rs.next()){
                    allType.add(new Category(rs.getString(1), rs.getString(2), rs.getString(3)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return allType;
    }
}
