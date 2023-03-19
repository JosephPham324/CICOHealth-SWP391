package bean;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
@Entity
@Table(name = "healthInfo")
public class HealthInfo implements Serializable {

    private static final long serialVersionUID = 1L;
    private String healthInfoID;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "userID")
    private String userID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gender")
    private boolean gender;
    @Basic(optional = false)
    @NotNull
    @Column(name = "height")
    private double height;
    @Basic(optional = false)
    @NotNull
    @Column(name = "weight")
    private double weight;
    @Basic(optional = false)
    @NotNull
    @Column(name = "age")
    private int age;
    @Basic(optional = false)
    @NotNull
    @Column(name = "activeness")
    private int activeness;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tdee")
    private int tdee;
    @Basic(optional = false)
    @NotNull
    @Column(name = "dailyCalorie")
    private double dailyCalorie;
    @Basic(optional = false)
    @NotNull
    @Column(name = "dailyProtein")
    private double dailyProtein;
    @Basic(optional = false)
    @NotNull
    @Column(name = "dailyFat")
    private double dailyFat;
    @Basic(optional = false)
    @NotNull
    @Column(name = "dailyCarb")
    private double dailyCarb;
    private String createdDate;
    @JoinColumn(name = "userID", referencedColumnName = "userID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private User user;

    public HealthInfo(String healthInfoID, String userID, boolean gender, double height, double weight, int age, int activeness, int tdee, double dailyCalorie, double dailyProtein, double dailyFat, double dailyCarb, String createdDate) {
        this.healthInfoID = healthInfoID;
        this.userID = userID;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.age = age;
        this.activeness = activeness;
        this.tdee = tdee;
        this.dailyCalorie = dailyCalorie;
        this.dailyProtein = dailyProtein;
        this.dailyFat = dailyFat;
        this.dailyCarb = dailyCarb;
        this.createdDate = createdDate;
    }

    public HealthInfo() {
        this.activeness = 0;
        this.dailyCalorie = 0;
        this.dailyCarb = 0;
        this.dailyFat = 0;
        this.dailyProtein = 0;
    }

    public HealthInfo(String userID) {
        this.userID = userID;
    }

    public HealthInfo(String userID, boolean gender, double height, double weight, int age, int activeness, int tdee, double dailyCalorie, double dailyProtein, double dailyFat, double dailyCarb) {
        this.userID = userID;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.age = age;
        this.activeness = activeness;
        this.tdee = tdee;
        this.dailyCalorie = dailyCalorie;
        this.dailyProtein = dailyProtein;
        this.dailyFat = dailyFat;
        this.dailyCarb = dailyCarb;
    }

    public HealthInfo(String healthInfoID, String userID, boolean gender, double height, double weight, int age, int activeness, int tdee, double dailyCalorie, double dailyProtein, double dailyFat, double dailyCarb) {
        this.healthInfoID = healthInfoID;
        this.userID = userID;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.age = age;
        this.activeness = activeness;
        this.tdee = tdee;
        this.dailyCalorie = dailyCalorie;
        this.dailyProtein = dailyProtein;
        this.dailyFat = dailyFat;
        this.dailyCarb = dailyCarb;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getHealthInfoID() {
        return healthInfoID;
    }

    public void setHealthInfoID(String healthInfoID) {
        this.healthInfoID = healthInfoID;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getActiveness() {
        return activeness;
    }

    public void setActiveness(int activeness) {
        this.activeness = activeness;
    }

    public int getTdee() {
        return tdee;
    }

    public void setTdee(int tdee) {
        this.tdee = tdee;
    }

    public double getDailyCalorie() {
        return dailyCalorie;
    }

    public void setDailyCalorie(double dailyCalorie) {
        this.dailyCalorie = dailyCalorie;
    }

    public double getDailyProtein() {
        return dailyProtein;
    }

    public void setDailyProtein(double dailyProtein) {
        this.dailyProtein = dailyProtein;
    }

    public double getDailyFat() {
        return dailyFat;
    }

    public void setDailyFat(double dailyFat) {
        this.dailyFat = dailyFat;
    }

    public double getDailyCarb() {
        return dailyCarb;
    }

    public void setDailyCarb(double dailyCarb) {
        this.dailyCarb = dailyCarb;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
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
        if (!(object instanceof HealthInfo)) {
            return false;
        }
        HealthInfo other = (HealthInfo) object;
        if ((this.userID == null && other.userID != null) || (this.userID != null && !this.userID.equals(other.userID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "HealthInfo{" + "userID=" + userID + ", gender=" + gender + ", height=" + height + ", weight=" + weight + ", age=" + age + ", activeness=" + activeness + ", tdee=" + tdee + ", dailyCalorie=" + dailyCalorie + ", dailyProtein=" + dailyProtein + ", dailyFat=" + dailyFat + ", dailyCarb=" + dailyCarb + ", user=" + user + '}';
    }
}
