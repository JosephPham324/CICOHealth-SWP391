/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import dao.ExerciseDao;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
@Embeddable
public class WorkoutExercisesPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "workoutID")
    private String workoutID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "exerciseID")
    private String exerciseID;
    private Exercise exercise;

    public WorkoutExercisesPK() {
    }

    public WorkoutExercisesPK(String workoutID, String exerciseID) {
        this.workoutID = workoutID;
        this.setExerciseID(exerciseID);
    }

    public String getWorkoutID() {
        return workoutID;
    }

    public void setWorkoutID(String workoutID) {
        this.workoutID = workoutID;
    }

    public String getExerciseID() {
        return exerciseID;
    }

    public void setExerciseID(String exerciseID) {
        this.exerciseID = exerciseID;
        try {
            this.exercise = new ExerciseDao().getExerciseByID(exerciseID);
        } catch (SQLException ex) {
            Logger.getLogger(WorkoutExercisesPK.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Exercise getExercise() {
        return exercise;
    }
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (workoutID != null ? workoutID.hashCode() : 0);
        hash += (exerciseID != null ? exerciseID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof WorkoutExercisesPK)) {
            return false;
        }
        WorkoutExercisesPK other = (WorkoutExercisesPK) object;
        if ((this.workoutID == null && other.workoutID != null) || (this.workoutID != null && !this.workoutID.equals(other.workoutID))) {
            return false;
        }
        if ((this.exerciseID == null && other.exerciseID != null) || (this.exerciseID != null && !this.exerciseID.equals(other.exerciseID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.WorkoutExercisesPK[ workoutID=" + workoutID + ", exerciseID=" + exerciseID + " ]";
    }
    
}
