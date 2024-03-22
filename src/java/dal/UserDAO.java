package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import model.User;

public class UserDAO {

    private static final String LOGIN = "Select * from [User] where Mail=? and Password=?";
    private static final String SIGNUP = "Insert into [User] (UserID,UserName,Role,Password,Mail,Phone,SignUpDate) values (?,?,?,?,?,?,?)";
    private static final String CHECK_SIGNUP = "Select * from [User] where Phone=? or Mail=?";
    private static final String ROLE = "Select * from [User] where Role=?";
    private static final String UPDATE = "Update [User] set UserName=?, Mail=?, Phone=?, Address=? where UserID=?";
    private static final String CHECK_DUP = "Select * from [User] where Phone=? or Mail=? except Select * from [User] where UserID=?";

    public User checkLogin(String mail, String password) {
        User user = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(LOGIN);
                ptm.setString(1, mail);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    user = new User(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(8), LocalDate.parse(rs.getDate(7).toString()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public ArrayList<User> getCustomer() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<User> customer_list = new ArrayList<>();
        try ( Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(ROLE);
                ptm.setInt(1, 1);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    customer_list.add(new User(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), null, LocalDate.parse(rs.getDate(7).toString())));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return customer_list;
    }

    public User signupCustomer(String name, String pass, String mail, String phone) {
        ArrayList<User> cusList = getCustomer();
        PreparedStatement stm = null;
        String id = "";
        LocalDate date = null;
        try ( Connection con = DBcontext.getConnection()) {
            stm = con.prepareStatement(SIGNUP);
            id = "US" + (cusList.size() + 1);
            date = LocalDate.now();
            stm.setString(1, id);
            stm.setString(2, name);
            stm.setInt(3, 1);
            stm.setString(4, pass);
            stm.setString(5, mail);
            stm.setString(6, phone);
            stm.setDate(7, Date.valueOf(date));
            stm.executeUpdate();
            User user = new User(id, name, 1, pass, mail, phone, null, date);
            return user;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean isExist(String phone, String mail) {
        User us = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(CHECK_SIGNUP);
                ptm.setString(1, phone);
                ptm.setString(2, mail);
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
    
    public void updateUser(String id, String name, String mail, String phone, String address){
        PreparedStatement stm = null;
        try (Connection con = DBcontext.getConnection()){
            stm = con.prepareStatement(UPDATE);
            stm.setString(1, name);
            stm.setString(2, mail);
            stm.setString(3, phone);
            stm.setString(4, address);
            stm.setString(5, id);
            stm.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public boolean checkDuplicate (String phone, String mail, String id){
        User us = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBcontext.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(CHECK_DUP);
                ptm.setString(1, phone);
                ptm.setString(2, mail);
                ptm.setString(3, id);
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

    public static void main(String[] args) {
        UserDAO us = new UserDAO();
        User user = us.checkLogin("lhin165@gmail.com", "hhh");
        if (user != null) {
            System.out.println("hihi");
        }
    }
}
