package dao;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class UserDao extends BaseDao {

    @Override
    /**
     * Create a member ID based on the largest ID in the database.
     */
    public String createID() {
        String query = "SELECT TOP 1 userID\n"
                + "from [user] \n"
                + "where userID like 'USME' + '%' \n"
                + "ORDER BY userID DESC ";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return "USME" + String.format("%06d", Integer.parseInt(resultSet.getString("userID").substring(4)) + 1);
            }
            return "USME000001";
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public String createID(String type) {
        if (!type.toUpperCase().matches("ME|FE|AD")) {
            return null;
        }
        String query = "SELECT TOP 1 userID\n"
                + "from [user] \n"
                + "where userID like 'US' + '" + type + "' + '%' \n"
                + "ORDER BY userID DESC ";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return "US" + type + String.format("%06d", Integer.parseInt(resultSet.getString("userID").substring(4)) + 1);
            }
            return "US" + type + "000001";
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
