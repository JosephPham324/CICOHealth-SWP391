
import bean.HealthInfo;
import bean.Login;
import bean.User;
import dao.HealthInfoDao;
import dao.LoginDao;
import dao.UserDao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author vhqua
 */
public class test {

    public static void main(String[] args) {
        LoginDao l = new LoginDao();
        Login la = l.getLoginInfoByID("USME000001");
        System.out.println(la.getGoogleID());
        System.out.println(la.getPasswordHash());
        System.out.println(la.getPasswordSalt());
        System.out.println(la.getUsername());
        HealthInfo h = new HealthInfoDao().getHealthInfo("USME000001");
        System.out.println(h.getAge() + ", " + h.getActiveness() + ", " + h.getDailyCarb());
        UserDao n = new UserDao();
        n.updateUserInfo(new User("USME000005", "Vo", "Hong", "qqq", "0708992832"));
        String userID = "USME000001";
        String gender = "";
        double height = 152.2;
        double weight = 59.1;
        int activity = 1;
        //Daily nutrition goal paramters
        double TDEE = 2;
        double protein =1999.1;
        double fat = 123124.1;
        double carb = 123123.1;
        int age = 24;
        HealthInfo healthInfo = new HealthInfo(userID, gender.equals("female"), height, weight, age, activity,
                (int) TDEE, (int) TDEE, protein, fat, carb);
        new HealthInfoDao().updateHealthInfo(healthInfo);
    }

}
