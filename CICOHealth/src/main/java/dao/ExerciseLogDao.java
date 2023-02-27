/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.ExerciseLog;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class ExerciseLogDao extends BaseDao {

    @Override
    public String createID() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String createID(String type) {
        if (!type.toUpperCase().matches("CA|RE")) {
            //Return null if type isn't allowed
            return null;
        }
        //Query to get the latest ID
        String idPrefix = type + "LG";

        String query = "SELECT TOP 1 exerciseLogID\n"
                + "from [exerciseLog] \n"
                + "WHERE exerciseLogID LIKE '" + idPrefix + "'+'%'\n"
                + "ORDER BY exerciseLogID DESC";
        String id = null;
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record in the table
                //Generate new ID based on the record
                id = idPrefix + String.format("%06d", Integer.parseInt(resultSet.getString("exerciseLogID").substring(4)) + 1);
            } else {
                id = idPrefix + "000001";
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnections();
        }
        return id;
    }

    public void createLog(ExerciseLog log) throws SQLException {

        String query = "INSERT INTO [exerciseLog] (userID, exerciseLogID, exerciseID, logTime, logDate,[set], rep, weight, timeSpent, logNote)\n"
                + "VALUES(?,?,?,?,?,?,?,?,?,?)";
        String date = util.Utility.getCurrentDateOrTime("date");
        String time = util.Utility.getCurrentDateOrTime("time");
        String id = createID(log.getExerciseType());
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        int index = 1;
        preparedStatement.setString(index++, "USME000001");
        preparedStatement.setString(index++, id);
        preparedStatement.setString(index++, log.getExerciseID());
        preparedStatement.setString(index++, time);
        preparedStatement.setString(index++, date);
        preparedStatement.setInt(index++, log.getSet() == null ? 0 : log.getSet());
        preparedStatement.setString(index++, log.getRep());
        preparedStatement.setString(index++, log.getWeight());
        preparedStatement.setInt(index++, log.getTimeSpent() == null ? 0 : log.getTimeSpent());
        preparedStatement.setString(index++, log.getLogNote());
        preparedStatement.executeUpdate();
        closeConnections();
    }

    public ArrayList<ExerciseLog> getLogsOfDate(String userID, String date, String type) throws SQLException {
        if (!type.matches("CA|RE")) {
            return null;
        }
        String query = "SELECT *\n"
                + "FROM [exerciseLog]\n"
                + "WHERE userID = ? AND logDate = ?\n"
                + "AND exerciseLogID like '" + type + "LG' + '%'";
        int index = 1;
        ArrayList<ExerciseLog> result = new ArrayList<>();
        try {
            // Get a connection to the database and prepare the SQL statement
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(index++, userID);
            preparedStatement.setString(index++, date);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ExerciseLog log = new ExerciseLog(resultSet.getString("exerciseLogID"), resultSet.getTime("logTime"), resultSet.getDate("logDate"));
                log.setExercise(new ExerciseDao().getExerciseByID(resultSet.getString("exerciseID")));
                log.setSet(resultSet.getInt("set"));
                log.setRep(resultSet.getString("rep"));
                log.setWeight(resultSet.getString("weight"));
                log.setTimeSpent(resultSet.getInt("timeSpent"));
                log.setLogNote(resultSet.getString("logNote"));
                result.add(log);
            }
        } finally {
            // Close the database connections
            closeConnections();
        }
        return result;
    }

    public void deleteExerciseLog(String exerciseLogID) throws SQLException {
        // Define the SQL query to insert the exercise log into the database
        String query = "DELETE FROM [exerciseLog]\n"
                + "WHERE exerciseLogID = ?";
        // Generate a unique ID for the exercise log
        int index = 1;
        try {
            // Get a connection to the database and prepare the SQL statement
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            // Set the values of the parameters in the SQL statement
            preparedStatement.setString(index++, exerciseLogID);
            // Execute the SQL statement to insert the exercise log into the database
            preparedStatement.executeUpdate();
        } finally {
            // Close the database connections
            closeConnections();
        }
    }

    public ArrayList<ExerciseLog> getLogsOfDateRange(String userID, String type, String startDate, String endDate) throws SQLException {
        if (!type.matches("CA|RE")) {
            return null;
        }
        String query = "SELECT *\n"
                + "FROM [exerciseLog]\n"
                + "WHERE userID = ? AND logDate BETWEEN ? AND ?\n"
                + "AND exerciseLogID like '" + type + "LG' + '%'";
        System.out.println(userID);
        System.out.println(type);
        System.out.println(startDate);
        System.out.println(endDate);
        System.out.println(query);
        int index = 1;
        ArrayList<ExerciseLog> result = new ArrayList<>();
        try {
            // Get a connection to the database and prepare the SQL statement
            System.out.println("here");

            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(index++, userID);
            preparedStatement.setString(index++, startDate);
            preparedStatement.setString(index++, endDate);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                System.out.println("here");
                ExerciseLog log = new ExerciseLog(resultSet.getString("exerciseLogID"), resultSet.getTime("logTime"), resultSet.getDate("logDate"));
                log.setExercise(new ExerciseDao().getExerciseByID(resultSet.getString("exerciseID")));
                log.setSet(resultSet.getInt("set"));
                log.setRep(resultSet.getString("rep"));
                log.setWeight(resultSet.getString("weight"));
                log.setTimeSpent(resultSet.getInt("timeSpent"));
                log.setLogNote(resultSet.getString("logNote"));
                result.add(log);
            }
        } finally {
            // Close the database connections
            closeConnections();
        }
        return result;
    }

    public static void main(String[] args) {
        try {
            System.out.println(new ExerciseLogDao().getLogsOfDate("USME000001", "2023-02-26", "CA"));
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseLogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
