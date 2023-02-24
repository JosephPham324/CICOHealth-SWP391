/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.ExerciseLog;
import java.sql.SQLException;
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
        String query = "SELECT TOP 1 exerciseLogID\n"
                + "from [exerciseLog] \n"
                + "ORDER BY exerciseLogID DESC ";
        String id = null;
        String idPrefix = type + "LG";
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
        String date = util.Utility.getDateOrTime("date");
        String time = util.Utility.getDateOrTime("time");
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
}
