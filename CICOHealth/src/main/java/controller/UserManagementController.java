/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.HealthInfo;
import bean.Login;
import bean.User;
import dao.HealthInfoDao;
import dao.LoginDao;
import dao.UserDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.AuthenticationLogic;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class UserManagementController extends HttpServlet {

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
        if (URI.endsWith("/create-username")) {
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String role = request.getParameter("type");
            String userID = new UserDao().createID(role);
            String username = firstName + lastName + userID;

            response.setContentType("text/plain"); // sets the content type
            response.setCharacterEncoding("UTF-8"); // sets the encoding
            String data = username;
            response.getWriter().write(data);
            return;
        }
        request.getRequestDispatcher("/view/admin/ViewUserInfo.jsp").forward(request, response);
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

        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");

        //User info parameters
        String firstName = request.getParameter("txtFirstName");
        String lastName = request.getParameter("txtLastName");
        String type = request.getParameter("type");

        //Regsiter logic
        UserDao userDao = new UserDao();
        LoginDao loginDao = new LoginDao();
        HealthInfoDao healthDao = new HealthInfoDao();

        //Create a Member,Finess Expert, Admin
        String userID = userDao.createID(type);

        //Model representation
        User user = new User(userID, firstName, lastName);
        Login login;
        HealthInfo healthInfo = new HealthInfo();

        AuthenticationLogic authLogic = new AuthenticationLogic();
        String passwordSalt = authLogic.getLoginSalt(username, password);//Get salt to encrypt password
        String passwordHash = null;

        try {
            passwordHash = authLogic.encryptPassword(password, passwordSalt);//Encrypt password using salt
        } catch (Exception ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (passwordHash == null) {
            response.sendRedirect("/CICOHealth/view/admin/addNew.jsp");
            return;
        }
        login = new Login(userID, username, passwordHash, passwordSalt, false);
        try {
            userDao.insertUserInfo(user);
            loginDao.insertLoginInfo(login);
            healthInfo.setUserID(userID);
            healthDao.insertHealthInfo(healthInfo);
        } catch (SQLException ex) {
            response.sendRedirect("/CICOHealth/view/admin/addNew.jsp");
            return;
        }
        response.sendRedirect("/CICOHealth/view/admin/ViewUserInfo.jsp");

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
