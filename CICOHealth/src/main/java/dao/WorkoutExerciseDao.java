package dao;

import bean.WorkoutExercises;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class WorkoutExerciseDao extends BaseDao {

    @Override
    public String createID() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String createID(String type) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    void insertExercise(WorkoutExercises exercise) throws SQLException {
        String QUERY_INSERT = "INSERT INTO WorkoutExercises (workoutID, exerciseID, exerciseOrder, [set], reps, weight, duration, instruction)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(QUERY_INSERT);
        int index = 1;
        preparedStatement.setString(index++, exercise.getWorkoutExercisesPK().getWorkoutID());
        preparedStatement.setString(index++, exercise.getWorkoutExercisesPK().getExerciseID());
        preparedStatement.setString(index++, exercise.getExerciseOrder()+"");
        preparedStatement.setString(index++, exercise.getSet()+"");
        preparedStatement.setString(index++, exercise.getReps());
        preparedStatement.setString(index++, exercise.getWeight());
        preparedStatement.setString(index++, exercise.getDuration()+"");
        preparedStatement.setString(index++, exercise.getInstruction());

        preparedStatement.executeUpdate();
    }

}
