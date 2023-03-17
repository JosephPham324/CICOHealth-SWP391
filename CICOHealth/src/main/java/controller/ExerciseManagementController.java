/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.Exercise;
import bean.User;
import dao.ExerciseDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.Utility;

/**
 *
 * @author Admin
 */
public class ExerciseManagementController extends HttpServlet {

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
//        processRequest(request, response);
        request.setAttribute("exerciseList", new ExerciseDao().getAllExercises());
        request.getRequestDispatcher("/view/admin/ViewExercise.jsp").forward(request, response);
        return;

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
//        processRequest(request, response);
        String add = request.getParameter("btnAdd");
        if (add != null) {
            String exerciseName = request.getParameter("txtExerciseName");
            String exerciseType = request.getParameter("txtExerciseType");
            String exerciseDescription = request.getParameter("txtExerciseDescription");
            String calPHParam = request.getParameter("numCaloriePerHour");
            double caloriesPerHour = Double.parseDouble(calPHParam != null && calPHParam.isEmpty() ? calPHParam : "0");
            new ExerciseDao().insertExercise(exerciseType, new Exercise(null, exerciseName, exerciseDescription, caloriesPerHour));
            response.sendRedirect(Utility.appendStatus("/CICOHealth/admin/exercise-management", "success", "Added exercise successfully"));
        }
        String method = request.getParameter("_method");
        if (method != null) {
            switch (method) {
                case "PUT":
                    doPut(request, response);
                    break;
                case "DELETE":
                    doDelete(request, response);
                    break;
            }
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the parameters sent in the request
        String exerciseID = request.getParameter("txtExerciseID");
        String exerciseName = request.getParameter("txtExerciseName");
        String exerciseDescription = request.getParameter("txtExerciseDescription");
        String caloriePerHour = request.getParameter("numCaloriePerHour");

        // Create a new Exercise object with the parameters
        Exercise exercise = new Exercise(exerciseID, exerciseName, exerciseDescription, Double.parseDouble(caloriePerHour));

        // Create an instance of ExerciseDao and use it to update the exercise information in the database
        ExerciseDao exerciseDao = new ExerciseDao();
        exerciseDao.updateExercise(exercise);

        // Redirect to the exercise management page with a success message
        String redirectUrl = "/CICOHealth/admin/exercise-management";
        String message = "Exercise information updated successfully.";
        response.sendRedirect(Utility.appendStatus(redirectUrl, "success", message));
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String exerciseID = request.getParameter("exerciseid");
        new ExerciseDao().deleteExercise(exerciseID);
        response.sendRedirect("/CICOHealth/admin/exercise-management?delete=success");
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
