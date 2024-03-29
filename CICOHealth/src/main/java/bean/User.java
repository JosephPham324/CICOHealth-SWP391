package bean;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
@Entity
@Table(name = "user")
public class User implements Serializable {

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "user")
    private ExpertProfile expertProfile;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userID")
    private Collection<Certification> certificationCollection;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "createdBy")
    private Collection<ExerciseProgram> exerciseProgramCollection;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userID")
    private Collection<ExerciseLog> exerciseLogCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "userID")
    private String userID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "firstName")
    private String firstName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "lastName")
    private String lastName;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "email")
    private String email;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "phone")
    private String phone;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "user")
    private Login login;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "user")
    private HealthInfo healthInfo;

    private boolean isBanned;

    public User() {
    }

    public User(String userID) {
        this.userID = userID;
    }

    public User(String userID, String firstName, String lastName, String email, String phone) {
        this.userID = userID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }

    public User(String userID, String firstName, String lastName) {
        this.userID = userID;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public User(String userID, String firstName, String lastName, String email, String phone, boolean isBanned) {
        this.userID = userID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.isBanned = isBanned;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
    }

    public HealthInfo getHealthInfo() {
        return healthInfo;
    }

    public void setHealthInfo(HealthInfo healthInfo) {
        this.healthInfo = healthInfo;
    }

    public boolean isIsBanned() {
        return isBanned;
    }

    public void setIsBanned(boolean isBanned) {
        this.isBanned = isBanned;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userID != null ? userID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.userID == null && other.userID != null) || (this.userID != null && !this.userID.equals(other.userID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.User[ userID=" + userID + " ]";
    }
    
    public String getUserRole(){
        return this.userID.substring(2,4);
    }

    public Collection<ExerciseLog> getExerciseLogCollection() {
        return exerciseLogCollection;
    }

    public void setExerciseLogCollection(Collection<ExerciseLog> exerciseLogCollection) {
        this.exerciseLogCollection = exerciseLogCollection;
    }

    public Collection<ExerciseProgram> getExerciseProgramCollection() {
        return exerciseProgramCollection;
    }

    public void setExerciseProgramCollection(Collection<ExerciseProgram> exerciseProgramCollection) {
        this.exerciseProgramCollection = exerciseProgramCollection;
    }

    public ExpertProfile getExpertProfile() {
        return expertProfile;
    }

    public void setExpertProfile(ExpertProfile expertProfile) {
        this.expertProfile = expertProfile;
    }

    public Collection<Certification> getCertificationCollection() {
        return certificationCollection;
    }

    public void setCertificationCollection(Collection<Certification> certificationCollection) {
        this.certificationCollection = certificationCollection;
    }

}
