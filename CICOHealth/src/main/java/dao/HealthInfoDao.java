package dao;

import bean.HealthInfo;
import com.google.gson.Gson;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class HealthInfoDao extends BaseDao {

    @Override
    public String createID() {
//Query to get the latest ID
        String query = "SELECT TOP 1 healthInfoID\n"
                + "from [healthInfo] \n"
                + "ORDER BY healthInfoID DESC ";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record in the table
//Store the substring value before closing the resultSet
                String substringValue = resultSet.getString("healthInfoID").substring(4);
                closeConnections();
//Generate new ID based on the stored substring value
                return "HLTH" + String.format("%06d", Integer.parseInt(substringValue) + 1);
            }
//If not return the lowest ID
            closeConnections();
            return "HLTH000001";
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnections();
        return null;
    }

//    @Override
//    public String createID() {
//        //Query to get the latest ID
//        String query = "SELECT TOP 1 healthInfoID\n"
//                + "from [healthInfo] \n"
//                + "ORDER BY healthInfoID DESC ";
//        try {
//            connection = new DBContext().getConnection();
//            preparedStatement = connection.prepareStatement(query);
//            resultSet = preparedStatement.executeQuery();
//            if (resultSet.next()) {//If there is a record in the table
//                //Generate new ID based on the record
//                closeConnections();
//                return "HLTH" + String.format("%06d", Integer.parseInt(resultSet.getString("healthInfoID").substring(4)) + 1);
//            }
//            //If not return the lowest ID
//            closeConnections();
//            return "HLTH000001";
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        closeConnections();
//        return null;
//    }
    @Override
    public String createID(String type) {
        return new UserDao().createID(type);
    }

    public void insertHealthInfo(HealthInfo healthInfo) throws SQLException {
        String query = "INSERT INTO healthInfo (userID, healthInfoID, gender, height, weight, age, activeness, tdee, dailyCalorie, dailyProtein, dailyFat, dailyCarb)\n"
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

//        System.out.println(healthInfo);
        String id = this.createID();
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        int index = 1;
        //Health info
        preparedStatement.setString(index++, healthInfo.getUserID());
        preparedStatement.setString(index++, id);
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

        closeConnections();
    }

    public HealthInfo getHealthInfo(String userID) {
        String query = "select TOP 1 * from [healthInfo] where userID = ? ORDER BY healthInfoID DESC";
        connection = new DBContext().getConnection();
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                HealthInfo healthInfo = new HealthInfo(
                        resultSet.getString("healthInfoID"),
                        resultSet.getString("userID"),
                        resultSet.getBoolean("gender"),
                        resultSet.getDouble("height"),
                        resultSet.getDouble("weight"),
                        resultSet.getInt("age"),
                        resultSet.getInt("activeness"),
                        resultSet.getInt("tdee"),
                        resultSet.getDouble("dailyCalorie"),
                        resultSet.getDouble("dailyProtein"),
                        resultSet.getDouble("dailyFat"),
                        resultSet.getDouble("dailyCarb"));
                return healthInfo;
            }
        } catch (SQLException ex) {
            Logger.getLogger(HealthInfoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnections();
        return null;
    }

    public List getHistory(String userID) {
        List<HealthInfo> listHistory = new ArrayList<>();
        String query = "select * from HealthInfo where userid = ?";
        connection = new DBContext().getConnection();

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                HealthInfo healthInfo = new HealthInfo(
                        resultSet.getString("healthInfoID"),
                        resultSet.getString("userID"),
                        resultSet.getBoolean("gender"),
                        resultSet.getDouble("height"),
                        resultSet.getDouble("weight"),
                        resultSet.getInt("age"),
                        resultSet.getInt("activeness"),
                        resultSet.getInt("tdee"),
                        resultSet.getDouble("dailyCalorie"),
                        resultSet.getDouble("dailyProtein"),
                        resultSet.getDouble("dailyFat"),
                        resultSet.getDouble("dailyCarb"),
                        resultSet.getString("createdDate"));
                listHistory.add(healthInfo);
            }
        } catch (SQLException e) {
            Logger.getLogger(HealthInfoDao.class.getName()).log(Level.SEVERE, null, e);
        }
        closeConnections();
        return listHistory;
    }

    public HealthInfo getUpdateHealthInfo(String healthInfoID, String userID) throws SQLException {
        String query = "select * from healthInfo where userid = ? and healthInfoID = ?";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, userID);
        preparedStatement.setString(2, healthInfoID);
        resultSet = preparedStatement.executeQuery();
        HealthInfo healthInfo = null;
        if (resultSet.next()) {
            healthInfo = new HealthInfo(
                    resultSet.getString("healthInfoID"),
                    resultSet.getString("userID"),
                    resultSet.getBoolean("gender"),
                    resultSet.getDouble("height"),
                    resultSet.getDouble("weight"),
                    resultSet.getInt("age"),
                    resultSet.getInt("activeness"),
                    resultSet.getInt("tdee"),
                    resultSet.getDouble("dailyCalorie"),
                    resultSet.getDouble("dailyProtein"),
                    resultSet.getDouble("dailyFat"),
                    resultSet.getDouble("dailyCarb"),
                    resultSet.getString("createdDate"));
        }
        return healthInfo;
    }

    public HashMap<Date, Double> getCalorieInRange(String from, String to, String userID){
        HashMap<Date, Double> calorieStatistic = new HashMap<>();
        try {
            String query = "SELECT \n"
                    + "    CONVERT(date, createdDate) as date,\n"
                    + "    AVG(dailyCalorie) as avg_daily_calorie\n"
                    + "FROM \n"
                    + "    healthInfo\n"
                    + "Where userID = ? AND createdDate >= ? AND createdDate <= ?"
                    + "GROUP BY \n"
                    + "CONVERT(date, createdDate)";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                try {
                    Date date = rs.getDate("date");
                    double avgDailyCalorie = rs.getDouble("avg_daily_calorie");
                    calorieStatistic.put(date, avgDailyCalorie);
                } catch (SQLException ex) {
                    Logger.getLogger(HealthInfoDao.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

        } catch (SQLException ex) {
            Logger.getLogger(HealthInfoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return calorieStatistic;
    }
    
    public HashMap<Date, Double> getCalorieStatistic(String userID) {
        HashMap<Date, Double> calorieStatistic = new HashMap<>();
        try {
            String query = "SELECT \n"
                    + "    CONVERT(date, createdDate) as date,\n"
                    + "    AVG(dailyCalorie) as avg_daily_calorie\n"
                    + "FROM \n"
                    + "healthInfo\n"
                    + "Where userID = ? "
                    + "GROUP BY \n"
                    + "    CONVERT(date, createdDate)";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                try {
                    Date date = rs.getDate("date");
                    double avgDailyCalorie = rs.getDouble("avg_daily_calorie");
                    calorieStatistic.put(date, avgDailyCalorie);
                } catch (SQLException ex) {
                    Logger.getLogger(HealthInfoDao.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

        } catch (SQLException ex) {
            Logger.getLogger(HealthInfoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return calorieStatistic;
    }
    
      public String getCalorieStatisticJson(String userID) {
        HashMap<Date, Double> caloStatistic = new HealthInfoDao().getCalorieStatistic(userID);
        Gson gson = new Gson();
        String json = gson.toJson(caloStatistic);
        return json;
    }

      public String getCalorieStatisticInRangeJson(String from, String to, String userID) {
        HashMap<Date, Double> caloStatistic = new HealthInfoDao().getCalorieInRange(from, to, userID);
        Gson gson = new Gson();
        String json = gson.toJson(caloStatistic);
        return json;
    } 
      
      
    public static void main(String[] args) {
        String haha = new HealthInfoDao().getCalorieStatisticJson("USME000001");
        System.out.println(haha);
    }
}
