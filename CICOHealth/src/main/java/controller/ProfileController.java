package controller;

import bean.Certification;
import bean.ExpertProfile;
import bean.HealthInfo;
import bean.Login;
import bean.User;
import com.google.gson.Gson;
import dao.CertificationDao;
import dao.ExpertProfileDao;
import dao.HealthInfoDao;
import dao.LoginDao;
import dao.UserDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
//        if (session.getAttribute("user") == null) {
//            response.sendRedirect("/CICOHealth");
//            return;
//        }
        User user
                = session.getAttribute("user") != null ? (User) session.getAttribute("user") : null;
        String userIDRequest = request.getParameter("userid");
        if (new UserDao().getUser(userIDRequest)==null){
            response.sendError(404);
        }
        if (URI.matches(".*/expert-info(/.*)*")) {
            boolean allowUpdate;
            allowUpdate = user!= null && user.getUserID().equalsIgnoreCase(userIDRequest);
            ExpertProfile expertProfile = null;
            List<Certification> certs = null;
            try {
                expertProfile = new ExpertProfileDao().getExpertProfileByID(userIDRequest);
            } catch (SQLException ex) {
                Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("/");
            }
            try {
                certs = new CertificationDao().getUserCertifications(userIDRequest);
            } catch (SQLException ex) {
                Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendRedirect("/");
            }
            request.setAttribute("user", new UserDao().getUser(userIDRequest));
            request.setAttribute("expertProfile", expertProfile);
            request.setAttribute("certifications", certs);
            request.setAttribute("allowUpdate", allowUpdate);
            request.getRequestDispatcher("/view/user/profile/expertProfile.jsp").forward(request, response);
        }
        String role = user.getUserRole();
        if (URI.endsWith("/profile") || URI.endsWith("/user-info")) {
            request.setAttribute("user", new UserDao().getUser(user.getUserID()));
            if (("AD").equalsIgnoreCase(role)) {
                request.setAttribute("user", new UserDao().getUser(userIDRequest));
            } else if (!(user.getUserID().equalsIgnoreCase(userIDRequest))) {
                response.sendRedirect("/CICOHealth/user/profile/user-info?userid=" + user.getUserID());
                return;
            }
            request.getRequestDispatcher("/view/user/profile/userInfo.jsp").forward(request, response);
        } else if (URI.endsWith("/login-info")) {
            request.setAttribute("loginInfo", new LoginDao().getLoginInfoByID(user.getUserID()));
            if (("AD").equalsIgnoreCase(role)) {
                request.setAttribute("loginInfo", new LoginDao().getLoginInfoByID(userIDRequest));
            } else if (!(user.getUserID().equalsIgnoreCase(userIDRequest))) {
                response.sendRedirect("/CICOHealth/user/profile/login-info?userid=" + user.getUserID());
                return;
            }
            request.getRequestDispatcher("/view/user/profile/loginInfo.jsp").forward(request, response);
        } else if (URI.endsWith("/health-info")) {
            String userID = user.getUserID();
            request.setAttribute("healthInfo", new HealthInfoDao().getHealthInfo(user.getUserID()));
            if (("AD").equalsIgnoreCase(role)) {
                userID = userIDRequest;
                request.setAttribute("healthInfo", new HealthInfoDao().getHealthInfo(userIDRequest));
            } else if (!(user.getUserID().equalsIgnoreCase(userIDRequest))) {
                response.sendRedirect("/CICOHealth/user/profile/health-info?userid=" + user.getUserID());
                return;
            }
            String healthInfoID = request.getParameter("healthinfo");
            if (healthInfoID != null) {
                try {
                    request.setAttribute("healthInfo", new HealthInfoDao().getUpdateHealthInfo(healthInfoID, userID));
                } catch (SQLException ex) {
                    response.sendRedirect("/CICOHealth/user/profile/health-info?userid=" + userID);
                }
            }
            List<HealthInfo> history = new HealthInfoDao().getHistory(userID);
            request.setAttribute("history", history);
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
                doPut(request, response);
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
        String check = request.getParameter("btnUpdate");
        String userID = request.getParameter("userID");
        switch (check) {
            case "updateHealth":
                String healthInfoID = request.getParameter("healthInfoID");
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
                try {
                    new HealthInfoDao().insertHealthInfo(healthInfo);
                } catch (SQLException ex) {
                    Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
                }

                response.sendRedirect("/CICOHealth/user/profile/health-info?userid=" + userID);
                return;

            case "updateLogin":
                AuthenticationLogic authenticationLogic = new AuthenticationLogic();
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String passwordSalt = authenticationLogic.getLoginSalt(username, password);
                String passwordHash = null;
                String googleID = request.getParameter("googleID");
                try {
                    passwordHash = authenticationLogic.encryptPassword(password, passwordSalt);
                } catch (Exception ex) {
                    Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
                }
                new LoginDao().updateLoginInfo(new Login(userID, username, passwordHash, passwordSalt, googleID, false));
                response.sendRedirect("/CICOHealth/user/profile/login-info?userid=" + userID);
                return;
            case "updateUser":
                UserDao userDao = new UserDao();
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                User user = new User(userID, firstName, lastName, email, phone);
                userDao.updateUserInfo(user);
                response.sendRedirect("/CICOHealth/user/profile/user-info?userid=" + userID);
                return;
            case "updateExpertProfile":
                Gson gson = new Gson();
                String expertProfileJson = request.getParameter("expertProfile");
                String certCollection = request.getParameter("certificationCollection");
                String certCollectionAction = request.getParameter("actions");
                ExpertProfile profile = gson.fromJson(expertProfileJson, ExpertProfile.class);
                Certification[] certs = gson.fromJson(certCollection, Certification[].class);
                String[] actions = gson.fromJson(certCollectionAction, String[].class);

                try {
                    profile.setUserID(userID);
                    new ExpertProfileDao().updateExpertProfile(profile);
                } catch (SQLException ex) {
                    response.sendRedirect("/CICOHealth/user/profile/expert-info?userid=" + userID + "&error=" + ex.getMessage());
                    Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
                    return;
                }
                try {
                    new CertificationDao().updateProfileCertification(userID, Arrays.asList(certs), Arrays.asList(actions));
                } catch (SQLException ex) {
                    response.sendRedirect("/CICOHealth/user/profile/expert-info?userid=" + userID + "&error=" + ex.getMessage());
                    Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
                    return;
                }
                response.sendRedirect("/CICOHealth/user/profile/expert-info?userid=" + userID);
                break;
            default:
                response.sendRedirect("/CICOHealth/user/profile/user-info" + userID);
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
