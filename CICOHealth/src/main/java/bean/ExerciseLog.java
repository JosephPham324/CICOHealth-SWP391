/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
@Entity
@Table(name = "ExerciseLog")
@NamedQueries({
    @NamedQuery(name = "ExerciseLog.findAll", query = "SELECT e FROM ExerciseLog e")})
public class ExerciseLog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "exerciseLogID")
    private String exerciseLogID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "logTime")
    @Temporal(TemporalType.TIME)
    private Date logTime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "logDate")
    @Temporal(TemporalType.DATE)
    @Expose
    private Date logDate;
    @Column(name = "set")
    private Integer set;
    @Column(name = "rep")
    private String rep;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "weight")
    private String weight;
    @Column(name = "timeSpent")
    @Expose
    private Integer timeSpent;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "logNote")
    private String logNote;
    @JoinColumn(name = "exerciseID", referencedColumnName = "exerciseID")
    @ManyToOne(optional = false)
    private String exerciseID;
    private Exercise exercise;
    @JoinColumn(name = "userID", referencedColumnName = "userID")
    @ManyToOne(optional = false)
    private String userID;
    @Expose
    private double caloriesBurnt;

    public ExerciseLog() {
    }

    public ExerciseLog(String exerciseLogID) {
        this.exerciseLogID = exerciseLogID;
    }

    public Exercise getExercise() {
        return exercise;
    }

    public void setExercise(Exercise exercise) {
        this.exercise = exercise;
    }

    public ExerciseLog(String exerciseLogID, Date logTime, Date logDate) {
        this.exerciseLogID = exerciseLogID;
        this.logTime = logTime;
        this.logDate = logDate;
    }

    public ExerciseLog(String exerciseLogID, Integer set, String rep, String weight, Exercise exercise, String userID) {
        this.exerciseLogID = exerciseLogID;
        this.set = set;
        this.rep = rep;
        this.weight = weight;
        this.exercise = exercise;
        this.userID = userID;
        System.out.println("what the fuck");
        this.setCaloriesBurnt();
    }

    public ExerciseLog(String exerciseLogID, Date logTime, Date logDate, Integer set, String rep, String weight, Integer timeSpent, String logNote, String exerciseID, Exercise exercise, String userID) {
        this.exerciseLogID = exerciseLogID;
        this.logTime = logTime;
        this.logDate = logDate;
        this.set = set;
        this.rep = rep;
        this.weight = weight;
        this.timeSpent = timeSpent;
        this.logNote = logNote;
        this.exerciseID = exerciseID;
        this.exercise = exercise;
        this.userID = userID;
        System.out.println("what the fuck");
        this.setCaloriesBurnt();
    }

    public String getExerciseLogID() {
        return exerciseLogID;
    }

    public void setExerciseLogID(String exerciseLogID) {
        this.exerciseLogID = exerciseLogID;
    }

    public Date getLogTime() {
        return logTime;
    }

    public void setLogTime(Date logTime) {
        this.logTime = logTime;
    }

    public Date getLogDate() {
        return logDate;
    }

    public void setLogDate(Date logDate) {
        this.logDate = logDate;
    }

    public Integer getSet() {
        return set;
    }

    public void setSet(Integer set) {
        this.set = set;
    }

    public String getRep() {
        return rep;
    }

    public void setRep(String rep) {
        this.rep = rep;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public Integer getTimeSpent() {
        return timeSpent;
    }

    public void setTimeSpent(Integer timeSpent) {
        this.timeSpent = timeSpent;
    }

    public String getLogNote() {
        return logNote;
    }

    public void setLogNote(String logNote) {
        this.logNote = logNote;
    }

    public String getExerciseID() {
        return exerciseID;
    }

    public void setExerciseID(String exerciseID) {
        this.exerciseID = exerciseID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (exerciseLogID != null ? exerciseLogID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExerciseLog)) {
            return false;
        }
        ExerciseLog other = (ExerciseLog) object;
        if ((this.exerciseLogID == null && other.exerciseLogID != null) || (this.exerciseLogID != null && !this.exerciseLogID.equals(other.exerciseLogID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ExerciseLog{" + "exerciseLogID=" + exerciseLogID + ", logTime=" + logTime + ", logDate=" + logDate + ", set=" + set + ", rep=" + rep + ", weight=" + weight + ", timeSpent=" + timeSpent + ", logNote=" + logNote + ", exerciseID=" + exerciseID + ", userID=" + userID + '}';
    }

    public String getExerciseType() {
        return this.exerciseID.substring(2, 4);
    }

    public void setCaloriesBurnt() {
        this.caloriesBurnt = calculateCaloriesBurnt();
    }

    public double getCaloriesBurnt() {
        setCaloriesBurnt();
        System.out.println("why the fuck");
        return this.caloriesBurnt;
    }

    public final double calculateCaloriesBurnt() {
        return this.exercise.getCaloriesPerHour() * (this.timeSpent / 60);
    }
}
