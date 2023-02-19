<%-- 
    Document   : exerciseSearch
    Created on : Feb 19, 2023, 2:19:31 PM
    Author     : khiem
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="/CICOHealth/exercise" method="get">
            <input type="text" name="txtExercise">
            <button type="submit" name="btnSearch">Search</button>
        </form>
        <div class="nav">
            <a class="button" style="vertical-align:middle" href="/view/general/index.jsp"><span>Back </span></a>
            <h1 class="navbar-brand mx-auto">VIEW EXERCISE</h1>
        </div>
        <div class="info-container">
            <div class="info-table">            
                <table id="info-table" class="table table-striped table-hover display">
                    <thead>
                        <tr style="background-color:  greenyellow">
                            <th scope="col">Exercise ID</th>
                            <th scope="col">Exercise Type</th>
                            <th scope="col">Exercise Name</th>
                            <th scope="col">Exercise Description</th>
                            <th scope="col">Calories Per Hour</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="exercise" items="${exerciseList}">
                            <tr>
                                <td>${exercise.exerciseID}</td>
                                <td>${exercise.getExerciseType()}</td>
                                <td>${exercise.exerciseName}</td>
                                <td>${exercise.exerciseDescription}</td>
                                <td>${exercise.caloriesPerHour}</td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
