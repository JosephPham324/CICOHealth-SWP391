/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public abstract class BaseDao {
    /**
     * Connection to database
     */
    protected Connection connection = null;

    /**
     * Move query from Netbeans to SQl
     */
    protected PreparedStatement preparedStatement = null;

    /**
     * Save query result
     */
    protected ResultSet resultSet = null;

    protected void closeConnections() {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                /* Ignored */
            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                /* Ignored */
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                /* Ignored */
            }
        }
    }
    public abstract String createID();
    public abstract String createID(String type);
}
