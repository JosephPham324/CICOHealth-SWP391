/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.Login;
import bean.User;
import dao.LoginDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.AuthenticationLogic;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/view/general/authentication/login.jsp").forward(request, response);
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
//        processRequest(request, response);\
        LoginDao loginDao = new LoginDao();
        String googleID = request.getParameter("googleID");
        if (googleID != null) {
            try {
                String userID = null;
                userID = loginDao.getLoginInfoByGoogle(googleID);
                //Check if user is banned
                if (userID == null) {
                    response.sendRedirect("/CICOHealth/login?error=nosuchuser");
                    return;
                }
                request.getSession().setAttribute("user", new UserDao().getUser(userID));
                response.sendRedirect("/CICOHealth/");
                return;
            } catch (SQLException ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("/CICOHealth/login?error=database");
            }
        } else {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            UserDao userDao = new UserDao();
            util.AuthenticationLogic authentication = new AuthenticationLogic();
            Login login = null;
            if (username == null || password == null) {
                response.sendRedirect("/CICOHealth/login");
                return;
            }
            login = loginDao.getLoginInfo(username);
            if (login == null) {
                response.sendRedirect("/CICOHealth/login");
                return;
            }
            try {
                response.getWriter().write("" + authentication.verifyLogin(password, login.getPasswordHash(), login.getPasswordSalt()));
                if (authentication.verifyLogin(password, login.getPasswordHash(), login.getPasswordSalt())) {
                    User user = userDao.getUser(login.getUserID());
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect("/CICOHealth/");
                    return;
                }
                response.sendRedirect("/CICOHealth/login");
                return;
            } catch (Exception ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }
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
