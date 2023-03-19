/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.ProgramInventory;
import dao.BaseDao;
import java.sql.SQLException;
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
    
}
