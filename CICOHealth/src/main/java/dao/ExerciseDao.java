/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.Exercise;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class ExerciseDao extends BaseDao {

    @Override
    public String createID() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String createID(String type) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List getAllExercises() {
        try {
            String query = "SELECT *\n"
                    + "FROM [exercise]";
            Exercise exercise = null;
            List exerciseList = new LinkedList();

            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                exercise = new Exercise(resultSet.getString("exerciseID"),
                        resultSet.getString("exerciseName"),
                        resultSet.getString("exerciseDescription"),
                        resultSet.getDouble("caloriesPerHour"));
                exerciseList.add(exercise);
            }
            return exerciseList;
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnections();
        return null;

    }

<<<<<<< Updated upstream
    public void deleteExercise(String exerciseID) {
=======
    /**
     * Get Exercise By Name
     *
     * @param name name of exercise
     * @return ExerciseType
     * @throws SQLException Exception of SQL
     */
    public List getExerciseByName(String name) throws SQLException {
        try {
            String query = "SELECT *\n"
                    + "FROM [exercise]\n"
                    + "WHERE exerciseName like ‘%’ + ? + ‘%’";
            Exercise exercise = null;
            List exerciseList = new LinkedList();

            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                exercise = new Exercise(resultSet.getString("exerciseID"),
                        resultSet.getString("exerciseName"),
                        resultSet.getString("exerciseDescription"),
                        resultSet.getDouble("caloriesPerHour"));
                exerciseList.add(exercise);
            }
            return exerciseList;
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnections();
        return null;
    }

    public void insertExercise(Exercise exercise) {
        String query = "INSERT INTO EXERCISE\n"
                + "VALUES(?,?,?,?)";
        connection = new DBContext().getConnection();
>>>>>>> Stashed changes
        try {
            String sql = "DELETE FROM exercise WHERE EXERCISEID = ?";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, exerciseID);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnections();

    }
}
