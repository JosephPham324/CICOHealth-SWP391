/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.ExerciseLog;
import bean.MealLog;
import bean.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.ExerciseLogDao;
import dao.HealthInfoDao;
import dao.MealLogDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class StatisticsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StatisticsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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

        if (URI.endsWith("/data")) {
            String responseData;
            Object user = request.getSession().getAttribute("user");
            String userID = ((User)user).getUserID();
            String startDate = request.getParameter("start");
            String endDate = request.getParameter("end");
            Gson gson = new Gson();
            //Cardio exercise stats
            if (URI.matches(".*/statistics/exercise/cardio(/.*)*")) {
                try {
                    ArrayList<ExerciseLog> queryResult = new ExerciseLogDao().getLogsOfDateRange(userID, "CA", startDate, endDate);
                    responseData = "{\"logs\":" + gson.toJson(queryResult) + "}";
                    printResponseJSON(response, responseData);
                    return;
                } catch (SQLException | IOException ex) {
                    Logger.getLogger(ExerciseLogController.class.getName()).log(Level.SEVERE, null, ex);
                    printResponseJSON(response, defaultResponseData());
                }
            }

            //Resistance exercise stats
            if (URI.matches(".*/statistics/exercise/resistance(/.*)*")) {
                try {
                    ArrayList<ExerciseLog> queryResult = new ExerciseLogDao().getLogsOfDateRange(userID, "RE", startDate, endDate);
                    responseData = "{\"logs\":" + gson.toJson(queryResult) + "}";
                    printResponseJSON(response, responseData);
                    return;
                } catch (SQLException | IOException ex) {
                    Logger.getLogger(ExerciseLogController.class.getName()).log(Level.SEVERE, null, ex);
                    printResponseJSON(response, defaultResponseData());
                }
            }

            //Nutrition stats (meal and cardio)
            if (URI.matches(".*/statistics/nutrition(/.*)*")) {
                try {
                    ArrayList<ExerciseLog> queryExercise = new ExerciseLogDao().getLogsOfDateRange(userID, "CA", startDate, endDate);
                    ArrayList<MealLog> queryMeal = new MealLogDao().getLogsOfDateRange(userID, startDate, endDate);
                    gson = new GsonBuilder()
                            .excludeFieldsWithoutExposeAnnotation()
                            .create();
                    responseData = "{\"cardioLogs\":" + gson.toJson(queryExercise) + ","
                            + "\"mealLogs\":" + gson.toJson(queryMeal)
                            + "}";
                    printResponseJSON(response, responseData);
                    return;
                } catch (SQLException | IOException ex) {
                    Logger.getLogger(ExerciseLogController.class.getName()).log(Level.SEVERE, null, ex);
                    printResponseJSON(response, defaultResponseData());
                }
            }
            
             //healthInfo exercise stats
            if (URI.matches(".*/statistics/health-info(/.*)*")) {
                    responseData = new HealthInfoDao().getAverageHealthInfo(startDate, endDate, userID);
                    printResponseJSON(response, responseData);
                    return;
            }
        }
        if (URI.matches(".*/(nutrition(/.*)*)$")) {
            request.getRequestDispatcher("/view/user/statistics/nutritionStatistics.jsp").forward(request, response);
            return;
        }
        if (URI.matches(".*/(exercise/cardio(/.*)*)$")) {
            request.getRequestDispatcher("/view/user/statistics/cardioStatistics.jsp").forward(request, response);
            return;
        }
        if (URI.matches(".*/(exercise/resistance(/.*)*)$")) {
            request.getRequestDispatcher("/view/user/statistics/resistanceStatistics.jsp").forward(request, response);
            return;
        }
        if(URI.matches(".*/(health-info(/.*)*)$")){
            request.getRequestDispatcher("/view/user/statistics/healthInfoStatistic.jsp").forward(request, response);
        }
        response.sendRedirect("/CICOHealth/user/statistics/nutrition");
    }

    private void printResponseJSON(HttpServletResponse response, String json) throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }

    private String defaultResponseData() {
        return "{\"logs\":" + "[]" + "}";
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
        processRequest(request, response);
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
