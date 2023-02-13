package controller;

import bean.HealthInfo;
import bean.Login;
import bean.User;
import dao.HealthInfoDao;
import dao.LoginDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.AuthenticationLogic;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
        //Forward to register form view
        request.getRequestDispatcher("/view/general/authentication/register.jsp").forward(request, response);
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
        //Check if user has filled the health register form
        String registerHealth = request.getParameter("healthReg");
        if (registerHealth == null) {//If the parameter isn't found
            response.sendRedirect("/register");//Redirect to register form
        }
        if (registerHealth.equals("true")) {//If the parameter is set to true, forward to health register page
            request.getRequestDispatcher("/view/general/authentication/healthRegister.jsp").forward(request, response);
        } else {//If user has filled both forms, process registration request
            //Login info parameters
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            //User info parameters
            String firstName = request.getParameter("txtFirstName");
            String lastName = request.getParameter("txtLastName");
            String email = request.getParameter("txtEmail");
            String phone = request.getParameter("txtPhone");
            //Health info parameters
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

            //Regsiter logic
            UserDao userDao = new UserDao();
            LoginDao loginDao = new LoginDao();
            HealthInfoDao healthDao = new HealthInfoDao();
            //Create a Member ID
            String userID = userDao.createID();
            
            //Model representation
            User user = new User(userID, firstName, lastName, email, phone);
            Login login;
            HealthInfo healthInfo = new HealthInfo(userID, gender.equals("female"), height, weight, age, activity, (int) TDEE, (int) TDEE, protein, fat, carb);
            
            //Components for encryption and authentication
            AuthenticationLogic authLogic = new AuthenticationLogic();
            String passwordSalt = authLogic.getLoginSalt(username, password);//Get salt to encrypt password
            String passwordHash = null;

            try {
                passwordHash = authLogic.encryptPassword(password, passwordSalt);//Encrypt password using salt
            } catch (Exception ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (passwordHash != null) {//If encryption is successful, begin inserting data
                login = new Login(userID, username, passwordHash, passwordSalt, null, false);
                try {
                    userDao.insertUserInfo(user);//Insert user information
                    loginDao.insertLoginInfo(login);//Insert login information
                    healthDao.insertHealthInfo(healthInfo);//Insert health information
                } catch (SQLException ex) {
                    response.sendRedirect("/register?status=fail");//If insertion failed, redirect to view
                }
                response.sendRedirect("/CICOHealth");
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
