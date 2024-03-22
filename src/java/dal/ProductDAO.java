/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author hien
 */
public class ProductDAO {

    private static final String PRODUCT = "Select * from [Product]";
    private static final String PRODUCT_BY_TYPE = "Select * from [Product] where ProductType=?";
    private static final String PRODUCT_BY_ORG = "Select * from [Product] where ProductOrg=?";
    private static final String INSERT = "Insert into [Product] (ProductID,ProductName,ProductImg,ProductType,ProductOrg,Price,Quantity,Description) values (?,?,?,?,?,?,?,?)";
    private static final String TOP9 = "Select top 9 * from [Product]";
    private static final String DELETE = "Delete from [Product] where ProductID=?";
    private static final String UPDATE = "Update [Product] set ProductName=?, ProductImg=?, ProductType=?, ProductOrg=?, Price=?, Quantity=?, Description=? where ProductID=?";
    private static final String UP_QT = "Update [Product] set Quantity=? where ProductID=?";
    private static final String CHECK_NEW = "Select * from [Product] where ProductID=?";

    public ArrayList<Product> getAllProduct() {

        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Product> allProc = new ArrayList<>();
        try ( Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Product p = new Product();
                    p.setPrId(rs.getString(1));
                    p.setPrName(rs.getString(2));
                    p.setPrImg(rs.getString(3));
                    p.setPrOrg(rs.getString(5));
                    p.setPrType(rs.getString(4));
                    p.setQuantity(rs.getInt(7));
                    p.setPrice(rs.getDouble(6));
                    p.setDescription(rs.getString(8));
                    allProc.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return allProc;
    }

    public ArrayList<Product> getProductTop9() {
        ArrayList<Product> top9Proc = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBcontext.getConnection()) {
            ptm = con.prepareStatement(TOP9);
            rs = ptm.executeQuery();
            while (rs.next()) {
                top9Proc.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return top9Proc;
    }

    public ArrayList<Product> getProductbyType(String type) {
        ArrayList<Product> proc_by_type = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(PRODUCT_BY_TYPE);
                ptm.setString(1, type);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    proc_by_type.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7), rs.getString(8)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return proc_by_type;
    }

    public ArrayList<Product> getProductbyOrigin(String org) {
        ArrayList<Product> proc_by_org = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(PRODUCT_BY_ORG);
                ptm.setString(1, org);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    proc_by_org.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7), rs.getString(8)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return proc_by_org;
        
    }
    
    public boolean isExist(String pid){
        Product pr = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(CHECK_NEW);
                ptm.setString(1, pid);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void insertProduct(String id, String name, String img, String type, String org, int quantity, double price, String description) {
        PreparedStatement stm = null;
        try ( Connection con = DBcontext.getConnection()) {
            stm = con.prepareStatement(INSERT);
            stm.setString(1, id);
            stm.setString(2, name);
            stm.setString(3, img);
            stm.setString(4, type);
            stm.setString(5, org);
            stm.setInt(7, quantity);
            stm.setDouble(6, price);
            stm.setString(8, description);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void deleteProduct(String id) {
        PreparedStatement stm = null;
        try ( Connection con = DBcontext.getConnection()) {
            stm = con.prepareStatement(DELETE);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void updateProduct(String id, String name, String img, String type, String org, double price, int quantity, String description) {
        PreparedStatement stm = null;
        try ( Connection con = DBcontext.getConnection()) {
            stm = con.prepareStatement(UPDATE);
            stm.setString(8, id);
            stm.setString(1, name);
            stm.setString(2, img);
            stm.setString(3, type);
            stm.setString(4, org);
            stm.setDouble(5, price);
            stm.setInt(6, quantity);
            stm.setString(7, description);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void updateQuantity(String id, int quantity) {
        PreparedStatement stm = null;
        try ( Connection con = DBcontext.getConnection()) {
            stm = con.prepareStatement(UP_QT);
            stm.setString(2, id);
            stm.setInt(1, quantity);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Product selectProduct(String id) {
        ArrayList<Product> products = getAllProduct();
        for (Product p : products) {
            if (p.getPrId().equals(id)) {
                return p;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDAO da = new ProductDAO();
        Product p = da.selectProduct("GM-FG1");
        System.out.print(p.getPrice());
    }
}
