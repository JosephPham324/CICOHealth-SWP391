
import bean.HealthInfo;
import bean.Login;
import dao.HealthInfoDao;
import dao.LoginDao;

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
        System.out.println(h.getAge());
    }
    
}
