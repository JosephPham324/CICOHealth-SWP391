<%-- 
    Document   : addexercise
    Created on : Feb 18, 2023, 10:48:21 PM
    Author     : vhqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="/CICOHealth/admin/exercise-management" method="post">
            exerciseID: <input type="text" name="exerciseID">
            exerciseName <input type="text" name="exerciseName">
            exerciseDescription <input type="text" name="exerciseDescription">
            caloriesPerHour <input type="number" name="caloriesPerHour">
            <button name="btnAdd" type="submit">Add</button>
        </form>
    </body>
</html>
