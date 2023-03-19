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

    @Test
    public void testInsertHealthInfo() throws SQLException {
        HealthInfo info = new HealthInfo();
        //Valid values
        info.setUserID("USME000001");
        info.setWeight(70);
        info.setHeight(170);
        info.setAge(25);
        info.setGender(true);
        HealthInfoDao instance = new HealthInfoDao();

        // Test valid input
        //UTC13
        try {
            instance.insertHealthInfo(info);
        } catch (SQLException e) {
            fail("Should not have thrown SQLException with valid input");
        }

        // Test null userID
        //UTCID01
        info.setUserID(null);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with null userID");
        } catch (SQLException e) {
            assertEquals("UserID is null!", e.getMessage());
        }

        //Test invalid weight below boundary
        //UTCID05
        info.setUserID("USME000001");
        info.setWeight(0);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid weight");
        } catch (SQLException e) {
            assertEquals("Weight must be greater than 1", e.getMessage());
        }
        //Test invalid height beyond boundary
        //UTCID09
        info.setWeight(70);
        info.setHeight(401);
        try {
            instance.insertHealthInfo(info);
            fail("Should have thrown SQLException with invalid weight");
        } catch (SQLException e) {
            assertEquals("Height must be less than than 400", e.getMessage());
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
