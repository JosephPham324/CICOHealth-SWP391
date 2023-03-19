/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.ExerciseProgram;
import bean.User;
import bean.Workout;
import bean.WorkoutExercises;
import com.google.gson.Gson;
import dao.ExerciseProgramDao;
import dao.WorkoutDao;
import dao.WorkoutExerciseDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.Utility;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class ExerciseProgramController extends HttpServlet {

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
            out.println("<title>Servlet ExerciseProgramController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExerciseProgramController at " + request.getContextPath() + "</h1>");
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
        if (URI.matches(".*/data(/.*)*")) {
            serveData(URI, request, response);
        }
        serveView(URI, request, response);

        //Default
        List<ExerciseProgram> list = new ExerciseProgramDao().getAllPrograms();
        request.setAttribute("listProgram", list);
        request.getRequestDispatcher("/view/general/exerciseProgram/exerciseProgram.jsp").forward(request, response);
    }

    private void serveData(String URI, HttpServletRequest request, HttpServletResponse response) {
        if (URI.endsWith("/data")){
            if (URI.matches(".*/workouts(/.*)*")) {
            }
        }
    }

    private void serveView(String URI, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (URI.matches(".*/create(/.*)*")) {
            request.getRequestDispatcher("/view/general/exerciseProgram/createProgram.html").forward(request, response);
            return;
        }
        if (URI.matches(".*/detail/workout(/.*)*")) {
            String workoutID = request.getParameter("workoutid");
            List<WorkoutExercises> workout = new WorkoutExerciseDao().getExerciseByWorkoutID(workoutID);
            request.setAttribute("workout", workout);
            request.getRequestDispatcher("/view/general/exerciseProgram/workoutDetail.jsp").forward(request, response);
            return;
        }
        if (URI.matches(".*/detail(/.*)*")) {
            String ID = request.getParameter("id");
            if (ID != null) {
                List<Workout> workouts = new WorkoutDao().getWorkoutByProgramID(ID);
                request.setAttribute("workouts", workouts);
                request.getRequestDispatcher("/view/general/exerciseProgram/exerciseProgramDetail.jsp").forward(request, response);
                return;
            }
        }
        if (URI.matches(".*/exercise-programs/exercise-schedule(/.*)*")) {
            return;
        }
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
        // Check if the HTTP method is DELETE, and call doDelete() if it is
        String method = request.getParameter("_method");
        if (method != null && method.equalsIgnoreCase("delete")) {
            doDelete(request, response);
        }

        // Get the exercise program data from the request
        String program = request.getParameter("program");
//        response.getWriter().write(program.toString());

        // Parse the exercise program data as a JSON object using the Gson library
        Gson gson = new Gson();
        ExerciseProgram programObject = gson.fromJson(program, ExerciseProgram.class);

        // Get the current user from the session, and set them as the creator of the exercise program
        User user = (User) request.getSession().getAttribute("user");
        programObject.setCreatedBy(user);

        // Debugging output to the console
        System.out.println(programObject.getCreatedBy().toString());

        // Attempt to insert the exercise program into the database
        try {
            new ExerciseProgramDao().insertProgram(programObject);

            // Redirect to the create exercise program page with a success message
            String redirectUrl = Utility.appendStatus("/CICOHealth/exercise-programs/create", "insert", "Program created successfully!");
            response.sendRedirect(redirectUrl);
        } catch (Exception ex) {
            response.getWriter().write(programObject.toString());

            // Redirect to the create exercise program page with a failure message
            String redirectUrl = Utility.appendStatus("/CICOHealth/exercise-programs/create", "insert", "Failed creating program!");
            response.sendRedirect(redirectUrl);
        }

    }

    /**
     * Handles the HTTP <code>DELETE</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("programID");
            ExerciseProgramDao exerciseProgramDao = new ExerciseProgramDao();
            exerciseProgramDao.deleteProgram(id);
            resp.sendRedirect("/CICOHealth/exercise-programs?delelte=successfully");
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseLogController.class.getName()).log(Level.SEVERE, null, ex);
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
