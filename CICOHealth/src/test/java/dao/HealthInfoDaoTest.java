/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dao;

import bean.HealthInfo;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

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
     * Test of insertHealthInfo method, of class HealthInfoDao.
     */
    @Test
    public void testInsertHealthInfo() throws Exception {
        System.out.println("insertHealthInfo");
        HealthInfo healthInfo = null;
        HealthInfoDao instance = new HealthInfoDao();
        instance.insertHealthInfo(healthInfo);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
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
