/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.MealLogItem;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class MealLogItemDao extends BaseDao {

    @Override
    public String createID() {
        //Query to get the latest ID
        String query = "SELECT TOP 1 itemID\n"
                + "from [mealLogItem] \n"
                + "ORDER BY itemID DESC ";
        String id = null;
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record in the table
                //Generate new ID based on the record
                id = "MEIT" + String.format("%06d", Integer.parseInt(resultSet.getString("itemID").substring(4)) + 1);
            } else {
                id = "MEIT000001";
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnections();
        }
        return id;
    }

    @Override
    public String createID(String type) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    /**
     * insert a list of MealLogItem objects into the database. Here's a breakdown of the code
     * @param mealID
     * @param items 
     */
    public void insertMealLogItems(String mealID, ArrayList<MealLogItem> items) {
        //SQL query string to insert a MealLogItem into the database.
        String query = "INSERT INTO [mealLogItem](mealLogID,itemID,itemName,"
                + "caloriePerServing, proteinPerServing,fatPerServing,carbPerServing, "
                + "servingWeight, actualWeight)"
                + " VALUES (?,?,?,?,?,?,?,?,?)";
        //Initializes an integer variable with the initial number to use when creating item IDs
        int initialNum = Integer.parseInt(createID().substring(4))-1;
        for (MealLogItem item : items) {
            //Iterates through the list of MealLogItem objects and assigns a unique ID to each object.
            item.setItemID("MEIT" + String.format("%06d", ++initialNum));
        }
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);

            for (MealLogItem item : items) {
                int index = 1;
                preparedStatement.setString(index++, mealID);
                preparedStatement.setString(index++, item.getItemID());
                preparedStatement.setString(index++, item.getFoodName());
                preparedStatement.setString(index++, item.getCalories() + "");
                preparedStatement.setString(index++, item.getProtein() + "");
                preparedStatement.setString(index++, item.getFat() + "");
                preparedStatement.setString(index++, item.getCarbs() + "");
                preparedStatement.setString(index++, item.getServingWeight() + "");
                preparedStatement.setString(index++, item.getActualWeight() + "");
                preparedStatement.addBatch();
            }
            preparedStatement.executeBatch();
        } catch (SQLException ex) {
            Logger.getLogger(MealLogItemDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnections();
        }
    }
    
    public ArrayList<MealLogItem> getLogItems(String mealLogID) throws SQLException{
        String query = "SELECT * FROM [mealLogItem] where mealLogID = ?";
        int index = 1;
        ArrayList<MealLogItem> result = new ArrayList<>();
        try{
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(index++, mealLogID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                //String itemID, String itemName, double servingWeight, 
                //double proteinPerServing, double fatPerServing, double carbPerServing, double caloriePerServing, double actualWeight
                MealLogItem item = new MealLogItem(
                        resultSet.getString("itemID"),
                        resultSet.getString("itemName"),
                        resultSet.getDouble("servingWeight"),
                        resultSet.getDouble("proteinPerServing"),
                        resultSet.getDouble("fatPerServing"),
                        resultSet.getDouble("carbPerServing"),
                        resultSet.getDouble("caloriePerServing"),
                        resultSet.getDouble("actualWeight")
                );
                result.add(item);
            }
        } finally{
            closeConnections();
        }
        return result;
    }
}
