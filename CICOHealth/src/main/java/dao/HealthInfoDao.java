package dao;

import bean.HealthInfo;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class HealthInfoDao extends BaseDao {

    @Override
    public String createID() {
        return new UserDao().createID();
    }

    @Override
    public String createID(String type) {
        return new UserDao().createID(type);
    }

    public void insertHealthInfo(HealthInfo healthInfo) throws SQLException {
        String query = "INSERT INTO healthInfo (userID, gender, height, weight, age, activeness, tdee, dailyCalorie, dailyProtein, dailyFat, dailyCarb) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        int index = 1;
        //Health info
        preparedStatement.setString(index++, healthInfo.getUserID());
        preparedStatement.setString(index++, (healthInfo.getGender() ? 0 + "" : 1 + ""));
        preparedStatement.setString(index++, healthInfo.getHeight() + "");
        preparedStatement.setString(index++, healthInfo.getWeight() + "");
        preparedStatement.setString(index++, healthInfo.getAge() + "");
        preparedStatement.setString(index++, healthInfo.getActiveness() + "");
        //Nutrition goal
        preparedStatement.setString(index++, healthInfo.getTdee() + "");
        preparedStatement.setString(index++, healthInfo.getDailyCalorie() + "");
        preparedStatement.setString(index++, healthInfo.getDailyProtein() + "");
        preparedStatement.setString(index++, healthInfo.getDailyFat() + "");
        preparedStatement.setString(index++, healthInfo.getDailyCarb() + "");

        preparedStatement.executeUpdate();

    }
}
