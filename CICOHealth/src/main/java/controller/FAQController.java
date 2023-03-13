/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.Answer;
import bean.Question;
import bean.User;
import com.google.gson.Gson;
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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashSet;
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
            request.getRequestDispatcher("/view/general/faq/FAQQuestions.jsp").forward(request, response);
            return;
        }
        if (URI.endsWith("/answers")) {
            request.getRequestDispatcher("/view/general/faq/FAQ.jsp").forward(request, response);
            return;
        }
        if (URI.endsWith("/data")) {
            String topic = request.getParameter("topic");
            System.out.println(topic);
            String responseData = null;
            if (!getFaqTopics().contains(topic)) {
                printJSONResponse(response, "{\"data\":[]}");
                return;
            }
            Gson gson = new Gson();
            if (URI.endsWith("/questions/data")) {
                QuestionDao qDao = new QuestionDao();
                ArrayList<Question> queryRes;
                System.out.println(topic);
                if (topic.equalsIgnoreCase("All")) {
                    queryRes = (ArrayList) qDao.getAllQuestions();
                } else {
                    queryRes = (ArrayList) qDao.getQuestionsByTopic("topic");
                }
                responseData = "{\"questions\":" + gson.toJson(queryRes) + "}";
            }
            if (URI.endsWith("/answers/data")) {
                AnswerDao aDao = new AnswerDao();
                ArrayList<Answer> queryRes;
                if (topic.equalsIgnoreCase("All")) {
                    queryRes = (ArrayList) aDao.getAllAnswers();
                } else {
                    queryRes = (ArrayList) aDao.getAnswersByTopic(topic);
                }
                String userRole = "";
                if (request.getSession().getAttribute("user")!=null){
                    userRole = ",\"userRole\":\""+((User)request.getSession().getAttribute("user")).getUserRole()+"\"";
                }
                responseData = "{\"answers\":" + gson.toJson(queryRes) + userRole + "}";
            }
            printJSONResponse(response, responseData);
            return;
        }
        response.sendRedirect("/CICOHealth/faq/answers");
    }

    private HashSet<String> getFaqTopics() {
        HashSet<String> result = new HashSet();
        result.add("All");
        result.add("General");
        result.add("Logging");
        result.add("Statistics");
        result.add("Terminologies");
        return result;
    }

    private void printJSONResponse(HttpServletResponse response, String responseData) throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(responseData);
        out.flush();
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
        if (method != null && method.equalsIgnoreCase("Delete")) {
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
                response.sendRedirect("/CICOHealth/faq/questions?create=sucess");
            }
        } else {
            String submittedBy = request.getParameter("submittedBy");
            String questionTopic = request.getParameter("questionTopic");
            String questionContent = request.getParameter("questionContent");
            // generate a new questionID
            String questionID = new QuestionDao().createID();
            // create a new Question object
            Question question = new Question(questionID, submittedBy, questionTopic, questionContent);
            // insert the new question into the database
            new QuestionDao().insertQuestion(question);
            // redirect the user to a confirmation page
            response.sendRedirect("/CICOHealth/faq/answers?submit=success");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String URI = request.getRequestURI();
        if (URI.startsWith("/CICOHealth/faq/questions")) {
            try {

                String questionID = request.getParameter("questionID");
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
                String answerID = request.getParameter("answerID");
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
        String questionTopic = request.getParameter("topic");
        String questionContent = request.getParameter("questionContent");
        String answerContent = request.getParameter("answerContent");
        Answer answer = new Answer(answerID, createdBy, questionTopic, questionContent, answerContent);
                System.out.println(questionTopic);
                System.out.println(answerID);
                System.out.println(answerContent);
                System.out.println(questionTopic);
                System.out.println(questionContent);
        System.out.println(answer.getQuestionContent());
        new AnswerDao().updateAnswer(answer);
        response.sendRedirect("/CICOHealth/faq/answers?updateid=" + answerID);
        return;
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
