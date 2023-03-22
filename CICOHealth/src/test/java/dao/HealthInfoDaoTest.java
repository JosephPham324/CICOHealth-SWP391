/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dao;

import bean.HealthInfo;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.function.Executable;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class HealthInfoDaoTest {

    public HealthInfoDaoTest() {
    }

    /**
     * Test of createID method, of class HealthInfoDao.
     */
    @Test
    public void testCreateID_0args() {
        System.out.println("createID");
        HealthInfoDao instance = new HealthInfoDao();
        String expResult = "";
        String result = instance.createID();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of createID method, of class HealthInfoDao.
     */
    @Test
    public void testCreateID_String() {
        System.out.println("createID");
        String type = "";
        HealthInfoDao instance = new HealthInfoDao();
        String expResult = "";
        String result = instance.createID(type);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * insertHealthInfo unit test       <br>
     * <hr>
     * USERID test values:              <br>
     * null                             <br>
     * empty                            <br>
     * doesn't exist in the database    <br>
     * exist in database		<br>
     * <hr>
     * WEIGHT test values:              <br>
     * -100                             <br>
     * 0                                <br>
     * 70                               <br>
     * 601                              <br>
     * <hr>
     * HEIGHT test values:              <br>
     * -100                             <br>
     * 14                               <br>
     * 180                              <br>
     * 401                              <br>
     * <hr>
     * AGE test values:                 <br>
     * -11                              <br>
     * 0                                <br>
     * 20                               <br>
     * 201                              <br>
     */
    @Test
    public void testInsertHealthInfo() throws SQLException {
        HealthInfo info = new HealthInfo();

        //UserID
        String NULL_USERID = null;
        String EMPTY_USERID = "";
        String VALID_USERID = "USAD000001";
        String INVALID_USERID = "USER000001";

        //Weight
        int INVALID_WEIGHT_NEGATIVE = -100;
        int INVALID_WEIGHT_LOWERBOUND = 0;
        int VALID_WEIGHT = 70;
        int INVALID_WEIGHT_UPPERBOUND = 601;

        //Height
        int INVALID_HEIGHT_NEGATIVE = -100;
        int INVALID_HEIGHT_LOWERBOUND = 14;
        int VALID_HEIGHT = 170;
        int INVALID_HEIGHT_UPPERBOUND = 401;

        //AGE
        int INVALID_AGE_NEGATIVE = -11;
        int INVALID_AGE_LOWERBOUND = 0;
        int VALID_AGE = 25;
        int INVALID_AGE_UPPERBOUND = 201;

        //Valid values
        info.setUserID(VALID_USERID);
        info.setWeight(VALID_WEIGHT);
        info.setHeight(VALID_HEIGHT);
        info.setAge(VALID_AGE);
        info.setGender(true);
        HealthInfoDao instance = new HealthInfoDao();

        //----------------------------------
        // Test valid input
        //UTC13
        try {
            instance.insertHealthInfo(info);
        } catch (SQLException e) {
            fail("Should not have thrown SQLException with valid input");
        }
        //==================================
        //TEST USERID

        // Test null userID
        //UTCID01
        info.setUserID(NULL_USERID);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with null userID");
        } catch (SQLException e) {
            assertEquals("UserID is null!", e.getMessage());
        }

        // Test empty userID
        //UTCID02
        info.setUserID(EMPTY_USERID);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with empty userID");
        } catch (SQLException e) {
            assertEquals("UserID doesn't exist", e.getMessage());
        }

        // Test invalid userID
        //UTCID03
        info.setUserID(INVALID_USERID);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with not exist userID");
        } catch (SQLException e) {
            assertEquals("UserID doesn't exist", e.getMessage());
        }

        //==================================
        //TEST WEIGHT
        info.setUserID(VALID_USERID);//Reset valid userID

        //Test invalid weight negative value
        //UTCID04
        info.setWeight(INVALID_WEIGHT_NEGATIVE);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid weight");
        } catch (SQLException e) {
            assertEquals("Weight must be greater than 1", e.getMessage());
        }
        //Test invalid weight below boundary
        //UTCID05
        info.setWeight(INVALID_WEIGHT_LOWERBOUND);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid weight");
        } catch (SQLException e) {
            assertEquals("Weight must be greater than 1", e.getMessage());
        }
        //Test invalid weight beyond boundary
        //UTCID06
        info.setWeight(INVALID_WEIGHT_UPPERBOUND);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid weight");
        } catch (SQLException e) {
            assertEquals("Weight must be less than 600", e.getMessage());
        }

        //==================================
        //TEST HEIGHT
        info.setWeight(VALID_WEIGHT);//Reset valid weight

        //Test invalid height negative
        //UTCID07
        info.setHeight(INVALID_HEIGHT_NEGATIVE);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid height");
        } catch (SQLException e) {
            assertEquals("Height must be greater than 15", e.getMessage());
        }

        //Test invalid height negative
        //UTCID08
        info.setHeight(INVALID_HEIGHT_LOWERBOUND);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid height");
        } catch (SQLException e) {
            assertEquals("Height must be greater than 15", e.getMessage());
        }

        //Test invalid height negative
        //UTCID09
        info.setHeight(INVALID_HEIGHT_UPPERBOUND);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid height");
        } catch (SQLException e) {
            assertEquals("Height must be less than 400", e.getMessage());
        }

        //==================================
        //TEST AGE
        info.setHeight(VALID_HEIGHT);//Reset valid weight

        //Test invalid age negative
        //UTCID10
        info.setAge(INVALID_AGE_NEGATIVE);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid age");
        } catch (SQLException e) {
            assertEquals("Age must be greater than 1", e.getMessage());
        }

        //Test invalid age lower boound
        //UTCID11
        info.setAge(INVALID_AGE_LOWERBOUND);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid age");
        } catch (SQLException e) {
            assertEquals("Age must be greater than 1", e.getMessage());
        }
        //Test invalid age upper bound
        //UTCID12
        info.setAge(INVALID_AGE_UPPERBOUND);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid age");
        } catch (SQLException e) {
            assertEquals("Age must be less than 200", e.getMessage());
        }
    }

    /**
     * Test of getHealthInfo method, of class HealthInfoDao.
     */
    @Test
    public void testGetHealthInfo() {
        System.out.println("getHealthInfo");
        String userID = "";
        HealthInfoDao instance = new HealthInfoDao();
        HealthInfo expResult = null;
        HealthInfo result = instance.getHealthInfo(userID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getHistory method, of class HealthInfoDao.
     */
    @Test
    public void testGetHistory() {
        System.out.println("getHistory");
        String userID = "";
        HealthInfoDao instance = new HealthInfoDao();
        List expResult = null;
        List result = instance.getHistory(userID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUpdateHealthInfo method, of class HealthInfoDao.
     */
    @Test
    public void testGetUpdateHealthInfo() throws Exception {
        System.out.println("getUpdateHealthInfo");
        String healthInfoID = "";
        String userID = "";
        HealthInfoDao instance = new HealthInfoDao();
        HealthInfo expResult = null;
        HealthInfo result = instance.getUpdateHealthInfo(healthInfoID, userID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCalorieInRange method, of class HealthInfoDao.
     */
    @Test
    public void testGetCalorieInRange() {
        System.out.println("getCalorieInRange");
        String from = "";
        String to = "";
        String userID = "";
        HealthInfoDao instance = new HealthInfoDao();
        HashMap<Date, Double> expResult = null;
        HashMap<Date, Double> result = instance.getCalorieInRange(from, to, userID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCalorieStatistic method, of class HealthInfoDao.
     */
    @Test
    public void testGetCalorieStatistic() {
        System.out.println("getCalorieStatistic");
        String userID = "";
        HealthInfoDao instance = new HealthInfoDao();
        HashMap<Date, Double> expResult = null;
        HashMap<Date, Double> result = instance.getCalorieStatistic(userID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCalorieStatisticJson method, of class HealthInfoDao.
     */
    @Test
    public void testGetCalorieStatisticJson() {
        System.out.println("getCalorieStatisticJson");
        String userID = "";
        HealthInfoDao instance = new HealthInfoDao();
        String expResult = "";
        String result = instance.getCalorieStatisticJson(userID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCalorieStatisticInRangeJson method, of class HealthInfoDao.
     */
    @Test
    public void testGetCalorieStatisticInRangeJson() {
        System.out.println("getCalorieStatisticInRangeJson");
        String from = "";
        String to = "";
        String userID = "";
        HealthInfoDao instance = new HealthInfoDao();
        String expResult = "";
        String result = instance.getCalorieStatisticInRangeJson(from, to, userID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAverageHealthInfo method, of class HealthInfoDao.
     */
    @Test
    public void testGetAverageHealthInfo() {
        System.out.println("getAverageHealthInfo");
        String from = "";
        String to = "";
        String userID = "";
        HealthInfoDao instance = new HealthInfoDao();
        String expResult = "";
        String result = instance.getAverageHealthInfo(from, to, userID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of main method, of class HealthInfoDao.
     */
    @Test
    public void testMain() {
        System.out.println("main");
        String[] args = null;
        HealthInfoDao.main(args);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

}
