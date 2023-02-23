/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

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
    private Date logDate;
    @Column(name = "set")
    private Integer set;
    @Column(name = "rep")
    private Integer rep;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "weight")
    private Double weight;
    @Column(name = "timeSpent")
    private Integer timeSpent;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "logNote")
    private String logNote;
    @JoinColumn(name = "exerciseID", referencedColumnName = "exerciseID")
    @ManyToOne(optional = false)
    private String exerciseID;
    @JoinColumn(name = "userID", referencedColumnName = "userID")
    @ManyToOne(optional = false)
    private User userID;

    public ExerciseLog() {
    }

    public ExerciseLog(String exerciseLogID) {
        this.exerciseLogID = exerciseLogID;
    }

    public ExerciseLog(String exerciseLogID, Date logTime, Date logDate) {
        this.exerciseLogID = exerciseLogID;
        this.logTime = logTime;
        this.logDate = logDate;
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

    public Integer getRep() {
        return rep;
    }

    public void setRep(Integer rep) {
        this.rep = rep;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
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

    public User getUserID() {
        return userID;
    }

    public void setUserID(User userID) {
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
    
}
