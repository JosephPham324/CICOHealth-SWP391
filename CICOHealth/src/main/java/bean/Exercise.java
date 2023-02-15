/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author Admin
 */
public class Exercise {

    private String exerciseID;
    private String exerciseName;
    private String exerciseDescription;
    private Double caloriesPerHour;

    public Exercise() {
    }

    public Exercise(String exerciseID, String exerciseName, String exerciseDescription, Double caloriesPerHour) {
        this.exerciseID = exerciseID;
        this.exerciseName = exerciseName;
        this.exerciseDescription = exerciseDescription;
        this.caloriesPerHour = caloriesPerHour;
    }

    public String getExerciseID() {
        return exerciseID;
    }

    public void setExerciseID(String exerciseID) {
        this.exerciseID = exerciseID;
    }

    public String getExerciseName() {
        return exerciseName;
    }

    public void setExerciseName(String exerciseName) {
        this.exerciseName = exerciseName;
    }

    public String getExerciseDescription() {
        return exerciseDescription;
    }

    public void setExerciseDescription(String exerciseDescription) {
        this.exerciseDescription = exerciseDescription;
    }

    public Double getCaloriesPerHour() {
        return caloriesPerHour;
    }

    public void setCaloriesPerHour(Double caloriesPerHour) {
        this.caloriesPerHour = caloriesPerHour;
    }
}
