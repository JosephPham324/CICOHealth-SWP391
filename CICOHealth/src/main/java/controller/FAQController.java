/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.Question;
import dao.QuestionDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

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
        if (URI.endsWith("/admin")) {
            String type = request.getParameter("type");
            switch (type) {
                case "view":
                    List<Question> listQuestion = new QuestionDao().getAllQuestions();
                    request.setAttribute("listQuestion", listQuestion);
                    request.getRequestDispatcher("/view/admin/ViewQuestion.jsp").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        }

        request.getRequestDispatcher("/view/general/ViewFAQ.jsp").forward(request, response);
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
        response.sendRedirect("/CICOHealth/faq");
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
