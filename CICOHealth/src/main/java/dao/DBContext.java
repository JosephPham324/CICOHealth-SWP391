package dao;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 */
public class DBContext {

    private static final String DATABASE_PREFIX = "jdbc:sqlserver://localhost:1433;databaseName=Nutrition [sa on SA]";
    private static final String DATABASE_PORT = "1433";
    private static final String DATABASE_NAME = "Nutrition";
    private final String instance = "";
    private static final String USER = "sa";
    private static final String PASSWORD = "123456";

    /**
     * Connect to database
     *
     * @return object Connection
     */
    public Connection getConnection() {
        Connection conn = null;
        String dbURL = DATABASE_PREFIX + ":" + DATABASE_PORT + "\\" + instance + ";" + "databaseName=" + DATABASE_NAME;
        if (instance == null || instance.trim().isEmpty()) {
            dbURL = DATABASE_PREFIX + ":" + DATABASE_PORT + ";" + "databaseName=" + DATABASE_NAME;
        }
        try {
            DriverManager.registerDriver(new SQLServerDriver());
            conn = DriverManager.getConnection(dbURL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
