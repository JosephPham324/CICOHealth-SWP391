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

    public void insertExercise(WorkoutExercises exercise) throws SQLException {
        String QUERY_INSERT = "INSERT INTO WorkoutExercises (workoutID, exerciseID, exerciseOrder, [set], reps, weight, duration, instruction)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        System.out.println(exercise.getReps());
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
        closeConnections();
    }

    public void updateWorkoutExercise(WorkoutExercises exercise) throws SQLException {
        String QUERY_UPDATE = "UPDATE [workoutExercises] SET "
                + "instruction = ?,"
                + "order = ?,"
                + "set = ?,"
                + "reps = ?,"
                + "weight = ? "
                + "WHERE workoutID = ? AND exerciseID = ?";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(QUERY_UPDATE);
        int i = 1;
        preparedStatement.setString(i++, exercise.getInstruction());
        preparedStatement.setString(i++, exercise.getExerciseOrder() + "");
        preparedStatement.setString(i++, exercise.getSet() + "");
        preparedStatement.setString(i++, exercise.getReps() + "");
        preparedStatement.setString(i++, exercise.getWeight());
        preparedStatement.setString(i++, exercise.getWorkoutExercisesPK().getWorkoutID());
        preparedStatement.setString(i++, exercise.getWorkoutExercisesPK().getExerciseID());
        preparedStatement.executeUpdate();
        closeConnections();
    }

    public void removeWorkoutExercise(WorkoutExercisesPK exercisePK) throws SQLException {
        String QUERY_DELETE = "DELETE FROM [workoutExercises] WHERE workoutID = ? AND exerciseID = ?";
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(QUERY_DELETE);
        preparedStatement.setString(1, exercisePK.getWorkoutID());
        preparedStatement.setString(2, exercisePK.getExerciseID());
        preparedStatement.executeUpdate();
        closeConnections();
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
                WorkoutExercises workoutExercise = new WorkoutExercises();
                WorkoutExercisesPK pk = new WorkoutExercisesPK();
                pk.setWorkoutID(resultSet.getString("workoutID"));
                pk.setExerciseID(resultSet.getString("exerciseID"));
                //Set values
                workoutExercise.setWorkoutExercisesPK(pk);
                workoutExercise.setExerciseOrder(resultSet.getInt("exerciseOrder"));
                workoutExercise.setDuration(resultSet.getInt("duration"));
                workoutExercise.setSet(resultSet.getInt("set"));
                workoutExercise.setReps(resultSet.getString("reps"));
                workoutExercise.setWeight(resultSet.getString("weight"));
                workoutExercise.setInstruction(resultSet.getString("weight"));
                System.out.println(workoutExercise.getReps());
                workoutExercies.add(workoutExercise);
            }
        } catch (SQLException ex) {
            Logger.getLogger(WorkoutExerciseDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnections();
        }
        return workoutExercies;
    }
}
