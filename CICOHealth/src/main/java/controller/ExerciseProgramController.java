/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.ExerciseProgram;
import bean.User;
import com.google.gson.Gson;
import dao.ExerciseProgramDao;
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
        if (URI.matches(".*/exercise-programs/create")) {
            request.getRequestDispatcher("/view/general/exerciseProgram/createProgram.html").forward(request, response);
            return;
        }
        if(URI.matches(".*/exercise-programs")){
            List<ExerciseProgram> list = new ExerciseProgramDao().getAllPrograms();
            request.setAttribute("listProgram", list);
            request.getRequestDispatcher("/view/general/exerciseProgram/exerciseProgram.jsp").forward(request, response);
            return;
        }
        response.sendRedirect("/CICOHealth/exercise-programs/create");
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
        String program = request.getParameter("program");
        response.getWriter().write(program.toString());
        Gson gson = new Gson();
        ExerciseProgram programObject = gson.fromJson(program, ExerciseProgram.class);
//        System.out.println(programObject.toString());
        User user =
//                = new User("USME000001");
                (User) request.getSession().getAttribute("user");
        programObject.setCreatedBy(user);
        System.out.println(programObject.getCreatedBy().toString());
        try {
            new ExerciseProgramDao().insertProgram(programObject);
            response.sendRedirect("/CICOHealth/exercise-programs/create?insert=success");
        } catch (Exception ex) {
            System.err.println(ex);
            response.getWriter().write(programObject.toString());
            response.sendRedirect("/CICOHealth/exercise-programs/create?insert=failure");
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
