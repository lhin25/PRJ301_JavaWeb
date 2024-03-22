package dal;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBcontext {
    public static Connection getConnection() throws Exception {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=Assignment_FA23;";
        String user = "sa", pw = "123";
        Connection con = DriverManager.getConnection(dbURL, user, pw);
        return con;
    }
    
    public static void main(String args[]) {
        try {
            Connection conn = getConnection();
            if (conn != null) {
                System.out.println("Connection successfully!");
            } else {
                System.err.println("Failed.");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
