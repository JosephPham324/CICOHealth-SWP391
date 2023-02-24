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
        if (!type.toUpperCase().matches("CA|RE")) {
            //Return null if type isn't allowed
            return null;
        }
        //Query to get the latest ID
        String idPrefix = "EX"  + type;

        String query = "SELECT TOP 1 exerciseID\n"
                + "from [exercise] \n"
                + "WHERE exerciseID LIKE '" + idPrefix + "'+'%'\n"
                + "ORDER BY exerciseID DESC";
        String id = null;
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record in the table
                //Generate new ID based on the record
                id = idPrefix + String.format("%06d", Integer.parseInt(resultSet.getString("exerciseID").substring(4)) + 1);
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

    public void deleteExercise(String exerciseID) {
        try {
            String sql = "DELETE FROM exercise WHERE EXERCISEID = ?";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, exerciseID);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnections();
        }
    }

    public void updateExercise(Exercise exercise) {
        try {
            String sql = "UPDATE [exercise] SET exerciseName = ?, exerciseDescription = ?, caloriesPerHour = ? "
                    + "WHERE exerciseID = ?";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            int index = 1;
            preparedStatement.setString(index++,exercise.getExerciseName());
            preparedStatement.setString(index++,exercise.getExerciseDescription());
            preparedStatement.setString(index++,exercise.getCaloriesPerHour()+"");
            preparedStatement.setString(index++,exercise.getExerciseID());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnections();
        }
        closeConnections();
    }

    public List getExerciseByName(String name) throws SQLException {
        try {
            String query = "SELECT *\n"
                    + "FROM [exercise]\n"
                    + "WHERE exerciseName like '%' + ? + '%'";
            Exercise exercise = null;
            List exerciseList = new LinkedList();

            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
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

    public void insertExercise(String type, Exercise exercise) {
        String query = "INSERT INTO EXERCISE(EXERCISEID, EXERCISENAME, EXERCISEDESCRIPTION, CALORIESPERHOUR)\n"
                + "VALUES(?,?,?,?)";
        String id = createID(type);
        connection = new DBContext().getConnection();
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, exercise.getExerciseName());
            preparedStatement.setString(3, exercise.getExerciseDescription());
            preparedStatement.setDouble(4, exercise.getCaloriesPerHour());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnections();
    }
}
