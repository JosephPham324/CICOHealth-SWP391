package dao;

import bean.MealLog;
import bean.MealLogItem;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
        String formattedTime = util.Utility.getCurrentDateOrTime("time");
        String formattedDate = util.Utility.getCurrentDateOrTime("date");
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
            preparedStatement.setString(index++, mealLog.getLogNote() != null ? mealLog.getLogNote() : "");
            // Execute the SQL statement to insert the meal log into the database
            preparedStatement.executeUpdate();
            // Insert the meal log items into the database
            new MealLogItemDao().insertMealLogItems(id, mealLog.getFoods());
        } finally {
            // Close the database connections
            closeConnections();
        }
    }

    /**
     * Inserts a new MealLog record into the database.
     *
     * @param mealLog The MealLog object to be inserted.
     * @throws SQLException if a database access error occurs.
     */
    public void createMealLog(MealLog mealLog, boolean forUpdate) throws SQLException {
        // Define the SQL query to insert the meal log into the database
        String query = "INSERT INTO mealLog (userID, mealLogID, mealLogName, logTime, logDate, logNote) VALUES (?, ?, ?, ?, ?, ?)";
        // Get the current date and time to use for the logTime and logDate fields

        String formattedTime = util.Utility.getCurrentDateOrTime("time");
        String formattedDate = util.Utility.getCurrentDateOrTime("date");

        if (forUpdate == true) {
            formattedTime = util.Utility.getDateOrTime(mealLog.getLogTime(), "TIME");
            formattedDate = util.Utility.getDateOrTime(mealLog.getLogTime(), "DATE");

        }
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
            preparedStatement.setString(index++, mealLog.getLogNote() != null ? mealLog.getLogNote() : "");
            // Execute the SQL statement to insert the meal log into the database
            preparedStatement.executeUpdate();
            // Insert the meal log items into the database
            new MealLogItemDao().insertMealLogItems(id, mealLog.getFoods());
        } finally {
            // Close the database connections
            closeConnections();
        }
    }

    public ArrayList<MealLog> getLogsOfDate(String userID, String date) throws SQLException {
        String query = "SELECT userID, mealLogID, mealLogName, logTime, logDate, logNote\n"
                + "FROM [mealLog]\n"
                + "WHERE userID = ? AND logDate = ?\n"
                + "ORDER BY logTime ASC";
        int index = 1;
        ArrayList<MealLog> result = new ArrayList<>();
        try {
            // Get a connection to the database and prepare the SQL statement
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(index++, userID);
            preparedStatement.setString(index++, date);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String mealLogID = resultSet.getString("mealLogID");
                String mealLogName = resultSet.getString("mealLogName");
                Date logTime = resultSet.getTime("logTime");
                String logNote = resultSet.getString("logNote");
                MealLog log = new MealLog(mealLogID, mealLogName, logTime, logTime, logNote);
                ArrayList<MealLogItem> logItems = new MealLogItemDao().getLogItems(mealLogID);
                log.setFoods(logItems);
                result.add(log);
            }
        } finally {
            // Close the database connections
            closeConnections();
        }
        return result;
    }

    public ArrayList<MealLog> getLogsOfDateRange(String userID, String startDate, String endDate) throws SQLException {
        String query = "SELECT userID, mealLogID, mealLogName, logTime, logDate, logNote\n"
                + "FROM [mealLog]\n"
                + "WHERE userID = ? AND logDate BETWEEN ? AND ?\n"
                + "ORDER BY logTime ASC";
        int index = 1;
        ArrayList<MealLog> result = new ArrayList<>();
        try {
            // Get a connection to the database and prepare the SQL statement
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(index++, userID);
            preparedStatement.setString(index++, startDate);
            preparedStatement.setString(index++, endDate);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String mealLogID = resultSet.getString("mealLogID");
                String mealLogName = resultSet.getString("mealLogName");
                Date logTime = resultSet.getTime("logTime");
                String logNote = resultSet.getString("logNote");
                MealLog log = new MealLog(mealLogID, mealLogName, logTime, logTime, logNote);
                ArrayList<MealLogItem> logItems = new MealLogItemDao().getLogItems(mealLogID);
                log.setFoods(logItems);
                result.add(log);
            }
        } finally {
            // Close the database connections
            closeConnections();
        }
        return result;
    }

    public void deleteMealLog(String mealLogID) throws SQLException {
        // Define the SQL query to insert the meal log into the database
        String query = "DELETE FROM [mealLog]\n"
                + "WHERE mealLogID = ?";
        // Generate a unique ID for the meal log
        int index = 1;
        try {
            // Get a connection to the database and prepare the SQL statement
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            // Set the values of the parameters in the SQL statement
            preparedStatement.setString(index++, mealLogID);
            // Execute the SQL statement to insert the meal log into the database
            preparedStatement.executeUpdate();
        } finally {
            // Close the database connections
            closeConnections();
        }
    }

    public static void main(String[] args) {
        try {
            ArrayList<MealLog> result = new MealLogDao().getLogsOfDate("USME000001", "2023-02-24");
            for (MealLog log : result) {
                System.out.println(log.toString());
            }
        } catch (SQLException ex) {
            Logger.getLogger(MealLogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
