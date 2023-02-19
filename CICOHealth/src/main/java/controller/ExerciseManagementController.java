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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (!("AD").equalsIgnoreCase(user.getUserRole())) {
            response.sendRedirect("/CICOHealth");
            return;
        }
        
        String delete = request.getParameter("delete");
        String exerciseID = request.getParameter("exerciseid");
        if (delete == null) {
            request.setAttribute("exerciseList", new ExerciseDao().getAllExercises());
            request.getRequestDispatcher("/view/admin/ViewExercise.jsp").forward(request, response);
        } else {
            new ExerciseDao().deleteExercise(exerciseID);
            response.sendRedirect("/CICOHealth/admin/exercise-management");
        }

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
        String method = request.getParameter("_method");
        if (method!= null && method.equals("PUT")){
            doPut(request,response);
            return;
        }

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String exerciseID = request.getParameter("txtExerciseID");
        String exerciseName = request.getParameter("txtExerciseName");
        String exerciseDescription = request.getParameter("txtExerciseDescription");
        String caloriePerHour = request.getParameter("numCaloriePerHour");
        Exercise exercise = new Exercise(exerciseID,exerciseName,exerciseDescription,Double.parseDouble(caloriePerHour));
        ExerciseDao exerciseDao = new ExerciseDao();
        exerciseDao.updateExercise(exercise);
        response.sendRedirect("/CICOHealth/admin/exercise-management");
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
