/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.Answer;
import bean.Exercise;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class AnswerDao extends BaseDao {

    // SQL queries
    private final String SELECT_ALL = "SELECT * FROM [answer]";
    private final String SELECT_BY_ID = "SELECT * FROM answer WHERE answerID = ?";
    private final String INSERT = "INSERT INTO answer(answerID, createdBy, questionTopic, questionContent,answerContent) VALUES (?, ?, ?, ?,?)";
    private final String DELETE = "DELETE FROM answer WHERE answerID  = ?";
    private final String SELECT_BY_TOPIC = "SELECT * FROM [answer] where questionTopic = ?";

    // connection to the database
    private Connection connection;

    public AnswerDao() {
        connection = new DBContext().getConnection();
    }

    // method to retrieve all answers from the database
    public List<Answer> getAllAnswers() {
        List<Answer> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String answerID = resultSet.getString("answerID");
                String createBy = resultSet.getString("createdBy");
                String questionTopic = resultSet.getString("questionTopic");
                String questionContent = resultSet.getString("questionContent");
                String answerContent = resultSet.getString("answerContent");
                Answer answer = new Answer(answerID, createBy, questionTopic, questionContent, answerContent);
                list.add(answer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Answer> getAnswersByTopic(String topic) {
        List<Answer> list = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement(SELECT_BY_TOPIC);
            preparedStatement.setString(1, topic);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String answerID = resultSet.getString("answerID");
                String createBy = resultSet.getString("createdBy");
                String questionTopic = resultSet.getString("questionTopic");
                String questionContent = resultSet.getString("questionContent");
                String answerContent = resultSet.getString("answerContent");
                Answer answer = new Answer(answerID, createBy, questionTopic, questionContent, answerContent);
                list.add(answer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    // method to insert a new answer into the database
    public void insertAnswer(Answer answer) {
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT);
            int index = 1;
            statement.setString(index++, createID());
            statement.setString(index++, answer.getCreateBy());
            statement.setString(index++, answer.getQuestionTopic());
            statement.setString(index++, answer.getQuestionContent());
            statement.setString(index++, answer.getAnswerContent());
            System.out.println("inserting");
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnections();
    }
    // method to update a Answer from the database

    public void updateAnswer(Answer answer) {
        PreparedStatement statement = null;
        System.out.println(answer.getQuestionTopic());
        try {
            String sql = "UPDATE [answer] \n"
                    + "SET createdBy = ?, questionTopic = ?, questionContent = ?, answerContent = ? WHERE answerID = ?";
            connection = new DBContext().getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, answer.getCreateBy());
            statement.setString(2, answer.getQuestionTopic());
            statement.setString(3, answer.getQuestionContent());
            statement.setString(4, answer.getAnswerContent());
            statement.setString(5, answer.getAnswerID());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnections();
        }
    }

    // method to delete a Answer from the database
    public void deleteAnswer(String questionID) throws SQLException {
        PreparedStatement statement = connection.prepareStatement(DELETE);
        statement.setString(1, questionID);
        statement.executeUpdate();
        closeConnections();
    }

    @Override
    public String createID() {
        //Query to get the latest ID
        String query = "SELECT TOP 1 answerID\n"
                + "from [answer] \n"
                + "ORDER BY answerID DESC";
        String id = null;
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record in the table
                //Generate new ID based on the record
                id = "ANSW" + String.format("%06d", Integer.parseInt(resultSet.getString("answerID").substring(4)) + 1);
            } else //If not return the lowest ID
            {
                id = "ANSW000001";
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

    public Answer getAnswerByID(String answerID) {
        Answer answer = null;
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_ID);
            statement.setString(1, answerID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String createBy = resultSet.getString("createdBy");
                String questionTopic = resultSet.getString("questionTopic");
                String questionContent = resultSet.getString("questionContent");
                String answerContent = resultSet.getString("answerContent");
                answer = new Answer(answerID, createBy, questionTopic, questionContent, answerContent);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return answer;
    }

}
