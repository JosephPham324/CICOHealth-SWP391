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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author vhqua
 */
public class ProfileController extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("/CICOHealth");
            return;
        }
        User user = (User) session.getAttribute("user");
        if (URI.endsWith("/profile") || URI.endsWith("/userinfo")) {
            String userID = request.getParameter("userid");
            if (userID != null) {
                request.setAttribute("user", new UserDao().getUser(userID));
            } else {
                request.setAttribute("user", user);
            }
            request.getRequestDispatcher("/view/user/userInfo.jsp").forward(request, response);
        } else if (URI.endsWith("/logininfo")) {
            Login loginInfo = new LoginDao().getLoginInfoByID(user.getUserID());
            request.setAttribute("loginInfo", loginInfo);
            request.getRequestDispatcher("/view/user/loginInfo.jsp").forward(request, response);
        } else if (URI.endsWith("/healthinfo")) {
            HealthInfo healthInfo = new HealthInfoDao().getHealthInfo(user.getUserID());
            System.out.println(healthInfo);
            request.setAttribute("healthInfo", healthInfo);
            request.getRequestDispatcher("/view/user/healthInfo.jsp").forward(request, response);
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
        UserDao userDao = new UserDao();
        User user = new User(request.getParameter("userID"),
                request.getParameter("firstName"),
                request.getParameter("lastName"),
                request.getParameter("email"),
                request.getParameter("phone"));
        userDao.updateUserInfo(user);
        response.sendRedirect("/CICOHealth/admin/user-management");
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
