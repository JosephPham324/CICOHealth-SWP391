package dao;

import bean.Login;
import java.sql.SQLException;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class LoginDao extends BaseDao {

    @Override
    public String createID() {
        return new UserDao().createID();
    }

    @Override
    public String createID(String type) {
        return new UserDao().createID(type);
    }

    public void insertLoginInfo(Login login) throws SQLException {
        String query = "INSERT INTO login (userID, username, passwordHash, passwordSalt, GoogleID, isBanned) VALUES (?, ?, ?, ?, ?, ?)";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        int index = 1;
        preparedStatement.setString(index++, login.getUserID());
        preparedStatement.setString(index++, login.getUsername());
        preparedStatement.setString(index++, login.getPasswordHash());
        preparedStatement.setString(index++, login.getPasswordSalt());
        preparedStatement.setString(index++, login.getGoogleID());
        preparedStatement.setString(index++, login.getIsBanned() + "");
        preparedStatement.executeUpdate();
       
        closeConnections();
    }
}
