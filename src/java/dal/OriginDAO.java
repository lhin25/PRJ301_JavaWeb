/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Origin;

/**
 *
 * @author hien
 */
public class OriginDAO {
    private static final String ORIGIN = "Select * from [Origin]";
    
    public ArrayList<Origin> getAllOrigin(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Origin> orgList = new ArrayList<>();
        try (Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(ORIGIN);
                rs = ptm.executeQuery();
                while (rs.next()){
                    orgList.add(new Origin(rs.getString(1), rs.getString(2)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orgList;
    }
    
    public Origin selectOrgin(String id){
        ArrayList<Origin> origins = getAllOrigin();
        for (Origin o : origins) {
            if (o.getOrgId().equals(id))
                return o;
        }
        return null;
    }
}
