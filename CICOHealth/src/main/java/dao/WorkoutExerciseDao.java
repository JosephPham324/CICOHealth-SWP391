package dao;

import bean.WorkoutExercises;
import bean.WorkoutExercisesPK;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
        preparedStatement.setString(index++, exercise.getExerciseOrder() + "");
        preparedStatement.setString(index++, exercise.getSet() + "");
        preparedStatement.setString(index++, exercise.getReps());
        preparedStatement.setString(index++, exercise.getWeight());
        preparedStatement.setString(index++, exercise.getDuration() + "");
        preparedStatement.setString(index++, exercise.getInstruction());

        preparedStatement.executeUpdate();
    }

    public List<WorkoutExercises> getExerciseByWorkoutID(String id) {
        List<WorkoutExercises> workoutExercies = new ArrayList<>();
        connection = new DBContext().getConnection();
        String sql = "select * from WorkoutExercises\n"
                + "where workoutID = ?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                WorkoutExercisesPK pk = new WorkoutExercisesPK();
                pk.setWorkoutID(resultSet.getString("workoutID"));
                pk.setExerciseID(resultSet.getString("exerciseID"));
                WorkoutExercises workoutExercise = new WorkoutExercises(pk, resultSet.getInt("exerciseOrder"), resultSet.getInt("set"), resultSet.getString("reps"),
                        resultSet.getString("weight"), resultSet.getInt("duration"),
                         resultSet.getDouble("calorieBurnt"), resultSet.getString("instruction"));
                workoutExercies.add(workoutExercise);
            }
        } catch (SQLException ex) {
            Logger.getLogger(WorkoutExerciseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return workoutExercies;
    }
}
