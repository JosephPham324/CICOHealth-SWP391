/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
@NamedQueries({
    @NamedQuery(name = "HealthInfo.findAll", query = "SELECT h FROM HealthInfo h"),
    @NamedQuery(name = "HealthInfo.findByUserID", query = "SELECT h FROM HealthInfo h WHERE h.userID = :userID"),
    @NamedQuery(name = "HealthInfo.findByGender", query = "SELECT h FROM HealthInfo h WHERE h.gender = :gender"),
    @NamedQuery(name = "HealthInfo.findByHeight", query = "SELECT h FROM HealthInfo h WHERE h.height = :height"),
    @NamedQuery(name = "HealthInfo.findByWeight", query = "SELECT h FROM HealthInfo h WHERE h.weight = :weight"),
    @NamedQuery(name = "HealthInfo.findByAge", query = "SELECT h FROM HealthInfo h WHERE h.age = :age"),
    @NamedQuery(name = "HealthInfo.findByActiveness", query = "SELECT h FROM HealthInfo h WHERE h.activeness = :activeness"),
    @NamedQuery(name = "HealthInfo.findByTdee", query = "SELECT h FROM HealthInfo h WHERE h.tdee = :tdee"),
    @NamedQuery(name = "HealthInfo.findByDailyCalorie", query = "SELECT h FROM HealthInfo h WHERE h.dailyCalorie = :dailyCalorie"),
    @NamedQuery(name = "HealthInfo.findByDailyProtein", query = "SELECT h FROM HealthInfo h WHERE h.dailyProtein = :dailyProtein"),
    @NamedQuery(name = "HealthInfo.findByDailyFat", query = "SELECT h FROM HealthInfo h WHERE h.dailyFat = :dailyFat"),
    @NamedQuery(name = "HealthInfo.findByDailyCarb", query = "SELECT h FROM HealthInfo h WHERE h.dailyCarb = :dailyCarb")})
public class HealthInfo implements Serializable {

    private static final long serialVersionUID = 1L;
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
    @JoinColumn(name = "userID", referencedColumnName = "userID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private User user;

    public HealthInfo() {
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
        return "bean.HealthInfo[ userID=" + userID + " ]";
    }
    
}
