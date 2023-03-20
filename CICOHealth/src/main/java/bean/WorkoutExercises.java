/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
@Entity
@Table(name = "WorkoutExercises")
@NamedQueries({
    @NamedQuery(name = "WorkoutExercises.findAll", query = "SELECT w FROM WorkoutExercises w")})
public class WorkoutExercises implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected WorkoutExercisesPK workoutExercisesPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "exerciseOrder")
    private int exerciseOrder;
    @Column(name = "set")
    private Integer set;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "reps")
    private String reps;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "weight")
    private String weight;
    @Column(name = "duration")
    private Integer duration;
    @Column(name = "calorieBurnt")
    private Double calorieBurnt;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "instruction")
    private String instruction;
    @JoinColumn(name = "workoutID", referencedColumnName = "workoutID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Workout workout;
    
    private String action;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public WorkoutExercises() {
    }

    public WorkoutExercises(WorkoutExercisesPK workoutExercisesPK, int exerciseOrder, Integer set, String reps, String weight, Integer duration, Double calorieBurnt, String instruction) {
        this.workoutExercisesPK = workoutExercisesPK;
        this.exerciseOrder = exerciseOrder;
        this.set = set;
        this.reps = reps;
        this.weight = weight;
        this.duration = duration;
        this.calorieBurnt = calorieBurnt;
        this.instruction = instruction;
    } 

    public WorkoutExercises(WorkoutExercisesPK workoutExercisesPK) {
        this.workoutExercisesPK = workoutExercisesPK;
    }

    public WorkoutExercises(WorkoutExercisesPK workoutExercisesPK, int exerciseOrder, String instruction) {
        this.workoutExercisesPK = workoutExercisesPK;
        this.exerciseOrder = exerciseOrder;
        this.instruction = instruction;
    }

    public WorkoutExercises(String workoutID, String exerciseID) {
        this.workoutExercisesPK = new WorkoutExercisesPK(workoutID, exerciseID);
    }

    public WorkoutExercisesPK getWorkoutExercisesPK() {
        return workoutExercisesPK;
    }

    public void setWorkoutExercisesPK(WorkoutExercisesPK workoutExercisesPK) {
        this.workoutExercisesPK = workoutExercisesPK;
    }

    public int getExerciseOrder() {
        return exerciseOrder;
    }

    public void setExerciseOrder(int exerciseOrder) {
        this.exerciseOrder = exerciseOrder;
    }

    public Integer getSet() {
        return set;
    }

    public void setSet(Integer set) {
        this.set = set;
    }

    public String getReps() {
        return reps;
    }

    public void setReps(String reps) {
        this.reps = reps;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Double getCalorieBurnt() {
        return calorieBurnt;
    }

    public void setCalorieBurnt(Double calorieBurnt) {
        this.calorieBurnt = calorieBurnt;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public Workout getWorkout() {
        return workout;
    }

    public void setWorkout(Workout workout) {
        this.workout = workout;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (workoutExercisesPK != null ? workoutExercisesPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof WorkoutExercises)) {
            return false;
        }
        WorkoutExercises other = (WorkoutExercises) object;
        if ((this.workoutExercisesPK == null && other.workoutExercisesPK != null) || (this.workoutExercisesPK != null && !this.workoutExercisesPK.equals(other.workoutExercisesPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.WorkoutExercises[ workoutExercisesPK=" + workoutExercisesPK + " ]";
    }
    
}
