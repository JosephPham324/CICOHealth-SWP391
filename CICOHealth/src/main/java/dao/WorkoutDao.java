
package dao;

import bean.Workout;
import bean.WorkoutExercises;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class WorkoutDao extends BaseDao{

    @Override
    public String createID() {
        //Query to get the latest ID
        String query = "SELECT TOP 1 workoutID\n"
                + "from [Workout] \n"
                + "ORDER BY workoutID DESC ";
        String id = null;
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {//If there is a record in the table
                //Generate new ID based on the record
                id = "PGWO" + String.format("%06d", Integer.parseInt(resultSet.getString("workoutID").substring(4)) + 1);
            } else {
                id = "PGWO000001";
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
    
    public void insertWorkout(Workout workout) throws SQLException{
        //Generate workout ID
        String id = createID();
        
        //Insert workout first
        String QUERY_INSERT = "INSERT INTO [Workout] VALUES(?,?,?,?,?)";
        
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(QUERY_INSERT);
        int index = 1;
        preparedStatement.setString(index++, workout.getProgramID().getProgramID());
        preparedStatement.setString(index++, id);
        preparedStatement.setString(index++, workout.getWorkoutName());
        preparedStatement.setString(index++, workout.getWorkoutDate());
        preparedStatement.setString(index++, workout.getWorkoutDescription());
        
        preparedStatement.executeUpdate();
        
        //Insert workout exercises
        for (WorkoutExercises exercise : workout.getWorkoutExercisesCollection()){
            System.out.println(exercise.getWorkoutExercisesPK());
            exercise.getWorkoutExercisesPK().setWorkoutID(id);
            new WorkoutExerciseDao().insertExercise(exercise);
        }
    }
}
