/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
@Entity
@Table(name = "mealLog")
@NamedQueries({
    @NamedQuery(name = "MealLog.findAll", query = "SELECT m FROM MealLog m")})
public class MealLog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "mealLogID")
    private String mealLogID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "mealLogName")
    private String mealLogName;
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
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "logNote")
    private String logNote;
    @JoinColumn(name = "userID", referencedColumnName = "userID")
    @ManyToOne(optional = false)
    private String userID;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "mealLogID")
    private ArrayList<MealLogItem> foods;
    private Double[] nutrition;

    public MealLog() {
    }

    public MealLog(String mealLogID) {
        this.mealLogID = mealLogID;
    }

    public MealLog(String mealLogID, String mealLogName, Date logTime, Date logDate, String logNote) {
        this.mealLogID = mealLogID;
        this.mealLogName = mealLogName;
        this.logTime = logTime;
        this.logDate = logDate;
        this.logNote = logNote;
    }

    public MealLog(String mealLogID, String mealLogName, Date logTime, Date logDate, String userID, ArrayList<MealLogItem> mealLogItemCollection) {
        this.mealLogID = mealLogID;
        this.mealLogName = mealLogName;
        this.logTime = logTime;
        this.logDate = logDate;
        this.userID = userID;
        this.foods = mealLogItemCollection;
        this.setNutrition();
    }

    public MealLog(ArrayList<MealLogItem> foods) {
        this.mealLogID = null;
        this.userID = null;
        this.logDate = null;
        this.logTime = null;
        this.logNote = null;
        this.mealLogName = null;
        this.foods = foods;
        
    }
    
    

    public String getMealLogID() {
        return mealLogID;
    }

    public void setMealLogID(String mealLogID) {
        this.mealLogID = mealLogID;
    }

    public String getMealLogName() {
        return mealLogName;
    }

    public void setMealLogName(String mealLogName) {
        this.mealLogName = mealLogName;
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

    public String getLogNote() {
        return logNote;
    }

    public void setLogNote(String logNote) {
        this.logNote = logNote;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public ArrayList<MealLogItem> getFoods() {
        return foods;
    }

    public void setFoods(ArrayList<MealLogItem> foods) {
        this.foods = foods;
        this.setNutrition();
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mealLogID != null ? mealLogID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MealLog)) {
            return false;
        }
        MealLog other = (MealLog) object;
        if ((this.mealLogID == null && other.mealLogID != null) || (this.mealLogID != null && !this.mealLogID.equals(other.mealLogID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "MealLog{" + "mealLogID=" + mealLogID + ", mealLogName=" + mealLogName + ", logTime=" + logTime + ", logDate=" + logDate + ", logNote=" + logNote + ", userID=" + userID + ", foods=" + foods + '}';
    }

    public Double[] getNutrition() {
        return nutrition;
    }

    public void setNutrition() {
        this.nutrition = this.calculateNutrition();
    }
    
    public final Double[] calculateNutrition(){
        double protein = 0;
        double fat = 0;
        double carbs = 0;
        double calories = 0;
        for (MealLogItem item : this.foods){
            protein += item.getActualProtein();
            fat += item.getActualFat();
            carbs += item.getActualCarb();
            calories += item.getActualCalories();
        }
        return new Double[]{protein,fat,carbs,calories};
    }
    
}
