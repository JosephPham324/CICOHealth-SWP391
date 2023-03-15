package dao;

import bean.Certification;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class CertificationDao extends BaseDao {

    @Override
    public String createID() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
        preparedStatement.setString(1, certification.getUserID().getUserID());
        preparedStatement.setString(2, certID);
        preparedStatement.setString(3, certification.getCertName());
        preparedStatement.setString(4, certification.getCertIssuer());
        preparedStatement.setString(5, certification.getCertDate().toString());
        preparedStatement.setString(6, certification.getCertPhoto());

        // execute the query
        preparedStatement.executeUpdate();
    }

    public void updateCertification(Certification certification) throws SQLException {
        // prepare the UPDATE query
        String query = "UPDATE certification SET userID = ?, certName = ?, certIssuer = ?, certDate = ?, certPhoto = ? WHERE certID = ?";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(query);

        // set the values of the parameters in the query
        preparedStatement.setString(1, certification.getUserID().getUserID());
        preparedStatement.setString(2, certification.getCertName());
        preparedStatement.setString(3, certification.getCertIssuer());
        preparedStatement.setString(4, certification.getCertDate().toString());
        preparedStatement.setString(5, certification.getCertPhoto());
        preparedStatement.setString(6, certification.getCertID());

        // execute the query
        preparedStatement.executeUpdate();
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
        return certifications;
    }
}
