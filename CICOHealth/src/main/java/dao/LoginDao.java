package dao;

import bean.Login;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
        if (login.getGoogleID() != null) {
            preparedStatement.setString(index++, login.getGoogleID());
        } else {
            preparedStatement.setString(index++, "");
        }

        preparedStatement.setString(index++, login.getIsBanned() + "");
        preparedStatement.executeUpdate();

        closeConnections();
    }

    public Login getLoginInfo(String username) {
        try {
            String query = "select * from [login] where username = ?";
            Login login = null;

            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                login = new Login(resultSet.getString("userID"),
                        resultSet.getString("username"),
                        resultSet.getString("passwordHash"),
                        resultSet.getString("passwordSalt"),
                        resultSet.getString("GoogleID"),
                        resultSet.getBoolean("isBanned"));
            }
            return login;
        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnections();
        return null;
    }

    public Login getLoginInfoByID(String userID) {
        try {
            String query = "select * from [login] where userID = ?";
            Login login = null;
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                login = new Login(resultSet.getString("userID"),
                        resultSet.getString("username"),
                        resultSet.getString("passwordHash"),
                        resultSet.getString("passwordSalt"),
                        resultSet.getString("GoogleID"),
                        resultSet.getBoolean("isBanned"));
            }
            return login;
        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public String getLoginInfoByGoogle(String googleID) throws SQLException {
        String query = "SELECT userID FROM login WHERE GoogleID = ?";
        if (googleID == null) {
            return null;
        }
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, googleID);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            String id = resultSet.getString("userID");
            closeConnections();
            return id;
        }
        closeConnections();
        return null;
    }

    public String getLoginInfoByUsername(String username) throws SQLException {
        String query = "SELECT userID FROM login WHERE username = ?";
        if (username == null) {
            return null;
        }
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            String id = resultSet.getString("userID");
            closeConnections();
            return id;
        }
        closeConnections();
        return null;
    }

    public int banUserByUserId(String userId) throws SQLException {

        Login login = getLoginInfoByID(userId);
        String banned = "1";
        if (login.getIsBanned()) {
            banned = "0";
        }
        String query = "update [login] set isBanned = ? where userID = ?";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, banned);
        preparedStatement.setString(2, userId);
        int result = preparedStatement.executeUpdate();
        closeConnections();
        return result;
    }

    public void updateLoginInfo(Login login) {
        String query = "UPDATE [login]\n"
                + "SET username = ?, passwordHash = ?, passwordSalt = ?\n"
                + "WHERE userID = ?";
        connection = new DBContext().getConnection();
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, login.getUsername());
            preparedStatement.setString(2, login.getPasswordHash());
            preparedStatement.setString(3, login.getPasswordSalt());
            preparedStatement.setString(4, login.getUserID());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
