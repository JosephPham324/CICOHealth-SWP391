/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.ExerciseLog;
import bean.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import dao.ExerciseDao;
import dao.ExerciseLogDao;
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
import util.Utility;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class ExerciseLogController extends HttpServlet {

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
            out.println("<title>Servlet ExerciseLogController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExerciseLogController at " + request.getContextPath() + "</h1>");
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
            String responseData = defaultResponseData();
            Object user = request.getSession().getAttribute("user");
            String userID = ((User) user).getUserID();
            String date = request.getParameter("date");
            Gson gson = new Gson();
            if (URI.matches(".*/exercise-logs/cardio(/.*)*")) {
                System.out.println("here");
                try {
                    ArrayList<ExerciseLog> queryResult = new ExerciseLogDao().getLogsOfDate(userID, date, "CA");
                    responseData = "{\"logs\":" + gson.toJson(queryResult) + "}";
                } catch (SQLException ex) {
                    Logger.getLogger(ExerciseLogController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    System.out.println("here");
                    ArrayList<ExerciseLog> queryResult = new ExerciseLogDao().getLogsOfDate(userID, date, "RE");
                    responseData = "{\"logs\":" + gson.toJson(queryResult) + "}";
                } catch (SQLException ex) {
                    Logger.getLogger(ExerciseLogController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            //Write JSON response
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(responseData);
            out.flush();
            return;
        }
        if (URI.matches(".*/exercise-logs/cardio/*.*")) {
            request.getRequestDispatcher("/view/user/exerciseLogs/cardio.jsp").forward(request, response);
            return;
        } else if (URI.matches(".*/exercise-logs/resistance/*.*")) {
            request.getRequestDispatcher("/view/user/exerciseLogs/resistance.jsp").forward(request, response);
            return;
        }
        response.sendRedirect("/CICOHealth/user/exercise-logs/cardio");
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
//        processRequest(request, response);
        String method = request.getParameter("_method");
        if (method != null && method.equalsIgnoreCase("delete")) {
            doDelete(request, response);
            return;
        }
        if (method != null && method.equalsIgnoreCase("put")) {
            doPut(request, response);
            return;
        }
        ExerciseLog log;
        Gson gson = new Gson();
        String exerciseParam = request.getParameter("exercise");
        log = gson.fromJson(exerciseParam, ExerciseLog.class);
        User user = (User) request.getSession().getAttribute("user");
        log.setUserID(user.getUserID());
        System.out.println(user.getUserID());
        System.out.println(log.getUserID());
//        response.getWriter().write(log.toString());
        try {
            new ExerciseLogDao().createLog(log);
            response.sendRedirect(Utility.appendStatus("/CICOHealth/exercise-search", "success", "Successfully created log!"));
            return;
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseLogController.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(Utility.appendStatus("/CICOHealth/exercise-search", "failure", "Log creating failed!"));
            return;
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String check = request.getParameter("check");
        if (check != null && check.equalsIgnoreCase("cardio")) {
            ExerciseLog log;
            Gson gson = new Gson();
            String exerciseParam = request.getParameter("exerciseLog");
            JsonObject obj = gson.fromJson(exerciseParam, JsonObject.class);
            gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
            log = gson.fromJson(exerciseParam, ExerciseLog.class);
            System.out.println(exerciseParam);
            log.setUserID(user.getUserID());
//        response.getWriter().write(log.toString());
            try {
                new ExerciseLogDao().updateExerciseLogCardio(log);
                response.sendRedirect(Utility.appendStatus("/CICOHealth/user/exercise-logs/cardio", "success", "Update log successfully!"));
            } catch (SQLException ex) {
                Logger.getLogger(ExerciseLogController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect(Utility.appendStatus("/CICOHealth/user/exercise-logs/cardio", "failure", "Log update failed!"));
            }

        }
        if (check != null && check.equalsIgnoreCase("resistance")) {
            ExerciseLog log;
            Gson gson = new Gson();
            String exerciseParam = request.getParameter("exerciseLog");
            JsonObject obj = gson.fromJson(exerciseParam, JsonObject.class);
            gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
            log = gson.fromJson(exerciseParam, ExerciseLog.class);
            System.out.println(exerciseParam);
            log.setUserID(user.getUserID());
            try {
                new ExerciseLogDao().updateExerciseLogResitance(log);
                response.sendRedirect(Utility.appendStatus("/CICOHealth/user/exercise-logs/resistance", "success", "Update log successfully!"));
            } catch (SQLException ex) {
                Logger.getLogger(ExerciseLogController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect(Utility.appendStatus("/CICOHealth/user/exercise-logs/resistance", "failure", "Log update failed!"));
            }
        }
        String updateNote = request.getParameter("updateNote");
        if (updateNote != null) {
            try {
                String exerciseLogID = request.getParameter("exerciseLogID");
                String note = request.getParameter("note");
                System.out.println(user.getUserID());
                System.out.println(note + exerciseLogID);
                new ExerciseLogDao().updateExerciseLogNote(user.getUserID(), exerciseLogID, note);
                response.sendRedirect("/CICOHealth/user/exercise-logs/" + updateNote + "?updateLog=success");
            } catch (Exception e) {
                response.sendRedirect("/CICOHealth/user/exercise-logs/" + updateNote + "?updateLog=failure");
            }

        }

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("exerciseLogID");
            ExerciseLogDao exerciseLogDao = new ExerciseLogDao();
            exerciseLogDao.deleteExerciseLog(id);
            resp.sendRedirect("/CICOHealth/user/exercise-logs?delelte=successfully");
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseLogController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createCardioLog(HttpServletRequest request, HttpServletResponse response) {
    }

    public void createResistanceLog(HttpServletRequest request, HttpServletResponse response) {
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
