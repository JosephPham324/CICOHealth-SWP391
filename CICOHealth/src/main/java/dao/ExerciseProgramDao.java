
package dao;

import bean.ExerciseProgram;
import bean.Workout;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class ExerciseProgramDao extends BaseDao{

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
    
    public void insertProgram(ExerciseProgram program) throws SQLException{
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
        for (Workout workout : program.getWorkoutCollection()){
            //Set the program ID
            workout.setProgramID(program);
            new WorkoutDao().insertWorkout(workout);
        }
    }
}
