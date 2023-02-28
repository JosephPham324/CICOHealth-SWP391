/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.Answer;
import bean.Question;
import bean.User;
import dao.AnswerDao;
import dao.QuestionDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vhqua
 */
public class FAQController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String URI = request.getRequestURI();
        if (URI.endsWith("/questions")) {
            request.getRequestDispatcher("/view/general/FAQQuestions.jsp").forward(request, response);
            return;
        }
        if (URI.endsWith("data")){
            if (URI.matches(".*/faq/answers")){
                
            }
        }
        request.getRequestDispatcher("/view/general/FAQ.jsp").forward(request, response);
    }
    
    private ArrayList<String> getFaqTopics(){
        ArrayList<String> result = new ArrayList();
        result.add("General");
        result.add("Logging");
        result.add("Statistics");
        result.add("Terminologies");
        return result;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("_method");
        if (method != null && method.equals("Delete")) {
            doDelete(request, response);
            return;
        } else if (method != null && method.equalsIgnoreCase("put")) {
            doPut(request, response);
            return;
        }
        String URI = request.getRequestURI();
        if (URI.endsWith("/answers")) {
            String questionTopic = request.getParameter("questionTopic");
            String questionContent = request.getParameter("questionContent");
            String answerContent = request.getParameter("answerContent");
            AnswerDao answerDao = new AnswerDao();
            // generate a new answerID
            String answerID = answerDao.createID();
            // get session
            HttpSession session = request.getSession();
            if (null == session.getAttribute("user")) {
                //if session not exists ,redirect to  login
                response.sendRedirect("/CICOHealth/login");
            } else {
                //exists => get session 
                User user = (User) session.getAttribute("user");
                // insert the new answer into the database
                new AnswerDao().insertAnswer(new Answer(answerID, user.getUserID(), questionTopic, questionContent, answerContent));
                response.sendRedirect("/CICOHealth/faq/answers?create=sucess");
            }
        } else {
            String submittedBy = request.getParameter("submittedBy");
            String questionTopic = request.getParameter("questionTopic");
            String questionContent = request.getParameter("questionContent");
            // generate a new questionID
            String questionID = generateQuestionID();
            // create a new Question object
            Question question = new Question(questionID, submittedBy, questionTopic, questionContent);
            // insert the new question into the database
            new QuestionDao().insertQuestion(question);
            // redirect the user to a confirmation page
            response.sendRedirect("/CICOHealth/faq?submit=success");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String URI = request.getRequestURI();
        if (URI.startsWith("/CICOHealth/faq/questions")) {
            try {

                String questionID = request.getParameter("id_question");
                QuestionDao questionDao = new QuestionDao();
                questionDao.deleteQuestion(questionID);
                response.sendRedirect("/CICOHealth/faq/questions?delete=success");
            } catch (SQLException ex) {
                Logger.getLogger(FAQController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("/CICOHealth/faq/questions?delete=failure");
            }
        } else if (URI.startsWith("/CICOHealth/faq/answers")) {
            try {
                // redirect the user to a confirmation page
                String answerID = request.getParameter("Id_answer");
                // generate a new answerID
                AnswerDao answerDao = new AnswerDao();
                // create a new Answer object
                answerDao.deleteAnswer(answerID);
                // delete Answer into the database
                response.sendRedirect("/CICOHealth/faq/answers?delete=success");
            } catch (Exception e) {
                response.sendRedirect("/CICOHealth/faq/answers?delete=failure");
            }
        }

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String answerID = request.getParameter("answerID");
        String createdBy = request.getParameter("createdBy");
        String questionTopic = request.getParameter("questionTopic");
        String questionContent = request.getParameter("questionContent");
        String answerContent = request.getParameter("answerContent");
        new AnswerDao().updateAnswer(new Answer(answerID, createdBy, questionTopic, questionContent, answerContent));
        response.sendRedirect("/CICOHealth/faq/answers?updateid=" + answerID);
        return;
    }

    public String generateQuestionID() {
        // get the count of questions already in the database
        int questionCount = new QuestionDao().getQuestionCount();
        // generate the new questionID
        String questionID = "Q" + String.format("%05d", questionCount + 1);
        return questionID;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
