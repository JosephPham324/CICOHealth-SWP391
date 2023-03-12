/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
@Entity
@Table(name = "Workout")
@NamedQueries({
    @NamedQuery(name = "Workout.findAll", query = "SELECT w FROM Workout w")})
public class Workout implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "workoutID")
    private String workoutID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "workoutName")
    private String workoutName;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "workoutDate")
    private String workoutDate;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "workoutDescription")
    private String workoutDescription;
    @JoinColumn(name = "programID", referencedColumnName = "programID")
    @ManyToOne(optional = false)
    private ExerciseProgram programID;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "workout")
    private Collection<WorkoutExercises> workoutExercisesCollection;

    public Workout() {
    }

    public Workout(String workoutID) {
        this.workoutID = workoutID;
    }

    public Workout(String workoutID, String workoutName, String workoutDate, String workoutDescription) {
        this.workoutID = workoutID;
        this.workoutName = workoutName;
        this.workoutDate = workoutDate;
        this.workoutDescription = workoutDescription;
    }

    public String getWorkoutID() {
        return workoutID;
    }

    public void setWorkoutID(String workoutID) {
        this.workoutID = workoutID;
    }

    public String getWorkoutName() {
        return workoutName;
    }

    public void setWorkoutName(String workoutName) {
        this.workoutName = workoutName;
    }

    public String getWorkoutDate() {
        return workoutDate;
    }

    public void setWorkoutDate(String workoutDate) {
        this.workoutDate = workoutDate;
    }

    public String getWorkoutDescription() {
        return workoutDescription;
    }

    public void setWorkoutDescription(String workoutDescription) {
        this.workoutDescription = workoutDescription;
    }

    public ExerciseProgram getProgramID() {
        return programID;
    }

    public void setProgramID(ExerciseProgram programID) {
        this.programID = programID;
    }

    public Collection<WorkoutExercises> getWorkoutExercisesCollection() {
        return workoutExercisesCollection;
    }

    public void setWorkoutExercisesCollection(Collection<WorkoutExercises> workoutExercisesCollection) {
        this.workoutExercisesCollection = workoutExercisesCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (workoutID != null ? workoutID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Workout)) {
            return false;
        }
        Workout other = (Workout) object;
        if ((this.workoutID == null && other.workoutID != null) || (this.workoutID != null && !this.workoutID.equals(other.workoutID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.Workout[ workoutID=" + workoutID + " ]";
    }
    
}
