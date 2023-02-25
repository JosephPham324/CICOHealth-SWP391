package dao;

import bean.MealLog;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class MealLogDao extends BaseDao {

    @Override
    public String createID() {
        //Query to get the latest ID
        String query = "SELECT TOP 1 mealLogID\n"
                + "from [mealLog] \n"
                + "ORDER BY mealLogID DESC ";
        String id = null;
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record in the table
                //Generate new ID based on the record
                id = "MELG" + String.format("%06d", Integer.parseInt(resultSet.getString("mealLogID").substring(4)) + 1);
            } else {
                id = "MELG000001";
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
     * Inserts a new MealLog record into the database.
     *
     * @param mealLog The MealLog object to be inserted.
     * @throws SQLException if a database access error occurs.
     */
    public void createMealLog(MealLog mealLog) throws SQLException {
        // Define the SQL query to insert the meal log into the database
        String query = "INSERT INTO mealLog (userID, mealLogID, mealLogName, logTime, logDate, logNote) VALUES (?, ?, ?, ?, ?, ?)";
        // Get the current date and time to use for the logTime and logDate fields
        String formattedTime = util.Utility.getDateOrTime("time");
        String formattedDate = util.Utility.getDateOrTime("date");
        // Generate a unique ID for the meal log
        String id = this.createID();
        int index = 1;
        try {
            // Get a connection to the database and prepare the SQL statement
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            // Set the values of the parameters in the SQL statement
            preparedStatement.setString(index++, mealLog.getUserID());
            preparedStatement.setString(index++, id);
            preparedStatement.setString(index++, mealLog.getMealLogName());
            preparedStatement.setString(index++, formattedTime);
            preparedStatement.setString(index++, formattedDate);
            preparedStatement.setString(index++, mealLog.getLogNote()!=null?mealLog.getLogNote():"");
            // Execute the SQL statement to insert the meal log into the database
            preparedStatement.executeUpdate();
            // Insert the meal log items into the database
            new MealLogItemDao().insertMealLogItems(id, mealLog.getFoods());
        } finally {
            // Close the database connections
            closeConnections();
        }
    }
}