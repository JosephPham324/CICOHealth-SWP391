package dao;

import bean.Certification;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class CertificationDao extends BaseDao {

    @Override
    public String createID() {
        //Query to get the latest ID
        String query = "SELECT TOP 1 certID\n"
                + "from [certification] \n"
                + "ORDER BY certID DESC ";
        String id = null;
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record in the table
                //Generate new ID based on the record
                id = "CERT" + String.format("%06d", Integer.parseInt(resultSet.getString("certID").substring(4)) + 1);
            } else {
                id = "CERT000001";
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnections();
        }
        return id;
    }

    @Override
    public String createID(String type) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void insertCertification(Certification certification) throws SQLException {
        // generate the certification ID
        String certID = createID();
        certification.setCertID(certID);

        // prepare the INSERT query
        String query = "INSERT INTO certification (userID, certID, certName, certIssuer, certDate, certPhoto) VALUES (?, ?, ?, ?, ?, ?)";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);

        // set the values of the parameters in the query
        preparedStatement.setString(1, certification.getUserID());
        preparedStatement.setString(2, certID);
        preparedStatement.setString(3, certification.getCertName());
        preparedStatement.setString(4, certification.getCertIssuer());
        preparedStatement.setString(5, util.Utility.getDateOrTime(certification.getCertDate(), "date"));
        preparedStatement.setString(6, certification.getCertPhoto());

        // execute the query
        preparedStatement.executeUpdate();
    }

    public void updateCertification(Certification certification) throws SQLException {
        // prepare the UPDATE query
        String query = "UPDATE certification SET certName = ?, certIssuer = ?, certDate = ?, certPhoto = ? WHERE certID = ?";
        connection = new DBContext().getConnection();

        preparedStatement = connection.prepareStatement(query);

        // set the values of the parameters in the query
        try {
            preparedStatement.setString(1, certification.getCertName());
            preparedStatement.setString(2, certification.getCertIssuer());
            preparedStatement.setString(3, util.Utility.getDateOrTime(certification.getCertDate(), "date"));
            preparedStatement.setString(4, certification.getCertPhoto());
            preparedStatement.setString(5, certification.getCertID());
        } catch (Exception ex) {
            Logger.getLogger(CertificationDao.class.getName()).log(Level.SEVERE, null, ex);

        }

        // execute the query
        preparedStatement.executeUpdate();

        closeConnections();
    }

    public void deleteCertification(String certID) throws SQLException {
        // prepare the DELETE query
        String query = "DELETE FROM certification WHERE certID = ?";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);

        // set the value of the parameter in the query
        preparedStatement.setString(1, certID);

        // execute the query
        preparedStatement.executeUpdate();
        closeConnections();
    }

    public List<Certification> getUserCertifications(String userID) throws SQLException {
        String QUERY_SELECT = "SELECT * FROM [Certification]\n"
                + "WHERE userID = ?";
        List<Certification> certifications = new ArrayList<Certification>();
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(QUERY_SELECT);

        preparedStatement.setString(1, userID);

        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Certification cert = new Certification(userID);
            cert.setCertID(resultSet.getString("certID"));
            cert.setCertName(resultSet.getString("certName"));
            cert.setCertDate(resultSet.getDate("certDate"));
            cert.setCertIssuer(resultSet.getString("certIssuer"));
            cert.setCertPhoto(resultSet.getString("certPhoto"));
            certifications.add(cert);
        }
        closeConnections();
        return certifications;
    }

    public void updateProfileCertification(String userID, List<Certification> certifications, List<String> actions) throws SQLException {
        int index = 0;
        for (Certification cert : certifications) {
            closeConnections();
            cert.setUserID(userID);
            String action = actions.get(index);
            if (action.equalsIgnoreCase("insert")) {
                this.insertCertification(cert);
            } else if (action.equalsIgnoreCase("update")) {
                this.updateCertification(cert);
            } else if (action.equalsIgnoreCase("delete")) {
                this.deleteCertification(cert.getCertID());
            }
            index++;
        }
    }

    public static void main(String[] args) {
        Certification cert = new Certification("CERT000001", "lol", "lol", new Date(), "lol.html");
        try {
            new CertificationDao().updateCertification(cert);
        } catch (SQLException ex) {
            Logger.getLogger(CertificationDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
