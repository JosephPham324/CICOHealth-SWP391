/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.Question;
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
 * @author vhqua
 */
public class QuestionDao extends BaseDao {

    // SQL queries
    private final String SELECT_ALL = "SELECT * FROM question";
    private final String SELECT_BY_ID = "SELECT * FROM question WHERE questionID = ?";
    private final String INSERT = "INSERT INTO question(questionID, submittedBy, questionTopic, questionContent) VALUES (?, ?, ?, ?)";
    private final String UPDATE = "UPDATE question SET submittedBy = ?, questionTopic = ?, questionContent = ? WHERE questionID = ?";
    private final String DELETE = "DELETE FROM question WHERE questionID = ?";

    // connection to the database
    private Connection connection;

    public QuestionDao() {
        connection = new DBContext().getConnection();
    }

    // method to retrieve all questions from the database
    public List<Question> getAllQuestions() {
        List<Question> questions = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String questionID = resultSet.getString("questionID");
                String submittedBy = resultSet.getString("submittedBy");
                String questionTopic = resultSet.getString("questionTopic");
                String questionContent = resultSet.getString("questionContent");
                Question question = new Question(questionID, submittedBy, questionTopic, questionContent);
                questions.add(question);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questions;
    }

    // method to retrieve a specific question by its ID from the database
    public Question getQuestionByID(String questionID) throws SQLException {
        PreparedStatement statement = connection.prepareStatement(SELECT_BY_ID);
        statement.setString(1, questionID);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            String submittedBy = resultSet.getString("submittedBy");
            String questionTopic = resultSet.getString("questionTopic");
            String questionContent = resultSet.getString("questionContent");
            return new Question(questionID, submittedBy, questionTopic, questionContent);
        }
        return null;
    }

    // method to insert a new question into the database
    public void insertQuestion(Question question) {
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT);
            int index = 1;
            statement.setString(index++, question.getQuestionID());
            statement.setString(index++, question.getSubmittedBy());
            statement.setString(index++, question.getQuestionTopic());
            statement.setString(index++, question.getQuestionContent());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnections();
    }

    // method to update an existing question in the database
    public void updateQuestion(Question question) throws SQLException {
        PreparedStatement statement = connection.prepareStatement(UPDATE);
        statement.setString(1, question.getSubmittedBy());
        statement.setString(2, question.getQuestionTopic());
        statement.setString(3, question.getQuestionContent());
        statement.setString(4, question.getQuestionID());
        statement.executeUpdate();
        closeConnections();
    }

    // method to delete a question from the database
    public void deleteQuestion(String questionID) throws SQLException {
        PreparedStatement statement = connection.prepareStatement(DELETE);
        statement.setString(1, questionID);
        statement.executeUpdate();
        closeConnections();
    }

    public int getQuestionCount() {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int count = 0;
        try {
            // prepare the SQL statement
            String sql = "SELECT COUNT(*) FROM question";
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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String createID(String type) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
