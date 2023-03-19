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
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
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
@Table(name = "ExerciseProgram")
@NamedQueries({
    @NamedQuery(name = "ExerciseProgram.findAll", query = "SELECT e FROM ExerciseProgram e")})
public class ExerciseProgram implements Serializable {

    @JoinColumn(name = "createdBy", referencedColumnName = "userID")
    @ManyToOne(optional = false)
    private User createdBy;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "programID")
    private String programID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "programName")
    private String programName;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "programDescription")
    private String programDescription;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "programID")
    private Collection<Workout> workoutCollection;
    

    public ExerciseProgram() {
    }

    public ExerciseProgram(String programID) {
        this.programID = programID;
    }

    public ExerciseProgram(String programID, String programName, String programDescription) {
        this.programID = programID;
        this.programName = programName;
        this.programDescription = programDescription;
    }

    
    public String getProgramID() {
        return programID;
    }

    public void setProgramID(String programID) {
        this.programID = programID;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    public String getProgramDescription() {
        return programDescription;
    }

    public void setProgramDescription(String programDescription) {
        this.programDescription = programDescription;
    }

    public Collection<Workout> getWorkoutCollection() {
        return workoutCollection;
    }

    public void setWorkoutCollection(Collection<Workout> workoutCollection) {
        this.workoutCollection = workoutCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (programID != null ? programID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExerciseProgram)) {
            return false;
        }
        ExerciseProgram other = (ExerciseProgram) object;
        if ((this.programID == null && other.programID != null) || (this.programID != null && !this.programID.equals(other.programID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ExerciseProgram{" + "programID=" + programID + ", programName=" + programName + ", programDescription=" + programDescription + ", workoutCollection=" + workoutCollection + '}';
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    
    
}
