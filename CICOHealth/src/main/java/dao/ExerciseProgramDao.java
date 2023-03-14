package dao;

import bean.ExerciseProgram;
import bean.User;
import bean.Workout;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class ExerciseProgramDao extends BaseDao {

    @Override
    public String createID() {
        //Query to get the latest ID
        String query = "SELECT TOP 1 programID\n"
                + "from [ExerciseProgram] \n"
                + "ORDER BY programID DESC ";
        String id = null;
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record in the table
                //Generate new ID based on the record
                id = "EXPG" + String.format("%06d", Integer.parseInt(resultSet.getString("programID").substring(4)) + 1);
            } else {
                id = "EXPG000001";
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

    public void insertProgram(ExerciseProgram program) throws SQLException {
        String programID = createID();
        program.setProgramID(programID);

        //Insert program first
        String QUERY_INSERT = "INSERT INTO [ExerciseProgram] VALUES(?,?,?,?)";

        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(QUERY_INSERT);
        int index = 1;
        preparedStatement.setString(index++, programID);
        preparedStatement.setString(index++, program.getCreatedBy().getUserID());
        preparedStatement.setString(index++, program.getProgramName());
        preparedStatement.setString(index++, program.getProgramDescription());
        preparedStatement.executeUpdate();

        //Insert workouts
        for (Workout workout : program.getWorkoutCollection()) {
            //Set the program ID
            workout.setProgramID(program);
            new WorkoutDao().insertWorkout(workout);
        }
    }

    public List<ExerciseProgram> getAllPrograms() {
        List<ExerciseProgram> programs = new ArrayList<>();
        try {
            connection = new DBContext().getConnection();
            String sql = "select * from ExerciseProgram";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            // Iterate through the result set and create ExerciseProgram objects for each row
            while (resultSet.next()) {
                ExerciseProgram program = new ExerciseProgram();
                program.setProgramID(resultSet.getString("programID"));
                String userID = resultSet.getString("createdBy");
                program.setCreatedBy(new UserDao().getUser(userID));
                program.setProgramName(resultSet.getString("programName"));
                program.setProgramDescription(resultSet.getString("programDescription"));
                programs.add(program);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExerciseProgramDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnections();
        }
        return programs;
    }
    
    public void deleteProgram(String programID) throws SQLException {
        // Delete all the workouts associated with the program
        // Delete the program
        String QUERY_DELETE = "DELETE FROM [ExerciseProgram] WHERE programID = ?";

        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(QUERY_DELETE);
        preparedStatement.setString(1, programID);
        preparedStatement.executeUpdate();
        closeConnections();
    }
    
    
    
}
