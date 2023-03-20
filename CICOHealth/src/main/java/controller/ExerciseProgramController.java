/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.ExerciseProgram;
import bean.ProgramInventory;
import bean.User;
import bean.Workout;
import bean.WorkoutExercises;
import com.google.gson.Gson;
import dao.ExerciseProgramDao;
import dao.ProgramInventoryDao;
import dao.WorkoutDao;
import dao.WorkoutExerciseDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
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

    }

    private void serveData(String URI, HttpServletRequest request, HttpServletResponse response) {
        if (URI.endsWith("/data")) {
            if (URI.matches(".*/workouts(/.*)*")) {
            }
        }
    }

    private void serveView(String URI, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        //Program creation
        if (URI.matches(".*/create(/.*)*")) {
            request.getRequestDispatcher("/view/general/exerciseProgram/createProgram.jsp").forward(request, response);
            return;
        }

        //Created programs
        if (URI.matches(".*/my-programs(/.*)*")) {
            String userID
                    = user.getUserID();
//                    "USFE000001";
            List<ExerciseProgram> list = new ExerciseProgramDao().getProgramsByUserID(userID);
            request.setAttribute("listProgram", list);
            request.getRequestDispatcher("/view/general/exerciseProgram/myPrograms.jsp").forward(request, response);
        }

        //Program inventory
        if (URI.matches(".*/inventory(/.*)*")) {
            String userID
                    = user.getUserID();
            List<String> programsID;
            try {
                programsID = new ProgramInventoryDao().getUserInventory(userID);
            } catch (SQLException ex) {
                response.sendRedirect(Utility.appendStatus("/CICOHealth/exercise-programs", "error", ex.getMessage()));
                Logger.getLogger(ExerciseProgramController.class.getName()).log(Level.SEVERE, null, ex);
                return;
            }

            List<ExerciseProgram> list = new ArrayList();
            if (programsID != null) {
                ExerciseProgramDao dao = new ExerciseProgramDao();
                for (String id : programsID) {
                    try {
                        list.add(dao.getProgramsByID(id));
                    } catch (SQLException ex) {
                        Logger.getLogger(ExerciseProgramController.class.getName()).log(Level.SEVERE, null, ex);
                        response.sendRedirect(Utility.appendStatus("/CICOHealth/exercise-programs", "error", ex.getMessage()));
                    }
                }
            }
            request.setAttribute("listProgram", list);
            request.getRequestDispatcher("/view/general/exerciseProgram/programsInUse.jsp").forward(request, response);
        }

        //Details or update a program
        if (URI.matches(".*/detail(/.*)*") || URI.matches(".*/update(/.*)*")) {
            String ID = request.getParameter("id");
            String userID
                    = user.getUserID();
            if (ID != null) {
                ExerciseProgram program = null;
                ProgramInventory inventory = null;
                try {
                    program = new ExerciseProgramDao().getProgramsByID(ID);
                    request.setAttribute("program", program);
                    inventory = new ProgramInventoryDao().getInventory(userID, ID);
                    request.setAttribute("inventory", inventory);
                } catch (SQLException ex) {
                    Logger.getLogger(ExerciseProgramController.class.getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect(util.Utility.appendStatus("/CICOHealth/exercise-programs", "error", "Couldn't fetch data for program " + ID));
                }
                if (program == null) {
                    response.sendError(404);
                    return;
                }
                if (URI.matches(".*/detail(/.*)*")) {//Details
                    request.getRequestDispatcher("/view/general/exerciseProgram/exerciseProgramDetail.jsp").forward(request, response);
                    return;
                }
                //Update
                request.getRequestDispatcher("/view/general/exerciseProgram/exerciseProgramUpdate.jsp").forward(request, response);
                return;
            }
        }

        //Exercise schedule (daily)
        if (URI.matches(".*/exercise-programs/exercise-schedule(/.*)*")) {
            String userID
                    = user.getUserID();
            DayOfWeek dayOfWeek
                    = DayOfWeek.from(LocalDate.now());
            System.out.println(dayOfWeek.getValue());
            List<List<Workout>> todayWorkouts = new ArrayList();
            List<String> programs = null;
            try {
                programs = new ProgramInventoryDao().getUserInventory(userID);
            } catch (SQLException ex) {
                Logger.getLogger(ExerciseProgramController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect(util.Utility.appendStatus("/CICOHealth/", "error", "Couldn't process your request"));
            }
            for (String program : programs) {
                System.out.println("");
                List<Workout> programWorkouts = null;
                try {
                    programWorkouts = new WorkoutDao().getProgramWorkoutsByWeekDay(program, dayOfWeek.getValue());
                } catch (SQLException ex) {
                    Logger.getLogger(ExerciseProgramController.class.getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect(util.Utility.appendStatus("/CICOHealth/", "error", "Couldn't process your request"));
                }
                if (programWorkouts != null) {
                    todayWorkouts.add(programWorkouts);
                }
            }

            if (todayWorkouts.isEmpty()) {
                request.setAttribute("noSchedule", true);
            } else {
                request.setAttribute("workouts", todayWorkouts);
            }
            request.getRequestDispatcher("/view/general/exerciseProgram/exerciseSchedule.jsp").forward(request, response);
            return;
        }

        if (URI.matches("/CICOHealth/exercise-programs/*")) {
            //Index (default view)
            List<ExerciseProgram> list = new ExerciseProgramDao().getAllPrograms();
            request.setAttribute("listProgram", list);
            request.getRequestDispatcher("/view/general/exerciseProgram/exerciseProgram.jsp").forward(request, response);
            return;
        } else {
            response.sendRedirect("/CICOHealth/exercise-programs");
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
        // Check if the HTTP method is DELETE, and call doDelete() if it is
        String method = request.getParameter("_method");
        if (method != null && method.equalsIgnoreCase("delete")) {
            doDelete(request, response);
        }
        User user
                = new User("USFE000001");
//                (User) request.getSession().getAttribute("user");
        String type = request.getParameter("type");
        if (type != null && type.equalsIgnoreCase("inventory")) {
            String programID = request.getParameter("programID");
            String remove = request.getParameter("remove");
            System.out.println(remove);
            if (remove.equalsIgnoreCase("true")) {
                try {
                    new ProgramInventoryDao().removeInventory(user.getUserID(), programID);
                    response.sendRedirect(Utility.appendStatus("/CICOHealth/exercise-programs/detail?id=" + programID, "success", "This program is no longer in your inventory!"));
                } catch (SQLException ex) {
                    Logger.getLogger(ExerciseProgramController.class.getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect(Utility.appendStatus("/CICOHealth/exercise-programs/detail?id=" + programID, "error", "Couldn't process your request!"));
                }
                return;
            }
            try {
                new ProgramInventoryDao().insertProgramInventory(new ProgramInventory(programID, user.getUserID()));
                response.sendRedirect(Utility.appendStatus("/CICOHealth/exercise-programs/detail?id=" + programID, "success", "This program is now in your inventory!"));
            } catch (SQLException ex) {
                Logger.getLogger(ExerciseProgramController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect(Utility.appendStatus("/CICOHealth/exercise-programs/detail?id=" + programID, "error", "Couldn't put this program in your inventory"));
            }
            return;
        }

        // Get the exercise program data from the request
        String program = request.getParameter("program");
        System.out.println(program);
//        response.getWriter().write(program.toString());

        // Parse the exercise program data as a JSON object using the Gson library
        Gson gson = new Gson();
        ExerciseProgram programObject = gson.fromJson(program, ExerciseProgram.class);

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
