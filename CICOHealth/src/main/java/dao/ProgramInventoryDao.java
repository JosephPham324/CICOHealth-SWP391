/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.ProgramInventory;
import dao.BaseDao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sun.security.pkcs11.Secmod;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class ProgramInventoryDao extends BaseDao {

    @Override
    public String createID() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String createID(String type) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void insertProgramInventory(ProgramInventory inventory) throws SQLException {
        try {
            // Open connection to database
            connection = new DBContext().getConnection();

            // Prepare statement with insert query
            preparedStatement = connection.prepareStatement("INSERT INTO ProgramInventory (userID, programID) VALUES (?, ?)");

            // Set parameters for insert query
            preparedStatement.setString(1, inventory.getUserID());
            preparedStatement.setString(2, inventory.getProgramID());

            // Execute insert query
            preparedStatement.executeUpdate();
        } finally {
            // Close connections to database
            closeConnections();
        }
    }

    public ProgramInventory getInventory(String userID, String programID) throws SQLException {
        String QUERY_SELECT = "SELECT * FROM [ProgramInventory] WHERE userID = ? AND programID = ?";
        // Open connection to database
        connection = new DBContext().getConnection();

        preparedStatement = connection.prepareStatement(QUERY_SELECT);
        preparedStatement.setString(1, userID);
        preparedStatement.setString(2, programID);
        resultSet = preparedStatement.executeQuery();
        ProgramInventory inventory = null;
        if (resultSet.next()) {
            inventory = new ProgramInventory(resultSet.getString("programID"),resultSet.getString("userID"));
        }
        closeConnections();
        return inventory;
    }

    public void removeInventory(String userID, String programID) throws SQLException {
        System.out.println(userID);
        String QUERY_DELETE = "DELETE FROM [ProgramInventory] WHERE userID = ? AND programID = ?";
// Open connection to database
        connection = new DBContext().getConnection();
        
        preparedStatement = connection.prepareStatement(QUERY_DELETE);
        preparedStatement.setString(1, userID);
        preparedStatement.setString(2, programID);
        preparedStatement.executeUpdate();
        closeConnections();
    }

    public List<String> getUserInventory(String userID) throws SQLException {
        String QUERY_SELECT = "SELECT * FROM [ProgramInventory] WHERE USERID = ?";
        // Open connection to database
        connection = new DBContext().getConnection();

        preparedStatement = connection.prepareStatement(QUERY_SELECT);

        preparedStatement.setString(1, userID);
        resultSet = preparedStatement.executeQuery();
        List result = new ArrayList();
        while (resultSet.next()) {
            result.add(resultSet.getString("programID"));
        }
        closeConnections();
        return result;
    }

}
