package dao;

import bean.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class UserDao extends BaseDao {

    @Override
    /**
     * Create a userID of type Member. The userID will be one unit increment of
     * the latest ID.
     *
     * @param type Type of user, allowed values: ME or FE or AD
     * @return Unique userID that is not currently in the table
     */
    public String createID() {
        //Query to get the latest ID
        String query = "SELECT TOP 1 userID\n"
                + "from [user] \n"
                + "where userID like 'USME' + '%' \n"
                + "ORDER BY userID DESC ";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record in the table
                //Generate new ID based on the record
                return "USME" + String.format("%06d", Integer.parseInt(resultSet.getString("userID").substring(4)) + 1);
            }
            //If not return the lowest ID
            return "USME000001";
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Create a userID based on the type. The userID will be one unit increment
     * of the latest ID of that type.
     *
     * @param type Type of user, allowed: ME or FE or AD
     * @return Unique userID that is not currently in the table
     */
    @Override
    public String createID(String type) {
        if (!type.toUpperCase().matches("ME|FE|AD")) {
            //Return null if type isn't allowed
            return null;
        }
        //Query to get the latest ID
        String query = "SELECT TOP 1 userID\n"
                + "from [user] \n"
                + "where userID like 'US' + '" + type + "' + '%' \n"
                + "ORDER BY userID DESC ";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record, generate newest ID based on that record
                return "US" + type + String.format("%06d", Integer.parseInt(resultSet.getString("userID").substring(4)) + 1);
            }
            //If not return the lowest ID
            return "US" + type + "000001";
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnections();
        }
        closeConnections();
        return null;
    }

    /**
     * Insert a record into the user table using attributes of a User object
     *
     * @param user User object to insert information
     * @throws SQLException Thrown when database operation fails
     */
    public void insertUserInfo(User user) throws SQLException {
        //Query to insert new record into table
        String query = "INSERT INTO [user] (userID, firstName, lastName, email, phone) VALUES (?, ?, ?, ?, ?)";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);
        int index = 1;//Index to set value in preparedStatement
        preparedStatement.setString(index++, user.getUserID());
        preparedStatement.setString(index++, user.getFirstName());
        preparedStatement.setString(index++, user.getLastName());
        preparedStatement.setString(index++, user.getEmail());
        preparedStatement.setString(index++, user.getPhone());

        preparedStatement.executeUpdate();
        closeConnections();
    }

    public User getUser(String userID) {
        try {
            String query = "SELECT *\n"
                    + "FROM [user]\n"
                    + "WHERE userID = ?";
            User user = null;
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User(resultSet.getString("userID"),
                        resultSet.getString("firstName"),
                        resultSet.getString("lastName"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"));
            };
            return user;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM [user]";
            User user = null;
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user = new User(resultSet.getString("userID"),
                        resultSet.getString("firstName"),
                        resultSet.getString("lastName"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"));
                list.add(user);
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return list;
    }

    public void updateUserInfo(User user) {
        try {
            // Open a connection
            connection = new DBContext().getConnection();

            // Prepare the SQL statement
            String sql = "UPDATE [user] SET firstname=?, lastname=?, email=?, phone=? WHERE userid=?";
            preparedStatement = connection.prepareStatement(sql);

            // Set the parameters
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.setString(5, user.getUserID());

            // Execute the SQL statement
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        } finally {
            try {
                // Close the statement and connection
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.getMessage();
            }
        }
    }

}
