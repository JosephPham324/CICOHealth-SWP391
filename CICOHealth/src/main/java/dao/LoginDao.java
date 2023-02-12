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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String createID(String type) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
    }
}
