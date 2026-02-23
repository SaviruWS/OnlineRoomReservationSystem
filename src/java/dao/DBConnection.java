package dao;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static Connection connection;
    private DBConnection(){}
    public static Connection getConnection() {
        try {
            if (connection == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/reservation",
                        "root",
                        ""
                );
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return connection;
    }
}