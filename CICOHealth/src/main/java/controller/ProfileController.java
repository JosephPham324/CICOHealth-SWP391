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
import java.util.logging.Level;
import java.util.logging.Logger;
import util.AuthenticationLogic;

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
        if (URI.endsWith("/profile/") || URI.endsWith("/user-info")) {
            String userID = request.getParameter("userid");
            if (userID != null) {
                request.setAttribute("user", new UserDao().getUser(userID));
            } else {
                request.setAttribute("user", user);
            }
            request.getRequestDispatcher("/view/user/profile/userInfo.jsp").forward(request, response);
        } else if (URI.endsWith("/login-info")) {
            Login loginInfo = new LoginDao().getLoginInfoByID(user.getUserID());
            request.setAttribute("loginInfo", loginInfo);
            request.getRequestDispatcher("/view/user/profile/loginInfo.jsp").forward(request, response);
        } else if (URI.endsWith("/health-info")) {
            String userID = request.getParameter("userid");
            if (userID != null) {
                request.setAttribute("healthInfo", new HealthInfoDao().getHealthInfo(userID));
            } else {
                request.setAttribute("healthInfo", new HealthInfoDao().getHealthInfo(user.getUserID()));
            }
            request.getRequestDispatcher("/view/user/profile/healthInfo.jsp").forward(request, response);
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
        String method = request.getParameter("_method");
        if (method != null) {
            if ("PUT".equalsIgnoreCase(method)) {
                String check = request.getParameter("btnUpdateLoginInfo");
                AuthenticationLogic authenticationLogic = new AuthenticationLogic();
                String userID = request.getParameter("userID");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String passwordSalt = authenticationLogic.getLoginSalt(username, password);
                String passwordHash = null;
                try {
                    passwordHash = authenticationLogic.encryptPassword(password, passwordSalt);
                } catch (Exception ex) {
                    Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
                }
                String googleID = request.getParameter("googleID");
                Login login = new Login(userID, username, passwordHash, passwordSalt, googleID, false);
                new LoginDao().updateLoginInfo(login);
//                doPut(request, response);
                response.sendRedirect("/CICOHealth/user/profile/login-info");
//                doPut(request, response);
            } else {
                UserDao userDao = new UserDao();
                User user = new User(request.getParameter("userID"),
                        request.getParameter("firstName"),
                        request.getParameter("lastName"),
                        request.getParameter("email"),
                        request.getParameter("phone"));
                userDao.updateUserInfo(user);
                response.sendRedirect("/CICOHealth/admin/user-management");
            }
        }
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String check = null;
        if (check != null) {
//            AuthenticationLogic authenticationLogic = new AuthenticationLogic();
//            String userID = request.getParameter("userID");
//            String username = request.getParameter("username");
//            String password = request.getParameter("password");
//            String passwordSalt = authenticationLogic.getLoginSalt(username, password);
//            String passwordHash = null;
//            try {
//                passwordHash = authenticationLogic.encryptPassword(password, passwordSalt);
//            } catch (Exception ex) {
//                Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            String googleID = request.getParameter("googleID");
//            Login login = new Login(userID, username, passwordHash, passwordSalt, googleID, false);
        } else {
            String userID = request.getParameter("userID");
            int age = Integer.parseInt(request.getParameter("numAge"));
            String gender = request.getParameter("radGender");
            double height = Double.parseDouble(request.getParameter("numHeight"));
            double weight = Double.parseDouble(request.getParameter("numWeight"));
            int activity = Integer.parseInt(request.getParameter("selectActiveness"));
            //Daily nutrition goal paramters
            double TDEE = Double.parseDouble(request.getParameter("numTDEE"));
            double protein = Double.parseDouble(request.getParameter("numProtein"));
            double fat = Double.parseDouble(request.getParameter("numFat"));
            double carb = Double.parseDouble(request.getParameter("numCarb"));
            HealthInfo healthInfo = new HealthInfo(userID, gender.equals("female"), height, weight, age, activity,
                    (int) TDEE, (int) TDEE, protein, fat, carb);
            new HealthInfoDao().updateHealthInfo(healthInfo);
            return;
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
