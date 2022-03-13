package kr.ac.inha.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {

    private static Connection connection;

    private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";

    private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";

    private static final String ID = "INHA_INP";

    private static final String PASSWORD = "INHA_INP";

    public static Connection getConnection() {
        if (connection == null)
            return getNewConnection();

        return connection;
    }

    private static Connection getNewConnection() {
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL, ID, PASSWORD);
        } catch(Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}
