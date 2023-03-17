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
import util.Utility;

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
        LoginDao loginDao = new LoginDao(); // Instantiate the LoginDao class to interact with login-related data

        String googleID = request.getParameter("googleID"); // Get the "googleID" parameter from the HTTP request
        String redirectUrl;
        if (googleID != null) { // If the "googleID" parameter is present, the user is trying to log in with Google
            try {
                String userID = null;
                userID = loginDao.getLoginInfoByGoogle(googleID); // Get the user's ID from the database using their Google ID

                // Check if the user is banned
                if (userID == null) { // If the user doesn't exist
                    redirectUrl = Utility.appendStatus("/CICOHealth/login", "error", "This account doesn't exist!");
                    response.sendRedirect(redirectUrl);
                    return; // Stop the execution of the method
                }

                request.getSession().setAttribute("user", new UserDao().getUser(userID)); // Store the user's details in the session
                response.sendRedirect("/CICOHealth/"); // Redirect the user to the home page
                return; // Stop the execution of the method
            } catch (SQLException ex) { // If there is a problem with the database connection
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex); // Log the error
                response.sendRedirect("/CICOHealth/login?error=database"); // Redirect the user to the login page with an error message
            }
        } else { // If the "googleID" parameter is not present, the user is trying to log in with a username and password
            String username = request.getParameter("txtUsername"); // Get the "txtUsername" parameter from the HTTP request
            String password = request.getParameter("txtPassword"); // Get the "txtPassword" parameter from the HTTP request
            UserDao userDao = new UserDao(); // Instantiate the UserDao class to interact with user-related data
            util.AuthenticationLogic authentication = new AuthenticationLogic(); // Instantiate the AuthenticationLogic class to verify the user's password
            Login login = null;

            if (username == null || password == null) { // If either the username or password is missing
                redirectUrl = Utility.appendStatus("/CICOHealth/login", "error", "Missing input, please fill in the form!");
                response.sendRedirect(redirectUrl); // Redirect the user to the login page
                return; // Stop the execution of the method
            }
            login = loginDao.getLoginInfo(username); // Get the user's login information from the database using their username

            if (login == null) { // If the user doesn't exist
                redirectUrl = Utility.appendStatus("/CICOHealth/login", "error", "This account doesn't exist!");
                response.sendRedirect(redirectUrl); // Redirect the user to the login page
                return; // Stop the execution of the method
            }

            // Check if the user is banned
            if (login.getIsBanned() == true) {
                redirectUrl = Utility.appendStatus("/CICOHealth/login", "error", "This account is banned!");
                response.sendRedirect(redirectUrl);
                return;
            }

            try {
                // Verify the user's login credentials
                response.getWriter().write("" + authentication.verifyLogin(password, login.getPasswordHash(), login.getPasswordSalt()));
                if (authentication.verifyLogin(password, login.getPasswordHash(), login.getPasswordSalt())) {
                    // Get the user's information and store it in the session
                    User user = userDao.getUser(login.getUserID());
                    request.getSession().setAttribute("user", user);
                    // Redirect to the home page
                    response.sendRedirect("/CICOHealth/");
                    return;
                }
                // Redirect to the login page if the user's credentials are incorrect
                redirectUrl = Utility.appendStatus("/CICOHealth/login", "error", "Incorrect username or password!");
                response.sendRedirect(redirectUrl);
            } catch (Exception ex) {
                // Log any exceptions that occur
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
                redirectUrl = Utility.appendStatus("/CICOHealth/login", "error", "Your request couldn't be serviced!");
                response.sendRedirect(redirectUrl);
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
