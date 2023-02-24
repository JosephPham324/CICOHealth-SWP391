/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.Answer;
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
            statement.executeUpdate();
        } catch (SQLException ex) {
          Logger.getLogger(AnswerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
         closeConnections();
    }
    
    // method to delete a Answer from the database
    public void deleteAnswer(String questionID) throws SQLException {
        PreparedStatement statement = connection.prepareStatement(DELETE);
        statement.setString(1, questionID);
        statement.executeUpdate();
        closeConnections();
    }
    public int getAnswerCount() {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int count = 0;
        try {
            // prepare the SQL statement
            String sql = "SELECT COUNT(*) FROM answer";
            stmt = connection.prepareStatement(sql);
            // execute the query
            rs = stmt.executeQuery();
            // get the count from the result set
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeConnections();
        return count;

    }

    @Override
    public String createID() {
        // get the count of answers already in the database
        int answerCount = getAnswerCount();
        // generate the new answerID
        String answerID = "ANSW" + String.format("%05d", answerCount + 1);
        return answerID;
    }

    @Override
    public String createID(String type) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
