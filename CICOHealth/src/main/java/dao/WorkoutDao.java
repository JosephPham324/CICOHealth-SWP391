package dao;

import bean.ExerciseProgram;
import bean.Workout;
import bean.WorkoutExercises;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class WorkoutDao extends BaseDao {

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

    public void insertWorkout(Workout workout) throws SQLException {
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
        System.out.println("");
        preparedStatement.setString(index++, workout.getWorkoutDescription());

        preparedStatement.executeUpdate();

        //Insert workout exercises
        for (WorkoutExercises exercise : workout.getWorkoutExercisesCollection()) {
            System.out.println(exercise.getWorkoutExercisesPK());
            exercise.getWorkoutExercisesPK().setWorkoutID(id);
            new WorkoutExerciseDao().insertExercise(exercise);
        }
    }

    public List<Workout> getProgramWorkoutsByWeekDay(String programID, int weekDay) throws SQLException {
        if (weekDay < 1 || weekDay > 7) {
            throw new SQLException("Weekday is out of range!");
        }
        String SQL_SELECT = "SELECT * FROM [Workout] WHERE programID = ? AND WorkoutDate = ?";
        List<Workout> res = null;
        connection = new DBContext().getConnection();
        preparedStatement = connection.prepareStatement(SQL_SELECT);
        preparedStatement.setString(1, programID);
        preparedStatement.setString(2, weekDay + "");
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            if (res == null) {
                res = new ArrayList();
            }
            Workout workout = new Workout();
            workout.setProgramID(new ExerciseProgram(programID));
            workout.setWorkoutID(resultSet.getString("workoutID"));
            workout.setWorkoutDate(resultSet.getString("workoutDate"));
            workout.setWorkoutName(resultSet.getString("workoutName"));
            workout.setWorkoutDescription(resultSet.getString("workoutDescription"));
            workout.setWorkoutExercisesCollection(new WorkoutExerciseDao().getExerciseByWorkoutID(workout.getWorkoutID()));
            res.add(workout);
        }
        return res;
    }

    public List<Workout> getWorkoutByProgramID(String ID) {
        List<Workout> workouts = new ArrayList<>();
        String sql = "select * from Workout \n"
                + "where programID = ? ";
        connection = new DBContext().getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, ID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Workout workout = new Workout(
                        resultSet.getString("programID"),
                        resultSet.getString("workoutID"),
                        resultSet.getString("workoutName"),
                        resultSet.getString("workoutDate"),
                        resultSet.getString("workoutDescription"));
                System.out.println(workout.getWorkoutDescription());
                workout.setWorkoutExercisesCollection(new WorkoutExerciseDao().getExerciseByWorkoutID(workout.getWorkoutID()));
                workouts.add(workout);
            }
        } catch (SQLException ex) {
            Logger.getLogger(WorkoutDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return workouts;
    }

    public static void main(String[] args) {
        List<Workout> list = new WorkoutDao().getWorkoutByProgramID("EXPG000001");
        for (Workout workout : list) {
            System.out.println(workout);
        }
    }
}
