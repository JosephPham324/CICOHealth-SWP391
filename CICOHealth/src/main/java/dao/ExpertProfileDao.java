package dao;

import bean.ExpertProfile;
import java.sql.SQLException;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class ExpertProfileDao extends BaseDao {

    @Override
    public String createID() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String createID(String type) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void insertExpertProfile(ExpertProfile profile) throws SQLException {
        // prepare the INSERT query
        String query = "INSERT INTO expertProfile (userID, profilePicture, bio) VALUES (?, ?, ?)";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);

        // set the values of the parameters in the query
        preparedStatement.setString(1, profile.getUserID());
        preparedStatement.setString(2, profile.getProfilePicture());
        preparedStatement.setString(3, profile.getBio());

        // execute the query
        preparedStatement.executeUpdate();
    }

    public void updateExpertProfile(ExpertProfile profile) throws SQLException {
        // prepare the UPDATE query
        String query = "UPDATE expertProfile SET profilePicture = ?, bio = ? WHERE userID = ?";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);

        // set the values of the parameters in the query
        preparedStatement.setString(1, profile.getProfilePicture());
        preparedStatement.setString(2, profile.getBio());
        preparedStatement.setString(3, profile.getUserID());

        // execute the query
        preparedStatement.executeUpdate();
    }

    public void deleteExpertProfile(String userID) throws SQLException {
        // prepare the DELETE query
        String query = "DELETE FROM expertProfile WHERE userID = ?";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);

        // set the value of the parameter in the query
        preparedStatement.setString(1, userID);

        // execute the query
        preparedStatement.executeUpdate();
    }

    public ExpertProfile getExpertProfileByID(String userID) throws SQLException {
        String QUERY_SELECT = "SELECT * FROM [expertProfile]\n"
                + "WHERE userID = ?";
        ExpertProfile profile = new ExpertProfile();
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(QUERY_SELECT);

        preparedStatement.setString(1, userID);

        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            profile.setBio(resultSet.getString("bio"));
            profile.setProfilePicture(resultSet.getString("profilePicture"));
            profile.setUserID(userID);
        }
        return profile;
    }
}
