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
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/exercisesearch.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
        <!--FontAwesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="/CICOHealth/assets/scripts/popup.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <form action="/CICOHealth/exercise-search" method="get">
            <input type="text" name="txtExercise">
            <button type="submit" name="btnSearch">Search</button>
        </form>
        <div class="pop-up" id="exercise-log-pop-up">
            <div class="overlay"></div>
            <div class="pop-up-content">Hello</div>
        </div>
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
                            <tr data-type="${exercise.getExerciseType()}" 
                            data-exercise-info="{
                                &quot;exerciseID&quot;: &quot;${exercise.exerciseID}&quot;,
                                &quot;exerciseName&quot;: &quot;${exercise.exerciseName}&quot;,
                                &quot;exerciseType&quot;: &quot;${exercise.getExerciseType()}&quot;,
                                &quot;exerciseDescription&quot;: &quot;${exercise.exerciseDescription}&quot;,
                                &quot;caloriesPerHour&quot;: &quot;${exercise.caloriesPerHour}&quot;
                            }">
                                <td>${exercise.exerciseID}</td>
                                <td>${exercise.getExerciseType()}</td>
                                <td>${exercise.exerciseName}</td>
                                <td>${exercise.exerciseDescription}</td>
                                <td>${exercise.caloriesPerHour}</td>
                                <td class="btn-select"><i class="fa-solid fa-pen-nib" style="color:blue"></i>&nbsp;Log</td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
        <script src="/CICOHealth/assets/scripts/exercisesearch.js"></script>
    </body>
</html>
