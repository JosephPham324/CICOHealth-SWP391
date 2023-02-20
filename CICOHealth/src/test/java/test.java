
import bean.HealthInfo;
import bean.Login;
import bean.Question;
import bean.User;
import dao.HealthInfoDao;
import dao.LoginDao;
import dao.QuestionDao;
import dao.UserDao;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.AuthenticationLogic;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author vhqua
 */
public class test {

    public static void main(String[] args) {
       
        // create a new Question object with the values to be inserted
        Question newQuestion = new Question("Q0001", "", "Java Programming", "How to use the insertQuestion method in QuestionDAO class?");

// create a new instance of the QuestionDAO class and pass in a connection to the database
        QuestionDao questionDAO = new QuestionDao();

        try {
            // call the insertQuestion method on the DAO object to insert the new question into the database
            questionDAO.insertQuestion(newQuestion);
        } catch (SQLException ex) {
            Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
