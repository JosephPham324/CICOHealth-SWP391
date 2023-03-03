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
@Table(name = "mealLogItem")
@NamedQueries({
    @NamedQuery(name = "MealLogItem.findAll", query = "SELECT m FROM MealLogItem m")})
public class MealLogItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "itemID")
    private String itemID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "itemName")
    private String foodName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "servingWeight")
    private double servingWeight;
    @Basic(optional = false)
    @NotNull
    @Column(name = "proteinPerServing")
    private double protein;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fatPerServing")
    private double fat;
    @Basic(optional = false)
    @NotNull
    @Column(name = "carbPerServing")
    private double carbs;
    @Basic(optional = false)
    @NotNull
    @Column(name = "caloriePerServing")
    private double calories;
    @Basic(optional = false)
    @NotNull
    @Column(name = "actualWeight")
    private double actualWeight;
    @JoinColumn(name = "mealLogID", referencedColumnName = "mealLogID")
    @ManyToOne(optional = false)
    private MealLog mealLogID;

    public MealLogItem() {
    }

    public MealLogItem(String itemID) {
        this.itemID = itemID;
    }

    public MealLogItem(String itemID, String itemName, double servingWeight, double proteinPerServing, double fatPerServing, double carbPerServing, double caloriePerServing, double actualWeight) {
        this.itemID = itemID;
        this.foodName = itemName;
        this.servingWeight = servingWeight;
        this.protein = proteinPerServing;
        this.fat = fatPerServing;
        this.carbs = carbPerServing;
        this.calories = caloriePerServing;
        this.actualWeight = actualWeight;
    }

    public MealLogItem(String foodName, double servingWeight, double protein, double fat, double carbs, double calories, double actualWeight) {
        this.itemID = null;
        this.mealLogID = null;
        this.foodName = foodName;
        this.servingWeight = servingWeight;
        this.protein = protein;
        this.fat = fat;
        this.carbs = carbs;
        this.calories = calories;
        this.actualWeight = actualWeight;
    }
    

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public double getServingWeight() {
        return servingWeight;
    }

    public void setServingWeight(double servingWeight) {
        this.servingWeight = servingWeight;
    }

    public double getProtein() {
        return protein;
    }

    public void setProtein(double protein) {
        this.protein = protein;
    }

    public double getFat() {
        return fat;
    }

    public void setFat(double fat) {
        this.fat = fat;
    }

    public double getCarbs() {
        return carbs;
    }

    public void setCarbs(double carbs) {
        this.carbs = carbs;
    }

    public double getCalories() {
        return calories;
    }

    public void setCalories(double calories) {
        this.calories = calories;
    }

    public double getActualWeight() {
        return actualWeight;
    }

    public void setActualWeight(double actualWeight) {
        this.actualWeight = actualWeight;
    }

    public MealLog getMealLogID() {
        return mealLogID;
    }

    public void setMealLogID(MealLog mealLogID) {
        this.mealLogID = mealLogID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (itemID != null ? itemID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MealLogItem)) {
            return false;
        }
        MealLogItem other = (MealLogItem) object;
        if ((this.itemID == null && other.itemID != null) || (this.itemID != null && !this.itemID.equals(other.itemID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "MealLogItem{" + "itemID=" + itemID + ", foodName=" + foodName + ", servingWeight=" + servingWeight + ", protein=" + protein + ", fat=" + fat + ", carbs=" + carbs + ", calories=" + calories + ", actualWeight=" + actualWeight + ", mealLogID=" + mealLogID + '}';
    }
    
    public double getActualProtein(){
        return this.protein * (actualWeight / this.servingWeight);
    }
    public double getActualFat(){
        return this.fat * (actualWeight / this.servingWeight);
    }
    public double getActualCarb(){
        return this.carbs * (actualWeight / this.servingWeight);
    }
    public double getActualCalories(){
        return this.calories * (actualWeight / this.servingWeight);
    }
}
