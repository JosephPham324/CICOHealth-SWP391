/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.MealLog;
import bean.User;
import com.google.gson.Gson;
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
public class MealLogController extends HttpServlet {

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
            out.println("<title>Servlet MealLogController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MealLogController at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        String URI = request.getRequestURI();
        if (URI.endsWith("/data")) {
            String date = request.getParameter("date");
            User user = (User) request.getSession().getAttribute("user");
            String responseData = null;
            try {
                ArrayList<MealLog> logs = new MealLogDao().getLogsOfDate(user.getUserID(), date);
                String logsJSON = createMealLogsJSON(logs);
                responseData = logsJSON;
            } catch (SQLException ex) {
                responseData = "{"
                        + "\"retrieve\" : \"unsuccessful\""
                        + "}";
                Logger.getLogger(MealLogController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print(responseData);
                out.flush();
                return;
            }
        }
        request.getRequestDispatcher("/view/user/mealLogs/mealLogsPage.html").forward(request, response);
    }

    private String createMealLogsJSON(ArrayList<MealLog> logs) {
        Gson gson = new Gson();
        String logsJSON = "{\"logs\":";
        logsJSON += gson.toJson(logs);
        logsJSON += "}";
        return logsJSON;
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
        if (method.equalsIgnoreCase("delete")) {
            doDelete(request, response);
            return;
        }
        // Get the meal log data from the request parameters
        String meal = request.getParameter("mealLog");
        // Create a Gson object to convert the meal log JSON string to a MealLog object
        Gson gson = new Gson();
        MealLog mealLog = gson.fromJson(meal, MealLog.class);
        // Get the user object from the session
        User user = (User) request.getSession().getAttribute("user");
        // Set the user ID on the meal log object
        mealLog.setUserID(user.getUserID());
        // Create a new instance of the MealLogDao class to interact with the database
        MealLogDao mealLogDao = new MealLogDao();
        try {
            // Call the createMealLog method to insert the new meal log into the database
            mealLogDao.createMealLog(mealLog);
            // Redirect the user to the food search page with a success message
            response.sendRedirect("/CICOHealth/food-search?log=success");
        } catch (SQLException ex) {
            // Log the error and redirect the user to the food search page with a failure message
            Logger.getLogger(MealLogController.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("/CICOHealth/food-search?log=failure");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("mealLogID");
            MealLogDao mealLogDao = new MealLogDao();
            mealLogDao.deleteMealLog(id);
            response.sendRedirect("/CICOHealth/user/meal-logs?delete=success");
        } catch (SQLException ex) {
            Logger.getLogger(MealLogController.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("/CICOHealth/user/meal-logs?delete=failure");
        }
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
