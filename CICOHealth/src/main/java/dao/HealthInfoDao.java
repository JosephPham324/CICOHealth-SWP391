package dao;

import bean.HealthInfo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
                //Generate new ID based on the record
                closeConnections();
                return "HLTH" + String.format("%06d", Integer.parseInt(resultSet.getString("healthInfoID").substring(4)) + 1);
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
                HealthInfo healthInfo = new HealthInfo(resultSet.getString("userID"),
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

    public List<HealthInfo> selectByDate(String date) throws SQLException {
        List listHealthInfo = new ArrayList();
        connection = new DBContext().getConnection();
        String query = "SELECT *\n"
                + "FROM healthInfo\n"
                + "WHERE createdDate BETWEEN ? AND ?\n";
        String from = date + " 00:00:00";
        String to = date + " 23:59:59";
        preparedStatement = connection.prepareStatement(query);
        // Set the parameter for the SQL statement
        preparedStatement.setString(1, from);
        preparedStatement.setString(2, to);
        
        // Execute the SQL statement and retrieve the results
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                HealthInfo healthInfo = new HealthInfo(resultSet.getString("userID"),
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
                listHealthInfo.add(healthInfo);
            }
        }
        closeConnections();
        return listHealthInfo;
    }

    public static void main(String[] args) {
//        HealthInfo healthInfo = new HealthInfo("USME000001", true, 123, 123, 12, 0, 0, 0, 0, 0, 0);
//        try {
//            new HealthInfoDao().insertHealthInfo(healthInfo);
//
//        } catch (SQLException ex) {
//            Logger.getLogger(HealthInfoDao.class
//                    .getName()).log(Level.SEVERE, null, ex);
//        }
        HealthInfo h = null;
        List<HealthInfo> l = null;
        try {
            l = new HealthInfoDao().selectByDate("2023-02-25");
        } catch (SQLException ex) {
            Logger.getLogger(HealthInfoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (HealthInfo healthInfo : l) {
            System.out.println(healthInfo);
        }
    }
}
